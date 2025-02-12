return {
  'numToStr/Comment.nvim',
  keys = {
    { "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { noremap = true, silent = true }, desc = "Toggle Comment Linewise Current" },
    { "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { noremap = true, silent = true }, desc = "Toggle Comment Linewise Visual" },
  },
}