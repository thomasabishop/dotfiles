return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "gruvbox-material",
			icons_enabled = true,
			component_separators = { left = "|", right = "|" },
			section_separators = { left = " ", right = " " },
		},
		sections = {
			lualine_c = {
				{
					"buffers",
					show_filename_only = true,
					show_modified_status = true,
					mode = 3,
					filetype_names = {
						TelescopePrompt = "Telescope",
					},
				},
				{
					"filename",
					path = 4,
				},
			},
		},
	},
}
