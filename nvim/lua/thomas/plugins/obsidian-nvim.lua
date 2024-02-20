local obsidian_nvim_setup, obsidian_nvim = pcall(require, "obsidian")

if not obsidian_nvim_setup then
	return
end

obsidian_nvim.setup({
	workspaces = {
		{
			name = "eolas",
			path = "~/repos/eolas/zk",
		},
	},
	disable_frontmatter = true,
	ui = {
		bullets = { char = "•", hl_group = "ObsidianBullet" },
		hl_groups = {
			ObsidianBullet = { bold = false, fg = "#7daea3" },
			ObsidianRefText = { underline = true, fg = "#e78a4e" },
			ObsidianTag = { italic = true, fg = "#89b482" },
		},
	},
})
