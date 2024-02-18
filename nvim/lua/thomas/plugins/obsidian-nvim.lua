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
})
