return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {},
  config = function()
    require('bufferline').setup({
      options = {
        mode = "buffers",
        separator_style = "thick",
      },
    })
    vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCycleNext<CR>", {desc = "Next buffer"})
    vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineCyclePrev<CR>", {desc = "Previous buffer"})
    vim.keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", {desc = "Close buffer"})
    vim.keymap.set("n", "<leader>bf", "<cmd>BufferLinePick<CR>", {desc = "Find buffer"})
  end,
}
