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
          "phpactor",
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

      -- Function to set 2-space indentation for all LSPs
      local function on_attach(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "tabstop", 2)
        vim.api.nvim_buf_set_option(bufnr, "shiftwidth", 2)
        vim.api.nvim_buf_set_option(bufnr, "expandtab", true)
      end

      -- Define LSP servers in a table
      local servers = {
        -- intelephense = { cmd = { 'intelephense', '--stdio' }, filetypes = { 'php' } },
        phpactor = { cmd = { 'phpactor', 'language-server' }, filetypes = { 'php' } },
        html = {},
        cssls = {},
        tailwindcss = {},
        bashls = {},
        jsonls = {},
        lua_ls = {},
        ts_ls = {},
        emmet_ls = {
          filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
          init_options = { html = { options = { ["bem.enabled"] = true } } }
        }
      }

      -- Setup all LSPs with shared config
      for lsp, config in pairs(servers) do
        lspconfig[lsp].setup(vim.tbl_deep_extend("force", {
          capabilities = capabilities,
          on_attach = on_attach,
        }, config))
      end
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
