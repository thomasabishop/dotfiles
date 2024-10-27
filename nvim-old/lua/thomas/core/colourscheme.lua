local status, _ = pcall(vim.cmd, "colorscheme gruvbox-material")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end

-- helper function
local function update_hl(group, tbl)
	local old_hl = vim.api.nvim_get_hl_by_name(group, true)
	local new_hl = vim.tbl_extend("force", old_hl, tbl)
	vim.api.nvim_set_hl(0, group, new_hl)
end

update_hl("Function", { bold = true })
update_hl("Comment", { italic = false })
update_hl("String", { italic = false })
update_hl("markdownH1", { bold = true })
update_hl("markdownH2", { bold = true })
update_hl("markdownH3", { bold = true })
update_hl("markdownH4", { bold = true })
update_hl("markdownH5", { bold = true })
