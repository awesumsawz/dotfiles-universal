# AI Autocomplete Toggle

This configuration provides a way to toggle AI-powered autocomplete features on and off while preserving regular "dumb" autocomplete functionality. Perfect for coding challenges like LeetCode where you want to solve problems without AI assistance.

## Features

- **Toggle AI Features**: Easily enable/disable GitHub Copilot and Avante
- **Preserve Regular Completion**: LSP, snippets, and buffer completion remain active
- **Visual Status Indicator**: See AI status in your status line
- **Multiple Control Methods**: Keybindings, commands, and functions

## Usage

### Keybindings

- `<leader>ta` - Toggle AI autocomplete on/off

### Commands

- `:AIToggle` - Toggle AI autocomplete
- `:AIDisable` - Disable AI autocomplete
- `:AIEnable` - Enable AI autocomplete  
- `:AIStatus` - Show current AI status

### Copilot Keybindings (when AI is enabled)

- `<C-F>` - Accept Copilot suggestion
- `<C-]>` - Dismiss Copilot suggestion
- `<C-\>` - Trigger Copilot suggestion
- `<M-]>` - Next Copilot suggestion
- `<M-[>` - Previous Copilot suggestion

## What Gets Toggled

### When AI is DISABLED:
- ❌ GitHub Copilot suggestions
- ❌ Avante AI chat assistant
- ✅ LSP completion (language server)
- ✅ Snippet completion
- ✅ Buffer word completion
- ✅ All regular nvim-cmp functionality

### When AI is ENABLED:
- ✅ All of the above plus AI features

## Status Indicator

The status line shows:
- 🤖 AI ON (green) - AI features are active
- 🚫 AI OFF (red) - AI features are disabled

## Perfect for LeetCode

When working on coding challenges:

1. Press `<leader>ta` to disable AI
2. Solve your problem with just regular autocomplete
3. Press `<leader>ta` again to re-enable AI for regular development

This way you get the best of both worlds - no spoilers during problem-solving, but full AI assistance for regular coding tasks. 