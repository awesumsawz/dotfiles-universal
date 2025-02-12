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
          "lua_ls",
          "ts_ls",
          "emmet_ls",
        }
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_nvim_lsp.default_capabilities()
      )

      local lspconfig = require("lspconfig")

      lspconfig.intelephense.setup({
        cmd = { 'intelephense', '--stdio' },
        filetypes = { 'php' },
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true,
            },
          },
        }
      })
    end,
    keys = {
      { "<leader>ch", vim.lsp.buf.hover, { noremap = true, silent = true }, desc = "Code Hover" },
      { "<leader>cd", vim.lsp.buf.definition, { noremap = true, silent = true }, desc = "Code Definition" },
      { "<leader>cr", vim.lsp.buf.references, { noremap = true, silent = true }, desc = "Code References" },
      { "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true }, desc = "Code Action" },
      { "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true }, desc = "Rename" },
    },
  },
}
