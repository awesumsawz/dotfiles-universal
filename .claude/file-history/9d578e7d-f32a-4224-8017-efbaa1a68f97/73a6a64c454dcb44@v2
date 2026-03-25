---
name: slick-aria-hidden-fix
description: Global CSS hides Slick's aria-hidden slides; must override in SCSS for infinite carousels
type: feedback
---

Always add `.slick-slide[aria-hidden="true"] { display: block !important; }` inside any Slick carousel's SCSS block when using `infinite: true`.

**Why:** The theme's `main.min.css` has `[aria-hidden="true"] { display: none !important }`. Slick sets `aria-hidden="true"` on all non-visible slides when `infinite: true` (clones included). This makes the entire carousel content invisible. `accessibility: false` in Slick options does NOT prevent this — it only disables keyboard nav.

**How to apply:** Any Slick carousel with `infinite: true` or `centerMode: true` needs the override. Carousels with `infinite: false` are safe (no clones, no aria-hidden="true" slides).
