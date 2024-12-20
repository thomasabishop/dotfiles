local global = vim.g
local opt = vim.opt
local diagnostic = vim.diagnostic

vim.api.nvim_set_hl(0, "@keyword.function.python", { italic = true })
global.mapleader = ";"
global.maplocalleader = "\\"
global.lazyvim_picker = "telescope"

opt.number = true
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.tabstop = 2
opt.softtabstop = 4
opt.shiftwidth = 2
opt.colorcolumn = "80"
opt.textwidth = 80
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.background = "dark"
opt.mouse = ""
opt.ttyfast = true
opt.laststatus = 2
opt.signcolumn = "yes"
opt.swapfile = false
opt.showmode = false
opt.termguicolors = true
opt.wrap = false
opt.formatoptions = "cro"
opt.backspace = "indent,eol,start"
opt.conceallevel = 0
opt.spelllang = "en_gb"
vim.opt.spell = false

diagnostic.config({
	virtual_text = false,
})
