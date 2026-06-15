---
tags:
  - quick
  - x2
Follow up:
---

Link:
[[2025-12-29 Testing system]]
[[2025-12-29 Schematics for X2]]

---
### 🧠 Note

This is an estimate, but shouldn't be too far from this (broken down per agent):

Per-Agent Token Usage:

  A4                            68,202 tokens (prompt:  52,548, completion:  15,654)
  A7                            67,676 tokens (prompt:  55,619, completion:  12,057)
  A10                           54,740 tokens (prompt:  42,994, completion:  11,746)
  A6                            50,832 tokens (prompt:  39,321, completion:  11,511)
  A11                           37,428 tokens (prompt:  24,955, completion:  12,473)
  MDAdvisor                     23,985 tokens (prompt:  16,486, completion:   7,499)
  A24                           23,445 tokens (prompt:   5,287, completion:  18,158)
  A5                            16,680 tokens (prompt:   4,184, completion:  12,496)
  A26                           15,863 tokens (prompt:  14,100, completion:   1,763)
  A3                            12,466 tokens (prompt:   5,327, completion:   7,139)
  PerceivedBenefitAssessor      11,804 tokens (prompt:   4,128, completion:   7,676)
  A2                            10,875 tokens (prompt:   1,957, completion:   8,918)
  A20                            6,728 tokens (prompt:   1,101, completion:   5,627)
  A1                             5,155 tokens (prompt:   1,216, completion:   3,939)
  A23                            4,865 tokens (prompt:     930, completion:   3,935)


Token Usage Totals:

  Total tokens: 410,744
  Prompt tokens: 270,153
  Completion tokens: 140,591


OpenAI GPT 5 input token cost (per 1M tokens) = $1.25
OpenAI GPT 5 output token cost (per 1M tokens) = $10

total = ((270153 / 1000000) * $1.25) + ((140591/1000000)* $10) = $0.34 + $1.41 = ~$1.75


if we do 100 indications: ~$250 (including some cushion + variability)