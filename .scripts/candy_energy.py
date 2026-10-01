#!/usr/bin/env python3
"""Candy's weekly calorie budget — deterministic, from vault logs only.

TDEE: adaptive (mean logged intake − trend-weight change × kcal/lb) once enough data exists;
otherwise the cold-start estimate from crew-config. Budget = TDEE − deficit for the allowed pace,
clamped to the BMR floor, with muscle-preservation guardrails that can only make the deficit smaller.

Usage: candy_energy.py <vault> [--today YYYY-MM-DD] [--json]
Reads:  Notes/Logs/*workout.md, *whoop.md, *weigh-in.md ; Notes/Reference/crew-config.md (## candy)
"""
import argparse, datetime as dt, json, os, re, statistics as st

DEFAULTS = dict(bmr=2002, tdee_cold=(2400, 2600), kcal_per_lb=3500, window=21, min_days=14,
                min_weighins=10, min_intake_days=10, pace=(0.7, 1.0), step=100,
                prot_train=1.0, prot_rest=0.95, hrv_rest_below=19.0, hrv_full=22.0,
                train_shift=150, max_pct_bw=1.0)
ROTATION = ['strength', 'run', 'strength', 'run', 'strength', 'hiit', 'rest']   # Mon..Sun (Templates/workout.md)
HARD = {'strength', 'hiit'}


def num(v):
    try:
        return float(str(v).strip().strip('"\''))
    except (TypeError, ValueError):
        return None


def frontmatter(path):
    t = open(path, encoding='utf-8').read()
    m = re.match(r'^(?:<%\*.*?%>)?---\n(.*?)\n---', t, re.S)
    fm = {}
    if m:
        for line in m.group(1).splitlines():
            k, _, v = line.partition(':')
            if _ and not line.startswith(' '):
                fm[k.strip()] = v.strip()
    return fm, t


def read_config(vault):
    cfg = dict(DEFAULTS)
    p = os.path.join(vault, 'Notes/Reference/crew-config.md')
    if not os.path.exists(p):
        return cfg, ['crew-config not found — using built-in defaults']
    s = open(p, encoding='utf-8').read()
    m = re.search(r'^## candy\n(.*?)(?=^## |\Z)', s, re.S | re.M)
    sec = m.group(1) if m else ''
    def grab(key):
        mm = re.search(r'^- ' + re.escape(key) + r':\s*([^\n<]*)', sec, re.M)
        return mm.group(1).strip() if mm else None
    notes = []
    if (v := num((grab('bmr_cal') or '').split()[0] if grab('bmr_cal') else None)):
        cfg['bmr'] = v
    if (v := grab('tdee_estimate_cal')) and (r := re.findall(r'\d{3,5}', v)):
        cfg['tdee_cold'] = (float(r[0]), float(r[-1]))
    if (v := grab('pace_lbs_per_week')) and (r := re.findall(r'\d+(?:\.\d+)?', v)):
        cfg['pace'] = (float(r[0]), float(r[-1]))
    if (v := grab('protein_formula')) and (r := re.findall(r'\d+(?:\.\d+)?', v)):
        cfg['prot_train'], cfg['prot_rest'] = float(r[0]), float(r[1]) if len(r) > 1 else float(r[0])
    if (v := grab('rest_below')) and (r := re.findall(r'\d+(?:\.\d+)?', v)):
        cfg['hrv_rest_below'] = float(r[0])
    if (v := grab('full_at_or_above')) and (r := re.findall(r'\d+(?:\.\d+)?', v)):
        cfg['hrv_full'] = float(r[0])
    return cfg, notes


def load_days(vault):
    logs = os.path.join(vault, 'Notes/Logs')
    days = {}
    for f in sorted(os.listdir(logs)):
        m = re.match(r'(\d{4}-\d{2}-\d{2}) (workout|whoop|weigh-in)\.md$', f)
        if not m:
            continue
        d = dt.date.fromisoformat(m.group(1))
        fm, body = frontmatter(os.path.join(logs, f))
        rec = days.setdefault(d, {})
        w = num(fm.get('weight_lbs')) or num(fm.get('weight_lb'))
        if w: rec['weight'] = w
        if (c := num(fm.get('calories_total'))): rec['kcal'] = c
        if (p := num(fm.get('protein_g'))): rec['protein'] = p
        if (h := num(fm.get('hrv_ms')) or num(fm.get('hrv'))): rec['hrv'] = h
        if fm.get('session_type'): rec['session'] = fm['session_type'].strip('"\'')
        if m.group(2) == 'workout':
            rec['short'] = bool(re.search(r'\*\*Result:\*\*\s*SHORT', body))
            lifts = {}
            for name, sets, reps, wt in re.findall(r'^- ([A-Za-z][^:\n]+):\s*(\d+)\s*[×x]\s*(\d+)\s*@\s*(\d+(?:\.\d+)?)', body, re.M):
                lifts[name.strip().lower()] = float(sets) * float(reps) * float(wt)   # volume load
            if lifts: rec['lifts'] = lifts
    return days


def slope_lb_per_day(points):
    xs = [(d - points[0][0]).days for d, _ in points]; ys = [w for _, w in points]
    mx, my = st.mean(xs), st.mean(ys)
    den = sum((x - mx) ** 2 for x in xs)
    return sum((x - mx) * (y - my) for x, y in zip(xs, ys)) / den if den else 0.0


def main():
    ap = argparse.ArgumentParser(); ap.add_argument('vault'); ap.add_argument('--today'); ap.add_argument('--json', action='store_true')
    a = ap.parse_args()
    today = dt.date.fromisoformat(a.today) if a.today else dt.date.today()
    cfg, notes = read_config(a.vault)
    days = load_days(a.vault)
    win = [d for d in days if today - dt.timedelta(days=cfg['window']) < d <= today]
    weigh = sorted((d, days[d]['weight']) for d in win if 'weight' in days[d])
    intake = [days[d]['kcal'] for d in win if 'kcal' in days[d]]
    last_w = next((days[d]['weight'] for d in sorted(days, reverse=True) if 'weight' in days[d]), None)
    span = (weigh[-1][0] - weigh[0][0]).days if len(weigh) > 1 else 0

    out = {'date': today.isoformat(), 'window_days': cfg['window'], 'weigh_ins': len(weigh), 'intake_days': len(intake),
           'latest_weight': last_w, 'flags': list(notes)}
    # ── TDEE
    adaptive = span >= cfg['min_days'] and len(weigh) >= cfg['min_weighins'] and len(intake) >= cfg['min_intake_days']
    if adaptive:
        slope = slope_lb_per_day(weigh)
        tdee = st.mean(intake) - slope * cfg['kcal_per_lb']
        out.update(method='adaptive', trend_lb_per_week=round(slope * 7, 2), mean_intake=round(st.mean(intake)), tdee=round(tdee))
        tdee_lo = tdee_hi = tdee
    else:
        tdee_lo, tdee_hi = cfg['tdee_cold']; tdee = (tdee_lo + tdee_hi) / 2
        out.update(method='cold-start', tdee=round(tdee), tdee_range=[round(tdee_lo), round(tdee_hi)],
                   needs=f"adaptive TDEE after ≥{cfg['min_days']} days spanned with ≥{cfg['min_weighins']} weigh-ins and ≥{cfg['min_intake_days']} intake logs (have: {span} d, {len(weigh)}, {len(intake)})")
        if len(weigh) > 1:
            out['trend_lb_per_week_unreliable'] = round(slope_lb_per_day(weigh) * 7, 2)

    # ── Muscle-preservation guardrails (can only shrink the deficit)
    reasons = []
    prot_days = [(d, days[d]) for d in win if 'protein' in days[d] and 'weight' in days[d]]
    if prot_days:
        hit = sum(1 for d, r in prot_days if r['protein'] >= (cfg['prot_train'] if r.get('session') in HARD | {'run'} else cfg['prot_rest']) * r['weight'] * 0.97)
        out['protein_hit'] = f"{hit}/{len(prot_days)} logged days"
        if hit / len(prot_days) < 0.8: reasons.append('protein under formula on >20% of logged days')
    else:
        out['flags'].append('protein not logged — muscle-protection check incomplete')
    hrv = [days[d]['hrv'] for d in sorted(win)[-7:] if 'hrv' in days[d]]
    if len(hrv) >= 4:
        out['hrv_7d_mean'] = round(st.mean(hrv), 1)
        if st.mean(hrv) < cfg['hrv_full']: reasons.append(f"HRV 7-day mean {st.mean(hrv):.1f} ms below {cfg['hrv_full']:.0f}")
    shorts = sum(1 for d in win if days[d].get('short'))
    if shorts >= 2: reasons.append(f'{shorts} sessions logged SHORT in window')
    # lift trend: same lift, last two sessions, volume load down
    hist = {}
    for d in sorted(days):
        for k, v in days[d].get('lifts', {}).items(): hist.setdefault(k, []).append(v)
    down = [k for k, v in hist.items() if len(v) >= 3 and v[-1] <= v[-2] <= v[-3]]
    if not hist: out['flags'].append('no exercise lines logged — strength trend unknown')
    if len(down) >= 2: reasons.append(f'lifts flat/down 3 sessions: {", ".join(down)}')
    if adaptive and last_w and -out['trend_lb_per_week'] > last_w * cfg['max_pct_bw'] / 100:
        reasons.append(f"losing faster than {cfg['max_pct_bw']}% bodyweight/week")

    # ── Pace and budget
    lo, hi = cfg['pace']
    green = adaptive and not reasons
    pace = hi if green else lo                      # start at the low end; only move up with real data and green guardrails
    deficit = pace * cfg['kcal_per_lb'] / 7
    if reasons: deficit = max(0, deficit - cfg['step']); out['guardrails'] = reasons
    daily = max(cfg['bmr'], tdee - deficit)
    if tdee - deficit < cfg['bmr']: out['flags'].append(f"pace {pace} lb/wk would need intake below BMR ({cfg['bmr']:.0f}) — floored")
    weekly = round(daily * 7, -1)
    shift = cfg['train_shift']
    n_hard = sum(1 for s in ROTATION if s in HARD)
    hard_day = daily + shift
    easy = (weekly - n_hard * hard_day) / (7 - n_hard)
    if easy < cfg['bmr']:                            # never put an easy day below BMR; shrink the shift instead
        easy = cfg['bmr']; hard_day = (weekly - (7 - n_hard) * easy) / n_hard
    split = {s: round(hard_day if s in HARD else easy, -1) for s in ('strength', 'hiit', 'run', 'rest')}
    out.update(pace_lb_per_week=pace, daily_deficit=round(deficit), daily_avg=round(daily, -1), weekly_budget=weekly,
               by_session=split,
               protein_today_g=round(last_w * cfg['prot_train']) if last_w else None,
               implied_pace_range=[round((tdee_lo - daily) * 7 / cfg['kcal_per_lb'], 2), round((tdee_hi - daily) * 7 / cfg['kcal_per_lb'], 2)])
    if a.json:
        print(json.dumps(out, indent=2)); return
    print(f"Weekly calorie budget — {out['date']} ({out['method']})")
    print(f"- TDEE: {out['tdee']} kcal/day" + (f" (range {out['tdee_range'][0]}–{out['tdee_range'][1]}, estimate)" if not adaptive else f" (intake {out['mean_intake']} − trend {out['trend_lb_per_week']} lb/wk)"))
    print(f"- Pace: {pace} lb/wk → deficit {out['daily_deficit']} kcal/day → **{weekly:.0f} kcal/week** (avg {out['daily_avg']:.0f}/day)")
    print(f"- By day: strength/HIIT {split['strength']:.0f} · Zone 2 {split['run']:.0f} · rest {split['rest']:.0f}")
    if not adaptive: print(f"- Implied pace if TDEE is {out['tdee_range'][0]}–{out['tdee_range'][1]}: {out['implied_pace_range'][0]}–{out['implied_pace_range'][1]} lb/wk")
    if out.get('protein_today_g'): print(f"- Protein (training day, formula): {out['protein_today_g']} g")
    for r in out.get('guardrails', []): print(f"- ⚠️ guardrail: {r} → deficit eased {cfg['step']} kcal/day")
    for f in out['flags']: print(f"- note: {f}")
    if not adaptive: print(f"- {out['needs']}")


if __name__ == '__main__':
    main()
