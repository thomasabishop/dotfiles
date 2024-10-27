-- import rainbow-delimeters safely
local setup, rd = pcall(require, "rainbow-delimiters.setup")
if not setup then
	return
end

-- rd.setup({
-- 	-- change the default colour order
-- 	-- only use three colours, to match One Dark theme in VSCode
-- 	highlight = {
-- 		"RainbowDelimiterRed",
-- 		"RainbowDelimiterYellow",
-- 		"RainbowDelimiterBlue",
-- 		"RainbowDelimiterOrange",
-- 		"RainbowDelimiterGreen",
-- 		"RainbowDelimiterViolet",
-- 		"RainbowDelimiterCyan",
-- 	},
-- })

-- -- change colour values to match One Dark

-- vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { foreground = "#89B482" })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { foreground = "#D8A657" })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { foreground = "#7DAEA3" })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { foreground = "#E78A4E" })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { foreground = "#A9B665" })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { foreground = "#D3869B" })
-- vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { foreground = "#89B482" })

vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { foreground = "#ea6962" })
vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { foreground = "#d8a657" })
vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { foreground = "#7daea3" })
vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { foreground = "#e78a4e" })
vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { foreground = "#a9b665" })
vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { foreground = "#d3869b" })
vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { foreground = "#89b482" })
