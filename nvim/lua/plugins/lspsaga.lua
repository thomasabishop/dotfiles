return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	keys = {
		-- { "<leader>gf", "<cmd>Lspsaga lsp_finder<CR>" },
		-- { "<leader>gd", "<cmd>Lspsaga peek_definition<CR>" },
		-- { "<leader>rn", "<leader>rn", "<cmd>Lspsaga rename<CR>" },
		-- { "<leader>y", "<leader>rn", "<cmd>Lspsaga finder<CR>" },
	},
	config = function()
		require("lspsaga").setup({
			scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
			definition = {
				edit = "<CR>",
			},
			ui = {
				colors = {
					-- normal_bg = "#022746",
				},
				code_action = {
					enable = false,
				},
			},
		})
	end,
}
