return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  config = function()
    require("fzf-lua").setup({
    })

    vim.keymap.set("n", "<leader>pf", "<cmd>lua require('fzf-lua').files()<CR>", { desc = "Fuzz Files" })
    vim.keymap.set("n", "<leader>pb", "<cmd>lua require('fzf-lua').buffers()<CR>", { desc = "Fuzz Buffers" })
    vim.keymap.set("n", "<leader>pl", "<cmd>lua require('fzf-lua').live_grep()<CR>", { desc = "Fuzz Live Grep" })
    vim.keymap.set("n", "<leader>pg", "<cmd>lua require('fzf-lua').grep()<CR>", { desc = "Fuzz Grep" })
    vim.keymap.set("n", "<leader>pm", "<cmd>lua require('fzf-lua').marks()<CR>", { desc = "Fuzz Marks" })
  end
}
