return {
  "github/copilot.vim",
  config = function()
    -- Set up the accept keybinding
    vim.keymap.set('i', '<C-F>', function() 
      return vim.fn['copilot#Accept']("\\<CR>") 
    end, {
      expr = true,
      replace_keycodes = false,
      desc = "Accept Copilot suggestion"
    })
    
    -- Disable tab mapping to avoid conflicts
    vim.g.copilot_no_tab_map = true
    
    -- Set up additional useful keybindings
    vim.keymap.set('i', '<C-]>', '<Plug>(copilot-dismiss)', { desc = "Dismiss Copilot suggestion" })
    vim.keymap.set('i', '<C-\\>', '<Plug>(copilot-suggest)', { desc = "Trigger Copilot suggestion" })
    
    -- Optional: Set up next/previous suggestions
    vim.keymap.set('i', '<M-]>', '<Plug>(copilot-next)', { desc = "Next Copilot suggestion" })
    vim.keymap.set('i', '<M-[>', '<Plug>(copilot-previous)', { desc = "Previous Copilot suggestion" })
  end,
}
