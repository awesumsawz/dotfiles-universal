-- nvim tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- blade
vim.filetype.add({
    pattern = {
        [".*%.blade%.php"] = "blade",
    },
})
