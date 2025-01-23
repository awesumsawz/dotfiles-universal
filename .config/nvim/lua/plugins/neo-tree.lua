return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        filtered_items = {
          visible = true, -- Show filtered items (dimmed out)
          hide_dotfiles = false, -- Show dotfiles
          hide_gitignored = true, -- Hide Git-ignored files by default
          always_show = { ".gitignored" }, -- Files or patterns to always show
        },
        follow_current_file = true, -- Optional: Sync with the current file
        group_empty_dirs = true,   -- Optional: Group empty directories
      },
      renderers = {
        file = {
          { "icon" },
          { "name", use_git_status_colors = true }, -- Dims filenames based on Git status
        },
      },
    }
  end
}
