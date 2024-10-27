local zk_setup, zk = pcall(require, "zk")
if not zk_setup then
	return
end

zk.setup({
	picker = "telescope",

	lsp = {
		config = {
			cmd = { "zk", "lsp" },
			name = "zk",
			-- on_attach = ...
			-- etc, see `:h vim.lsp.start_client()`
		},

		auto_attach = {
			enabled = true,
			filetypes = { "markdown" },
		},
	},
})
