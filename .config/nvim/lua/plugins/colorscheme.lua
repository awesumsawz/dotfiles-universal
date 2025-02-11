return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_bg = true,
    },
    config = function()
      vim.cmd([[colorscheme dracula]])
    end,
  },
}
