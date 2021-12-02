local map_conf = {
  nore = { noremap = true },
  silnore = { silent = true, noremap = true },
}

local map = vim.api.nvim_set_keymap

local M = {}

M.default_maps = function()
    --------------------
    -- No More Arrows --
    --------------------
    map("n", "<Up>", "<Nop>", map_conf.nore)
    map("n", "<Down>", "<Nop>", map_conf.nore)
    map("n", "<Left>", "<Nop>", map_conf.nore)
    map("n", "<Right>", "<Nop>", map_conf.nore)
    ------------
    -- NORMAL --
    ------------
    -- Easier window movement
    map("n", "<C-h>", "<C-w>h", map_conf.nore)
    map("n", "<C-j>", "<C-w>j", map_conf.nore)
    map("n", "<C-k>", "<C-w>k", map_conf.nore)
    map("n", "<C-l>", "<C-w>l", map_conf.nore)
    -- Move current line/block with Alt-j/k
    map("n", "<A-j>", ":m .+1<CR>==", map_conf.nore)
    map("n", "<A-k>", ":m .-2<CR>==", map_conf.nore)
    ------------
    -- INSERT --
    ------------
    -- 'jj' for quitting insert mode
    map("i", "jj", "<Esc>", map_conf.nore)
    -- Move current line/block with Alt-j/k
    map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", map_conf.nore)
    map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", map_conf.nore)
    ------------
    -- VISUAL --
    ------------
    -- Better indenting
    map("v", "<", "<gv", map_conf.nore)
    map("v", ">", ">gv", map_conf.nore)
    -- Move current line/block with Alt-j/k
    map("v", "<A-j>", ":m '>+1<CR>gv-gv", map_conf.nore)
    map("v", "<A-k>", ":m '<-2<CR>gv-gv", map_conf.nore)
end


return M
