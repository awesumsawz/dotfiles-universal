return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
  config = function()
    require("harpoon").setup({})
    vim.keymap.set("n", "<leader>a", function() require("harpoon"):list():add() end)
    vim.keymap.set("n", "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end)

    vim.keymap.set("n", "<C-1>", function() require("harpoon"):list():select(1) end)
    vim.keymap.set("n", "<C-2>", function() require("harpoon"):list():select(2) end)
    vim.keymap.set("n", "<C-3>", function() require("harpoon"):list():select(3) end)
    vim.keymap.set("n", "<C-4>", function() require("harpoon"):list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function() require("harpoon"):list():prev() end)
    vim.keymap.set("n", "<C-S-N>", function() require("harpoon"):list():next() end)
  end,
}
