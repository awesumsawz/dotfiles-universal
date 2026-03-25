# Page Speed Optimization Findings

## Baseline Analysis Method
1. `npx lighthouse http://localhost:8081/{slug}/ --output=json --only-categories=performance --chrome-flags="--headless"`
2. Chrome DevTools MCP: navigate_page → performance_start_trace (reload+autoStop) → analyze_insight

## Confirmed Wins (applied to mens-hrt-enhanced-pdp-1)

### Dequeue WordPress block library CSS
```php
wp_dequeue_style('wp-block-library');
wp_dequeue_style('wp-block-library-theme');
wp_dequeue_style('global-styles');
```
Add inside the template's `wp_enqueue_scripts` action. Saves ~15KB unused CSS.

### Move jQuery to footer
```php
wp_scripts()->add_data('jquery', 'group', 1);
wp_scripts()->add_data('jquery-core', 'group', 1);
wp_scripts()->add_data('jquery-migrate', 'group', 1);
```
Safe for landing pages — GTM/FB/TikTok pixels don't use jQuery. Our page JS declares jQuery as a dependency so WordPress handles ordering automatically.

### Preload LCP image with fetchpriority=high
```php
add_action('wp_head', function() use ($video_directory) {
    echo '<link rel="preload" href="' . esc_url($video_directory . '/hero-trt-vial-with-text.webp') . '" as="image" fetchpriority="high" />' . "\n";
}, 1);
```
Fixes "LCP request discovery" Lighthouse audit.

### Preload DMSans-Regular and DMSans-Medium in header.php
These fonts are in the critical path (discovered from main.min.css) but were missing from the preload list. Add BEFORE the other font preloads:
```html
<link rel="preload" href=".../DMSans-Regular.woff2" as="font" type="font/woff2" crossorigin="anonymous" />
<link rel="preload" href=".../DMSans-Medium.woff2" as="font" type="font/woff2" crossorigin="anonymous" />
```

### Remove unused Trustpilot widget script
Templates using only static Trustpilot markup (no `<div class="trustpilot-widget">`) don't need `//widget.trustpilot.com/bootstrap/v5/tp.widget.bootstrap.min.js`. It makes a 307 HTTP→HTTPS redirect and is dead code.

### Lazy-load hero video sources via JS
For hero `<video autoplay>` elements, remove `<source>` tags from HTML and inject them via DOMContentLoaded JS. This prevents the browser's video playback pipeline setup from delaying the poster image LCP:
```html
<video id="hero-video" autoplay muted loop playsinline width="600" height="600" poster="...">
</video>
```
```js
function initHeroVideo() {
    const video = document.getElementById('hero-video');
    if (!video || !window.honePageData) return;
    const base = window.honePageData.themeFolder + '/static/media/videos';
    const webm = document.createElement('source');
    webm.src = base + '/hero-trt-vial-with-text--dt.webm';
    webm.type = 'video/webm';
    const mp4 = document.createElement('source');
    mp4.src = base + '/hero-trt-vial-with-text--dt.mp4';
    mp4.type = 'video/mp4';
    video.append(webm, mp4);
    video.load();
    video.play().catch(() => {});
}
```

## Known LCP Ceiling: ~4.4s (Lighthouse throttled)
With an autoplay `<video>` as the hero + GTM loading 4MB of 3rd-party JS (TikTok, Facebook, Mixpanel, Reddit), Lighthouse's Lantern simulation consistently shows LCP ~4.4s. This is not fixable from the template without:
- Deferring GTM (business decision, lives in header.php)
- Replacing hero `<video>` with static `<img>` + lazy video

## What Does NOT Help (tried and tested)
- `preload="none"` on autoplay video: Hurts Speed Index (page looks incomplete longer). Score drops.
- Reverting DMSans-Regular/Medium preloads: FCP worsens from 0.9s → 1.2s. Score drops.
- Adding `<link rel="preload">` for DMSans-Medium/Regular AND keeping variable font preloads: Both the variable and static fonts download (redundant). Investigated but not changed — would need fonts.scss refactor.

## Remaining Blockers (not addressable from template)
- TTI 13.9s: GTM loads ~4MB of 3rd-party scripts (TikTok 642KB, Facebook 627KB, etc.)
- Cache lifetimes: Apache/WordPress server config
- bfcache: WordPress server-side issue

## Results Achieved (mens-hrt-enhanced-pdp-1)
| Metric | Before | After |
|--------|--------|-------|
| Score | 81 | 84 |
| FCP | 1.5s | 0.9s |
| LCP | 4.5s | 4.4s |
| TBT | 180ms | 110ms |
| Speed Index | 2.2s | 2.2s |
| Render-blocking resources | 770ms savings | 240ms savings |
