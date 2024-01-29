local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- set leader key to space
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

---------------------
-- General Keymaps --
---------------------

-- use jj to exit insert mode
keymap("i", "jj", "<ESC>", { desc = "Exit insert mode with jk" })
keymap("n", "<leader>s", "<cmd>w<CR>", { desc = "Save current buffer" })

-- clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
