-- import rainbow-delimeters safely
local setup, rd = pcall(require, "rainbow-delimiters.setup")
if not setup then
	return
end

rd.setup({
	-- change the default colour order
	-- only use three colours, to match One Dark theme in VSCode
	highlight = {
		"RainbowDelimiterYellow",
		"RainbowDelimiterViolet",
		"RainbowDelimiterCyan",
	},
})

-- change colour values to match One Dark
vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { foreground = "#C678DD" })
vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { foreground = "#E5C07B" })
vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { foreground = "#56B6C2" })
