-- set colorscheme to onedark with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme onedark")
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
