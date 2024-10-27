local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- local lualine_onedark = require("lualine.themes.gruvbox")

-- lualine_onedark.normal.c.bg = "#3c3836"

lualine.setup({
	options = {
		theme = "gruvbox-material",
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
})
