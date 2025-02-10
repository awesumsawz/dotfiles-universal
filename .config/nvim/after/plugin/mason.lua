require("mason").setup()
require("mason-lspconfig").setup{
    ensure_installed = {
        "html",
        "cssls",
        "stimulus_ls",
        "intelephense",
        "eslint",
        "bashls",
        "jsonls",
        "phpactor",
    },
}
