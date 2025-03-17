return {
  "github/copilot.vim",
  config = function()
    vim.keymap.set('i', '<C-F>', function() return vim.fn['copilot#Accept']("\\<CR>") end, {
      expr = true,
      replace_keycodes = false
    })
    vim.g.copilot_no_tab_map = true
  end,
}
