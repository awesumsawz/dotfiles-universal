return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    keys = {
      { "<leader>nd", "<cmd>:Noice disable<cr>", { noremap = true, silent = true, desc = "Disable Noice" } },
    }
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        stages = "fade",
        timeout = 5000,
        background_colour = "#000000",
        icons = {
          ERROR = "",
          WARN = "",
          INFO = "",
          DEBUG = "",
          TRACE = "✎",
        },
      })
    end,
  }
}
