return {
	"zk-org/zk-nvim",
	config = function()
		require("zk").setup({
			picker = "telescope",

			lsp = {
				config = {
					cmd = { "zk", "lsp" },
					name = "zk",
				},

				auto_attach = {
					enabled = true,
					filetypes = { "markdown" },
				},
			},
		})
	end,
	keys = {
		{
			"<leader>zk",
			"<Cmd>ZkNotes { sort = { 'modified' } }<CR>",
		},
		{
			"<leader>zt",
			"<Cmd>ZkTags<CR>",
		},
	},
}
