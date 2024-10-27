local keymap = vim.keymap

-- Search in file
keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear search highlights

-- Windows : splits
keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split window equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "<leader>mm", ":MaximizerToggle<CR>") -- toggle fullscreen of current window

-- Windows : navigation

keymap.set("n", "<C-h>", "<C-W>h") -- move left
keymap.set("n", "<C-j>", "<C-W>j") -- move down
keymap.set("n", "<C-k>", "<C-W>k") -- move up
keymap.set("n", "<C-l>", "<C-W>l") -- move left

-- Toggle virtual diagnostics

keymap.set("n", "<leader>lh", function()
	local config = vim.diagnostic.config()
	vim.diagnostic.config({ virtual_text = not config.virtual_text })
end)
