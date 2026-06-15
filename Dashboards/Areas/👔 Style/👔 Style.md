---
type: area
area: style
tags: [area, style]
---

> [!tip] 👔 Style — area dashboard
> Capsule wardrobe, closet inventory, outfit log, planned purchases. Kate's domain — she reasons over this when picking daily outfits and judging purchases.

---

## 🧭 Capsule overview

| Category | Pieces | Gaps |
|---|---|---|
| Suits / blazers |  |  |
| Shirts |  |  |
| Knits |  |  |
| Pants |  |  |
| Denim |  |  |
| Shoes |  |  |
| Outerwear |  |  |
| Accessories |  |  |

---

## 👚 Closet inventory

```dataview
TABLE WITHOUT ID
  file.link as "Piece",
  category as "Category",
  color as "Color",
  brand as "Brand",
  season as "Season",
  condition as "Condition"
FROM "Notes"
WHERE type = "closet-piece"
SORT category ASC, color ASC
```

```button
name ➕ Add piece to closet
type note
action closet-piece
templater true
```

---

## 📅 Outfit log

```dataview
TABLE WITHOUT ID
  date as "Date",
  occasion as "Occasion",
  pieces as "Pieces",
  rating as "★"
FROM "Notes"
WHERE type = "outfit"
SORT date DESC
LIMIT 21
```

```button
name ➕ Log outfit
type note
action outfit
templater true
```

---

## 🛍️ Wishlist & planned purchases

```dataview
TABLE WITHOUT ID
  file.link as "Item",
  category as "Category",
  brand as "Brand",
  price_usd as "$",
  priority as "Priority",
  status as "Status"
FROM "Notes"
WHERE type = "wishlist-item"
SORT priority ASC, price_usd ASC
```

```button
name ➕ Add to wishlist
type note
action wishlist-item
templater true
```

---

## 📐 Style rules

- [[styles et al|Style rules — colors, fits, what to avoid]]
- Color palette anchors:
- Fit preferences:
- Brands to favor / avoid:

---

## 🔗 External

- [[Home|↩ back to Home]]
