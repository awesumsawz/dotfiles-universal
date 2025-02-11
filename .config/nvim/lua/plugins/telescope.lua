-- plugins/telescope.lua:
return {
	'nvim-telescope/telescope.nvim', 
	tag = '0.1.8',
	dependencies = { 
		'nvim-lua/plenary.nvim' 
	},
  keys = {
    { "<leader>pf", "<cmd>:Telescope find_files<CR>", desc = "Find Files" },
		{ "<leader>pg", "<cmd>:Telescope live_grep<CR>", desc = "Search Project" },
  }
}
