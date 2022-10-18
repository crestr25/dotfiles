local M = {}
local Mappings = {}

local generic_opts_any = { noremap = true, silent = true }

local generic_opts = {
  insert_mode = generic_opts_any,
  normal_mode = generic_opts_any,
  visual_mode = generic_opts_any,
  visual_block_mode = generic_opts_any,
  command_mode = generic_opts_any,
  term_mode = { silent = true },
}

local mode_adapters = {
  insert_mode = "i",
  normal_mode = "n",
  term_mode = "t",
  visual_mode = "v",
  visual_block_mode = "x",
  command_mode = "c",
}

---@class Keys
---@field insert_mode table
---@field normal_mode table
---@field terminal_mode table
---@field visual_mode table
---@field visual_block_mode table
---@field command_mode table

Mappings.defaults = {
  insert_mode = {
    ["jj"] = "<Esc>",
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
    -- navigation
    ["<A-Up>"] = "<C-\\><C-N><C-w>k",
    ["<A-Down>"] = "<C-\\><C-N><C-w>j",
    ["<A-Left>"] = "<C-\\><C-N><C-w>h",
    ["<A-Right>"] = "<C-\\><C-N><C-w>l",
  },

  normal_mode = {
    -- Better window movement
    ["<C-h>"] = "<C-w>h",
    ["<C-j>"] = "<C-w>j",
    ["<C-k>"] = "<C-w>k",
    ["<C-l>"] = "<C-w>l",

    -- Resize with arrows
    ["<C-Up>"] = ":resize -2<CR>",
    ["<C-Down>"] = ":resize +2<CR>",
    ["<C-Left>"] = ":vertical resize -2<CR>",
    ["<C-Right>"] = ":vertical resize +2<CR>",

    -- Move current line / block with Alt-j/k a la vscode.
    ["<A-j>"] = ":m .+1<CR>==",
    ["<A-k>"] = ":m .-2<CR>==",

    -- QuickFix
    ["]q"] = ":cnext<CR>",
    ["[q"] = ":cprev<CR>",
    ["<C-q>"] = ":call QuickFixToggle()<CR>",

    -- Save file
    ["<Leader>s"] = "<cmd> w<CR>",
  },

  term_mode = {
    -- Terminal window navigation
    ["<C-h>"] = "<C-\\><C-N><C-w>h",
    ["<C-j>"] = "<C-\\><C-N><C-w>j",
    ["<C-k>"] = "<C-\\><C-N><C-w>k",
    ["<C-l>"] = "<C-\\><C-N><C-w>l",
  },

  visual_mode = {
    -- Better indenting
    ["<"] = "<gv",
    [">"] = ">gv",
  },

  visual_block_mode = {
    -- Move selected line / block of text in visual mode
    ["K"] = ":move '<-2<CR>gv-gv",
    ["J"] = ":move '>+1<CR>gv-gv",

    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-j>"] = ":m '>+1<CR>gv-gv",
    ["<A-k>"] = ":m '<-2<CR>gv-gv",
  },

  command_mode = {
    -- navigate tab completion with <c-j> and <c-k>
    -- runs conditionally
    ["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
    ["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
  },
}

Mappings.nvim_tree = {
    normal_mode = {
        ["<leader>t"] = "<cmd> NvimTreeToggle <CR>",
        ["<leader>e"] = "<cmd> NvimTreeFocus <CR>"
    }
}

Mappings.telescope = {
  normal_mode = {
    -- find
    ["<leader>ff"] = "<cmd> Telescope find_files <CR>",
    ["<leader>fa"] =  "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
    ["<leader>fw"] =  "<cmd> Telescope live_grep <CR>",
    ["<leader>fb"] =  "<cmd> Telescope buffers <CR>",
    ["<leader>fh"] =  "<cmd> Telescope help_tags <CR>",
    ["<leader>fo"] =  "<cmd> Telescope oldfiles <CR>",
    ["<leader>tk"] =  "<cmd> Telescope keymaps <CR>",

    -- git
    ["<leader>cm"] = "<cmd> Telescope git_commits <CR>",
    ["<leader>gt"] = "<cmd> Telescope git_status <CR>",
  },
}

Mappings.comment = {
    normal_mode = {
        ["<leader>/"] = "<ESC><cmd>lua require('Comment.api').toggle.linewise.current() <CR>"
    },

    visual_mode = {
        ["<leader>/"] = "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    }
}

Mappings.tabufline = {
    normal_mode = {
        ["<TAB>"] = "<cmd> BufferLineCycleNext<CR>",
        ["<S-Tab>"] = "<cmd> BufferLineCyclePrev<CR>",
        ["<Leader>x"] = "<cmd> bdelete<CR>"
    }
}

Mappings.tmux = {
    normal_mode = {
        ["<C-h>"] = ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>",
        ["<C-j>"] = ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>",
        ["<C-k>"] = ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>",
        ["<C-l>"] = ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>",
        ["<C-Space>"] = ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>",
    }
}

Mappings.gitsigns = {
    normal_mode = {
        ["<Leader>gb"] = "<cmd>Gitsigns toggle_current_line_blame <CR>"
    }
}

-- Set key mappings individually
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param key The key of keymap
-- @param val Can be form as a mapping or tuple of mapping and user defined opt
function M.set_keymaps(mode, key, val)
  local opt = generic_opts[mode] or generic_opts_any
  if type(val) == "table" then
    opt = val[2]
    val = val[1]
  end
  if val then
    vim.keymap.set(mode, key, val, opt)
  else
    pcall(vim.api.nvim_del_keymap, mode, key)
  end
end

-- Load key mappings for a given mode
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param keymaps The list of key mappings
function M.load_mode(mode, keymaps)
  mode = mode_adapters[mode] or mode
  for k, v in pairs(keymaps) do
    M.set_keymaps(mode, k, v)
  end
end

-- Load key mappings for all provided modes
-- @param keymaps A list of key mappings for each mode
function M.load()

  for _, plug_type in pairs(Mappings) do
        for mode, mapping in pairs(plug_type) do
            M.load_mode(mode, mapping)
        end
    end
end

return M
