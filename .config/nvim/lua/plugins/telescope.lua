-- plugins/telescope.lua:
return {
  {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    dependencies = { 
      'nvim-lua/plenary.nvim' 
    },
    keys = {
      { "<leader>pf", "<cmd>:Telescope find_files<CR>", desc = "Project Find" },
      { "<leader>pg", "<cmd>:Telescope live_grep<CR>", desc = "Project Grep" },
    }
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end,
  }
}
