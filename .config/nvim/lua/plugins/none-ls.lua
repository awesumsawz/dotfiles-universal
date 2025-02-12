return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
      },
    })
  end,
  keys = {
    { "<leader>cf", vim.lsp.buf.format, { noremap = true, silent = true }, desc = "Code Format" },
  },
}
