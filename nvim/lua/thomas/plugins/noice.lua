local noice_setup, noice = pcall(require, "noice")

if not noice_setup then
	return
end

noice.setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
	cmdline = {
		format = {
			cmdline = { icon = " " },
			search_down = { icon = "	⌄" },
			search_up = { icon = "	⌃" },
			filter = { icon = " " },
			lua = { icon = "" },
			help = { icon = "󰋖 " },
			level = {
				icons = {
					error = " ",
					warn = "⚠ ",
					info = "󰙎 ",
				},
			},
		},
	},
	views = {
		cmdline_popup = {
			border = {
				style = "single",
			},
		},
		popup = {
			border = {
				style = "single",
			},
		},
		hover = {
			border = {
				style = "single",
			},
		},
		confirm = {
			border = {
				style = "single",
			},
		},
	},
})
