vim.g.mapleader = ";"
local keymap = vim.keymap

-- schema = keymap.set([vim mode: n (normal), i (insert)], [key sequence], [command])

-- Search
keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear search highlights

-- Windows
keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split window equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "<leader>mm", ":MaximizerToggle<CR>") -- toggle fullscreen of current window

-- Navigate windows
keymap.set("n", "<C-h>", "<C-W>h") -- move left
keymap.set("n", "<C-j>", "<C-W>j") -- move down
keymap.set("n", "<C-k>", "<C-W>k") -- move up
keymap.set("n", "<C-l>", "<C-W>l") -- move left

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>")
keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>tt", "<cmd>Telescope file_browser hidden=true<cr>")
keymap.set("n", "<leader>gg", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- Nvim Tree
keymap.set("n", "<leader>fb", ":NvimTreeToggle<CR>")

-- Git
keymap.set("n", "<leader>lg", ":LazyGit<CR>")
keymap.set("n", "<leader>gr", ":GV<CR>") -- Git graph view

-- Nvim ZK
keymap.set("n", "<leader>zk", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>")
keymap.set("n", "<leader>zi", "<Cmd>ZkIndex<CR>")
keymap.set("n", "<leader>zt", "<Cmd>ZkTags<CR>")
keymap.set("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>")
keymap.set("n", "<leader>zl", "<Cmd>ZkLinks<CR>")

