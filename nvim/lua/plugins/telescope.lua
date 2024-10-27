local actions = require("telescope.actions")

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-k>"] = actions.move_selection_previous, -- move to prev result
					["<C-j>"] = actions.move_selection_next, -- move to next result
				},
			},
			file_ignore_patterns = {
				"neuron/",
				"img",
				"node_modules",
				".git",
			},
		},
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>" },
		{ "<leader>bb", "<cmd>Telescope buffers<cr>" },
		{ "<leader>tt", "<cmd>Telescope file_browser hidden=true<cr>" },
		{ "<leader>gg", "<cmd>Telescope live_grep hidden=true<cr>" },
	},
}
