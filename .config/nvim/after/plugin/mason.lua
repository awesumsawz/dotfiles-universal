require("mason").setup()
require("mason-lspconfig").setup{
    ensure_installed = {
        "html",
        "cssls",
        "hyprls",
        "stimulus_ls",
        "intelephense",
        "eslint",
        "bashls",
        "jsonls",
        "phpactor",
    },
}
