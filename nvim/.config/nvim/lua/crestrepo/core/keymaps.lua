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

-- clear search highlights
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Save current buffer
keymap("n", "<leader>s", "<cmd>w<CR>", { desc = "Save current buffer" })

-- Disable arrow keys in normal mode
keymap("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
keymap("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
keymap("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
keymap("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Source current file
keymap("n", "<space><space>x", "<cmd>source %<CR>")
-- Run lua code
keymap("n", "<space>x", "<cmd>:.lua<CR>")
keymap("v", "<space>x", "<cmd>:lua<CR>")

-- AutoCommands
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('autocmd-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
