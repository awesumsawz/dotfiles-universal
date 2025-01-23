return {
  "jackMort/ChatGPT.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("chatgpt").setup({
      api_key_cmd = "op read op://development/knight-nvim-openai-key/credential",
    })
  end,
}
