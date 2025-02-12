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
  end,
}
