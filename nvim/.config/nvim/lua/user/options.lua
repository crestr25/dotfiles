local options = {
    backup = false,                          -- creates a backup file
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cmdheight = 2,                           -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- so that `` is visible in markdown files
    fileencoding = "utf-8",                  -- the encoding written to a file
    hlsearch = true,                         -- highlight all matches on previous search pattern
    hidden = true,
    ignorecase = true,                       -- ignore case in search patterns
    lazyredraw = true,
    pumheight = 10,                          -- pop up menu height
    showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2,                         -- always show tabs
    smartcase = true,                        -- smart case
    smartindent = true,                      -- make indenting smarter again
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    swapfile = false,                        -- creates a swapfile
    termguicolors = true,                    -- set term gui colors (most terminals support this)
    timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                         -- enable persistent undo
    updatetime = 250,                        -- faster completion (4000ms default)
    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,                        -- convert tabs to spaces
    shiftwidth = 4,                          -- the number of spaces inserted for each indentation
    tabstop = 4,                             -- insert 2 spaces for a tab
    cursorline = true,                       -- highlight the current line
    number = true,                           -- set numbered lines
    relativenumber = false,                  -- set relative numbered lines
    numberwidth = 2,                         -- set number column width to 2 {default 4}
    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    wrap = false,                            -- display lines as one long line
    scrolloff = 8,                           -- is one of my fav
    sidescrolloff = 8,
    colorcolumn = '88',
    ttyfast = true,
    grepprg = 'rg --vimgrep --no-heading --hidden --smart-case --no-ignore-vcs',
    grepformat = '%f:%l:%c:%m,%f:%l:%m'
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- WildIgnore Stuff
local wildignored = {
  'tags',
  '*/__pycache__/*',
  '*/env/*',
  '*.png',
  '*.jpg',
  '*.jpeg',
  '*/migrations/*',
  '*/.git/*',
}

local wildignore = ''
for i = 1, #wildignored do
  wildignore = wildignore .. wildignored[i] .. ','
end

-- Finally, set wildignore...
vim.opt.wildignore = wildignore

-- Suffixes Stuff
-- Get a lower priority when multiple files match a wildcard
local suffixesed = {
  '.class',
  '.pyc',
  '.feature',
  'test',
}

local suffixes = ''
for i = 1, #suffixesed do
  suffixes = suffixes .. suffixesed[i] .. ','
end

-- Finally, set suffixesed...
vim.opt.suffixes = suffixes


vim.cmd "let g:python3_host_prog = '/Users/crestrepo/.pyenv/versions/nvim/bin/python'"
