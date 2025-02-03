-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use "nvim-lua/plenary.nvim"
    use 'nvim-tree/nvim-web-devicons'
    use 'github/copilot.vim'
    use 'numToStr/Comment.nvim'
    use 'mfussenegger/nvim-dap'
    use 'mhartington/formatter.nvim'
    use 'mfussenegger/nvim-lint'
    use { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig", }
	use({ 'Mofiqul/dracula.nvim', as = 'dracula', config = function() vim.cmd('colorscheme dracula') end })
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = { {'nvim-lua/plenary.nvim'} } }
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { "ThePrimeagen/harpoon", branch = "harpoon2", requires = { {"nvim-lua/plenary.nvim"} } }
    use({ "kdheepak/lazygit.nvim", requires = { "nvim-lua/plenary.nvim" } })
    use { "folke/which-key.nvim", config = function() require("which-key").setup {} end }
end)
