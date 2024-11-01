-- auto install packer if not installed

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- plugins to install
return packer.startup(function(use)
	-- packer can manage itself

	use("wbthomason/packer.nvim")
	-- use({
	-- 	"aspeddro/pandoc.nvim",
	-- 	config = function()
	-- 		require("pandoc").setup()
	-- 	end,
	-- })
	-- use({
	-- 	"folke/noice.nvim",
	-- 	requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	-- })

	use({ "epwalsh/obsidian.nvim", requires = { "nvim-lua/plenary.nvim" } })
	-- use("ellisonleao/gruvbox.nvim")
	use("sainnhe/gruvbox-material") --
	use("kdheepak/lazygit.nvim")
	use("zk-org/zk-nvim")
	--	use("ryanoasis/vim-devicons")
	use("tpope/vim-fugitive")
	use("mechatroner/rainbow_csv")
	-- use("rcarriga/nvim-notify")
	use("lmburns/kimbox")
	use("tpope/vim-markdown")
	use("f-person/git-blame.nvim")
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
	use("joshdick/onedark.vim")
	use("junegunn/vim-easy-align")
	use("junegunn/rainbow_parentheses.vim")
	use("HiPhish/rainbow-delimiters.nvim")
	use("junegunn/gv.vim")
	use("ap/vim-css-color")
	use("wakatime/vim-wakatime")
	use("psliwka/vim-smoothie")
	use("nvim-lua/plenary.nvim")
	use("szw/vim-maximizer") 
	use("tpope/vim-commentary")
	use("tpope/vim-surround") --
	use("vim-scripts/ReplaceWithRegister")
	use("nvim-tree/nvim-tree.lua")
	use("nvim-lualine/lualine.nvim") -- 
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use({
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	})
	-- startup page
	--use({
	--	"goolord/alpha-nvim",
	--	--		requires = { "nvim-tree/nvim-web-devicons" },
	--	config = function()
	--		require("alpha").setup(require("alpha.themes.startify").config)
	--	end,
	--})

	use({
		"lukas-reineke/indent-blankline.nvim",
	})

	-- autocompletion and snippets
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim" })

	use("jackguo380/vim-lsp-cxx-highlight")
	--	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting and linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-context")
	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	if packer_bootstrap then
		require("packer").sync()
	end

	local highlight = {
		"RainbowRed",
		"RainbowYellow",
		"RainbowBlue",
		"RainbowOrange",
		"RainbowGreen",
		"RainbowViolet",
		"RainbowCyan",
	}

	-- local hooks = require("ibl.hooks")
	-- -- -- -- create the highlight groups in the highlight setup hook, so they are reset
	-- -- -- -- every time the colorscheme changes
	-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	-- 	vim.api.nvim_set_hl(0, "RainbowRed", { foreground = "#ea6962" })
	-- 	vim.api.nvim_set_hl(0, "RainbowYellow", { foreground = "#d8a657" })
	-- 	vim.api.nvim_set_hl(0, "RainbowBlue", { foreground = "#7daea3" })
	-- 	vim.api.nvim_set_hl(0, "RainbowOrange", { foreground = "#e78a4e" })
	-- 	vim.api.nvim_set_hl(0, "RainbowGreen", { foreground = "#a9b665" })
	-- 	vim.api.nvim_set_hl(0, "RainbowViolet", { foreground = "#d3869b" })
	-- 	vim.api.nvim_set_hl(0, "RainbowCyan", { foreground = "#89b482" })
	-- end)

	-- vim.g.rainbow_delimiters = { highlight = highlight }
	-- require("ibl").setup({ indent = { highlight = highlight } })
	-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

	--	require("ibl").setup()
end)
