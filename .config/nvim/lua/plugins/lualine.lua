return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = "dracula"
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {
          -- Add AI status indicator
          {
            function()
              local ok, ai_toggle = pcall(require, 'core.ai-toggle')
              if ok then
                return ai_toggle.get_status()
              end
              return ""
            end,
            color = function()
              local ok, ai_toggle = pcall(require, 'core.ai-toggle')
              if ok and ai_toggle.ai_enabled then
                return { fg = '#50fa7b' } -- Green when AI is on
              else
                return { fg = '#ff5555' } -- Red when AI is off
              end
            end,
          },
          'encoding', 
          'fileformat', 
          'filetype'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
    })
  end
}
