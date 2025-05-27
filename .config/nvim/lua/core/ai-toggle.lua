local M = {}

-- State tracking
M.ai_enabled = true

-- Function to disable AI features
function M.disable_ai()
  -- Disable Copilot
  if vim.fn.exists(':Copilot') == 2 then
    vim.cmd('Copilot disable')
  end
  
  -- Disable Avante if available
  if vim.fn.exists(':AvanteToggle') == 2 then
    vim.cmd('AvanteToggle')
  end
  
  M.ai_enabled = false
  print("🚫 AI autocomplete disabled - Regular completion still active")
end

-- Function to enable AI features
function M.enable_ai()
  -- Enable Copilot
  if vim.fn.exists(':Copilot') == 2 then
    vim.cmd('Copilot enable')
  end
  
  -- Enable Avante if it was disabled
  if vim.fn.exists(':AvanteToggle') == 2 then
    vim.cmd('AvanteToggle')
  end
  
  M.ai_enabled = true
  print("🤖 AI autocomplete enabled")
end

-- Toggle function
function M.toggle_ai()
  if M.ai_enabled then
    M.disable_ai()
  else
    M.enable_ai()
  end
end

-- Get current status
function M.get_status()
  return M.ai_enabled and "🤖 AI ON" or "🚫 AI OFF"
end

-- Setup function to initialize keybindings
function M.setup()
  -- Create user commands
  vim.api.nvim_create_user_command('AIToggle', M.toggle_ai, { desc = 'Toggle AI autocomplete' })
  vim.api.nvim_create_user_command('AIDisable', M.disable_ai, { desc = 'Disable AI autocomplete' })
  vim.api.nvim_create_user_command('AIEnable', M.enable_ai, { desc = 'Enable AI autocomplete' })
  vim.api.nvim_create_user_command('AIStatus', function() print(M.get_status()) end, { desc = 'Show AI status' })
  
  -- Set up keybinding
  vim.keymap.set('n', '<leader>ta', M.toggle_ai, { desc = 'Toggle AI autocomplete', silent = true })
  
  -- Optional: Add to which-key if available (using new format)
  -- Defer which-key registration to ensure it's fully loaded
  vim.defer_fn(function()
    local ok, wk = pcall(require, 'which-key')
    if ok then
      wk.add({
        { "<leader>t", group = "Toggle" },
        { "<leader>ta", desc = "Toggle AI autocomplete" },
      })
    end
  end, 100)
end

return M 