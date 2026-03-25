---
name: figma-image-asset-pattern
description: Never use Figma MCP asset URLs in PHP; use template path + bg-color fallback
type: feedback
---

Never put `https://www.figma.com/api/mcp/asset/...` URLs into PHP templates. They expire in 7 days.

**Why:** Figma MCP asset URLs are temporary. Using them produces working code for a week then breaks permanently.

**How to apply:**
- Reference the expected final path: `$theme_folder . '/static/media/images/' . $template_name . '/filename.webp'`
- Add `style="background-color: #hex"` on the image's parent container as fallback
- The bg-color shows through if the image hasn't been dropped in yet, making placeholders look intentional
- Only use `placehold.co` when there is no known expected filename at all
