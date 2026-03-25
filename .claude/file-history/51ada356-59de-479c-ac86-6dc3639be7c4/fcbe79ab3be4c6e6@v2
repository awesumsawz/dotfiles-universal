---
name: mcp-verify-after-build
description: Use Chrome DevTools MCP to verify each section after yarn build
type: feedback
---

After every `yarn build`, use `mcp__chrome-devtools__*` to verify the new section renders correctly before declaring it done.

**Why:** Several bugs have been caught this way that weren't visible from code alone — broken image 404s (naturalWidth: 0), invisible carousel slides (aria-hidden), SCSS nesting errors (block inside wrong parent).

**How to apply:**
1. `navigate_page` with `ignoreCache: true`
2. `evaluate_script` to scroll section into view
3. `take_screenshot` to visually confirm
4. If something looks wrong, `evaluate_script` to inspect computed styles, aria attrs, image load state
