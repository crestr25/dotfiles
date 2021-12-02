local opt = vim.opt
-------------
-- General --
-------------

opt.number = true
opt.swapfile = false
opt.clipboard = "unnamedplus"

---------------
-- Interface --
---------------
opt.termguicolors = true
opt.background = "dark"

---------------
-- Searching --
---------------

opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true

-------------
-- Spacing --
-------------

opt.autoindent = true
opt.copyindent = true
opt.smartindent = false
opt.smarttab = true
opt.shiftround = true

opt.expandtab = true
opt.tabstop = 4

-- Uses the value from `tabstop`
opt.shiftwidth = 0

-- Uses `shiftwidth` value
opt.softtabstop = -1

---------------
-- Scrolling --
---------------

opt.scrolloff = 10
