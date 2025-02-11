-- ~/.config/nvim/lua/plugins/lsp.lua

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { 
          "intelephense",
          "html",
          "cssls",
          "eslint",
          "bashls",
          "jsonls",
        }
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
  },
}