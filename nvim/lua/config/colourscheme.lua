vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_enable_bold = 1

local function update_highlight_group(group, tbl)
	local old_hl = vim.api.nvim_get_hl_by_name(group, true)
	local new_hl = vim.tbl_extend("force", old_hl, tbl)
	vim.api.nvim_set_hl(0, group, new_hl)
end

update_highlight_group("Function", { bold = false })
update_highlight_group("Comment", { italic = true })
update_highlight_group("String", { italic = false })
