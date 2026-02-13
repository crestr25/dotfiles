-- Impatient
vim.loader.enable()
-------------
-- OPTIONS --
-------------
-- General
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.backup = false -- creates a backup file
vim.opt.swapfile = false -- creates a swapfile
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.scrolloff = 0
vim.opt.updatetime = 100 -- faster completion (4000ms default)
vim.opt.wrap = false -- display lines as one long line
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.formatoptions:remove { 'c', 'r', 'o' } -- dont add comment on new line

-- Splitting
vim.opt.splitbelow = true -- Split below current buffer
vim.opt.splitright = true -- Split right of current buffer

-- Searching
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- Smart case in search

-- Column Number
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines

-- Spaces/Tabs
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.smartindent = true -- make indenting smarter again

-- Sign Column
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time

-- Netrw
vim.g.netrw_banner = 0

-- Python path
vim.g.python3_host_prog = '$HOME/.virtualenvs/nvim/bin/python3.10'
