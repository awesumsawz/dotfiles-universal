# Plan: Apply Image Optimization to All Templates + Header/Footer

## Context
Following Lighthouse-focused improvements made to `page-mens-hrt-enhanced-pdp-1.php`, the same
set of optimizations needs to be applied consistently across 10 additional page templates and the
shared template parts (navbar, footer, carousel navigation, etc.). The changes target CLS
reduction, faster LCP, and accessibility compliance:

- `width` + `height` on every `<img>` (intrinsic aspect ratio → eliminates layout shift)
- `loading="lazy"` on all below-fold images
- `decoding="async"` on all images (including above-fold)
- `poster` on any `<video>` elements (none found in scope)
- Descriptive `alt` text replacing empty strings or filename values

---

## Files to Modify

### Shared Template Parts (highest leverage — fix once, affects all templates)

| File | Images | Changes |
|------|--------|---------|
| `src/template-parts/navbar.php` | `logo-full.png` (284×48) | Add `width="284" height="48" decoding="async"` |
| `src/footer.php` | `footer-hone-logo.svg`, LegitScript badge | Add `width`/`height` + `decoding="async"` to both |
| `src/template-parts/carousel-navigation.php` | `arrow-circle_left/right.svg` (48×48) | Add `width="48" height="48" loading="lazy" decoding="async"` |
| `src/template-parts/slick-navigation.php` | Same arrows | Same as above |
| `src/template-parts/cta-block.php` | `triangle-filled-right-3.svg` | Add `width`/`height` `decoding="async"` (no lazy — in CTA) |
| `src/template-parts/image.php` | Helper function | Add `decoding="async"` to emitted `<img>` tag |

SVG dimensions to verify at implementation time with `sips`/`grep` on viewBox:
- `footer-hone-logo.svg`: natural viewBox reported as ~1440×282 — use `width="160" height="31"` (rendered display size) or intrinsic; confirm by checking CSS
- `triangle-filled-right-3.svg`: small arrow icon — check viewBox

### Page Templates (10 files in `src/`)

All 10 follow the same treatment pattern:

**Hero image** (first `<img>` in each template):
- Most already have `width`, `height`, `fetchpriority="high"` and a `style="aspect-ratio:..."`
- Add `decoding="async"` to all hero images
- For `page-womens-hormone-imbalance.php` and `page-mens-opt-comparison.php` heroes — these are missing ALL dimension attributes; measure and add them

**All below-fold images**: add `loading="lazy" decoding="async"` + measured `width`/`height`

**Empty alt text fixes** (see below)

#### Template-by-template notes

| Template | Special notes |
|----------|--------------|
| `page-overview-3.php` | 5 carousel review images use `alt=""` — replace with `"Hone customer review"` |
| `page-overview-pricing.php` | Same structure as overview-3; same carousel empty-alt fix |
| `page-overview-hormone-optimization-pricing.php` | 3 static review images (lines 243, 252, 261) with `alt=""` — add descriptive text matching the reviewer/image context |
| `page-overview-hormone-optimization.php` | Same pattern as above (lines 241, 250, 259) |
| `page-womens-hormone-imbalance.php` | Hero missing all dimension attrs; `rating-stars.webp` has empty alt — add `"5-star rating"` |
| `page-article-hrt-overview.php` | `longform-item-4-dt.webp` has empty alt (add description); carousel review images (13×) use `alt=""` — add `"Hone customer review"` |
| `page-article-trt-pmax.php` | Same as hrt-overview; `longform-item-4-dt.webp` empty alt + carousel images |
| `page-mens-opt-comparison.php` | Hero missing all dimensions; 5 carousel review images with `alt=""`; comparison table check/x SVGs already have alt |
| `page-mens-trt-forbes.php` | 5 carousel review images with `alt=""` |
| `page-overview-tiktok.php` | 7 carousel review images with `alt=""` |

---

## Dimension Measurement Approach

At implementation time, run `sips -g pixelWidth -g pixelHeight` for every image that needs
dimensions. Key shared images (used across multiple templates) measured once:

| Image | Likely dimensions | Used in |
|-------|------------------|---------|
| `listicle-item-1/2/3/4-tb.webp` | Measure at impl | overview-3, overview-pricing, mens-trt-forbes |
| `listicle-item-5/6/7/8-tb.webp` | Measure at impl | mens-opt-comparison |
| `included-1/2/3/4.webp` | Measure at impl | Multiple |
| `ppd-dt.webp`, `ppd.webp`, `ppd-2-.webp` | Measure at impl | Multiple |
| `icons/price-tag.webp` | Measure at impl | Multiple |
| `logo-full.png` | 284×48 (confirmed) | navbar.php |

---

## Implementation Order

1. **Template parts** — `navbar.php`, `footer.php`, `carousel-navigation.php`, `slick-navigation.php`, `cta-block.php`, `image.php`
2. **Measure all shared image dimensions** (single sips batch command)
3. **Templates** — work through all 10; group similar ones (overview-3 + overview-pricing share nearly identical markup)

---

## Verification

- Load `localhost:8081/test` and check for visible layout shift in DevTools → Performance tab
- Run Lighthouse on each page to confirm CLS score improvement
- Inspect Elements panel on a few pages to verify `loading`, `decoding`, `width`, `height` are present
- Run `yarn build` to copy changes to `build/` before committing
