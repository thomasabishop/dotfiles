return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	keys = {

		{ "<leader>K", "<cmd>Lspsaga hover_doc<CR>" },
		{ "<leader>y", "<cmd>Lspsaga finder<CR>" },
		{ "<leader>g", "<cmd>Lspsaga peek_definition<CR>" },
		{ "<leader>gf", "<cmd>Lspsaga goto_definition<CR>", desc = "Go to definition" },
		{ "<leader>rn", "<cmd>Lspsaga rename<CR>" },
		{ "<leader>b", "<cmd>Lspsaga code_action<CR>", desc = "Code actions" },
		{ "<leader>r", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show line diagnostics" },
	},
	config = function()
		require("lspsaga").setup({
			scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
			definition = {
				edit = "<CR>",
			},
			finder = {
				keys = {
					--				toggle_or_jump = "<Tab>",
					quit = { "q", "<ESC>" },
					vsplit = "v",
					split = "s",
				},
			},
			lightbulb = {
				enable = true,
				sign = true,
				virtual_text = true,
				sign_priority = 40,
			},
			hover = {
				max_width = 0.6,
				max_height = 0.4,
			},
			diagnostic = {
				show_code_action = true,
				show_source = true,
				jump_num_shortcut = true,
				max_width = 0.7,
				max_height = 0.6,
			},
		})
	end,
}
