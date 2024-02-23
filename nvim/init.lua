vim.api.nvim_exec(
	[[
  autocmd BufRead,BufNewFile *.md set filetype=markdown
]],
	false
)

vim.cmd([[
  autocmd BufRead,BufNewFile *.md set syntax=markdown
]])

require("thomas.plugins-setup")
require("thomas.core.options")
require("thomas.core.keymaps")
require("thomas.core.colourscheme")
require("thomas.plugins.lualine")
require("thomas.plugins.telescope")
require("thomas.plugins.nvim-cmp")
require("thomas.plugins.lsp.mason")
require("thomas.plugins.lsp.lspsaga")
require("thomas.plugins.lsp.lspconfig")
require("thomas.plugins.lsp.null-ls")
require("thomas.plugins.autopairs")
require("thomas.plugins.treesitter")
require("thomas.plugins.gitsigns")
require("thomas.plugins.copilot_plugin")
require("thomas.plugins.nvim-tree")
require("thomas.plugins.rainbow-delimiters")
require("thomas.plugins.gitblame")
require("thomas.plugins.zk")
require("thomas.plugins.noice")
require("thomas.plugins.obsidian-nvim")
require("thomas.plugins.nvim-notify")
