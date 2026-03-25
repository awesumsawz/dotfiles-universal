# Technical Plan: Fix WOPT Waypoints (19817)

## Context

On all women's WOPT landing pages, clicking the "Get Started" / "I'm Ready To Start" button at the end of the quiz navigates to `#whats-included`, but the page stops at the listicle (`#longform` — the numbered "1. Test What Matters / 2. Get Clear / 3. Follow a Personalized Plan" section) instead of the correct target.

The `#longform` section appears ABOVE `#whats-included` in the DOM. The native browser anchor navigation is calculating the wrong scroll target position — likely due to the quiz wrapper's CSS `min-height` causing a layout reflow when quiz results appear, which shifts section positions before the browser's scroll calculation completes.

The fix: replace native anchor navigation with explicit JS `scrollIntoView()` in `bindClickEvents()` — already the right place for this logic. This also handles the "Still Thinking About It" button (`href="#treatment-with-hone"`).

## Affected Pages / Files

| URL | JS Bundle (src) |
|-----|-----------------|
| /womens-opt/hormone-imbalance | `src/static/js/pages/womens-hormone-imbalance.bundle.js` |
| /womens-opt/hormone-imbalance/pmax | `src/static/js/pages/womens-hormone-imbalance-pmax.bundle.js` |
| /womens-opt/hormone-imbalance/tt | `src/static/js/pages/womens-hormone-imbalance-tt.bundle.js` |
| /womens-opt/hormone-imbalance/hero | `src/static/js/pages/womens-hormone-imbalance-hero.bundle.js` |
| /womens-opt/menopause-treatment | `src/static/js/pages/womens-menopause.bundle.js` |
| /womens-opt/menopause-treatment/tt | `src/static/js/pages/womens-menopause-tt.bundle.js` |

## Change

In each of the 6 bundle files, update `bindClickEvents()` to intercept anchor clicks and use `scrollIntoView`:

**Before:**
```javascript
function bindClickEvents() {
    let ctaButtons = document.getElementsByClassName('quiz-end-cta');
    if (ctaButtons) {
        Array.from(ctaButtons).forEach((button) => {
            button.addEventListener("click", (e) => {
                if (typeof trackQuizEvent === 'function') {
                    trackQuizEvent('last_question', e.target.innerText);
                }
            });
        });
    }
}
```

**After:**
```javascript
function bindClickEvents() {
    let ctaButtons = document.getElementsByClassName('quiz-end-cta');
    if (ctaButtons) {
        Array.from(ctaButtons).forEach((button) => {
            button.addEventListener("click", (e) => {
                if (typeof trackQuizEvent === 'function') {
                    trackQuizEvent('last_question', e.target.innerText);
                }
                const href = button.getAttribute('href');
                if (href && href.startsWith('#')) {
                    e.preventDefault();
                    const target = document.querySelector(href);
                    if (target) {
                        target.scrollIntoView({ behavior: 'smooth' });
                    }
                }
            });
        });
    }
}
```

This handles both quiz CTA buttons:
- `href="#whats-included"` → "I'm Ready To Start" (primary fix)
- `href="#treatment-with-hone"` → "Still Thinking About It"

## Build Step

After editing all 6 source files, run from the theme directory:
```
yarn build
```

This compiles and copies all assets (including the updated JS bundles) to `build/`.

## Verification

1. Open any affected page (e.g., `/womens-opt/hormone-imbalance/pmax` locally at http://localhost:8081)
2. Complete all 5 quiz questions
3. Click "I'm Ready To Start"
4. Confirm the page smoothly scrolls to the "What's Included" section (the `default-callout-ppd` section with pricing/PPD content), NOT the listicle (`#longform`)
5. Also verify "Still Thinking About It" scrolls to the `#treatment-with-hone` section
6. Test on mobile viewport (< 768px) and desktop (≥ 1024px)
7. Repeat on all 5 URLs listed above
