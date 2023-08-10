local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
-------------------- Better window navigation ------------------
keymap("n", "<c-h>", "<c-w>h", opts)
keymap("n", "<c-l>", "<c-w>l", opts)
keymap("n", "<c-j>", "<c-w>j", opts)
keymap("n", "<c-k>", "<c-w>k", opts)

-------------------- Disable Arrow keys --------------------------
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)

-------------------- Better Vertical Navigation --------------------------
keymap("n", "<c-d>", "<c-d>zz", opts)
keymap("n", "<c-b>", "<c-b>zz", opts)

-------------------- Navigate buffers --------------------------
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<A-S-l>", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<A-S-h>", ":BufferLineMovePrev<CR>", opts)

-------------------- Press jk fast to enter --------------------
keymap("i", "jj", "<ESC>", opts)

-------------------- Save with leader - s --------------------
keymap("n", "<leader>s", "<cmd>w<CR>", opts)

-------------------- Clear highlight search --------------------
keymap("n", "<leader>cs", "<cmd>noh<CR>", opts)

-------------------- Move text up/ down ------------------------
-- Visual --
keymap("v", "<A-S-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-S-k>", ":m .-2<CR>==", opts)
-- Block --
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-S-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-S-k>", ":move '<-2<CR>gv-gv", opts)
-- Normal --
keymap("n", "K", ":m .+1<CR>==", opts)
keymap("n", "J", ":m .-2<CR>==", opts)
-- Insert --
keymap("i", "<A-S-j>", "<ESC>:m .+1<CR>==gi", opts)
keymap("i", "<A-S-k>", "<ESC>:m .-2<CR>==gi", opts)

-------------------- No highlight ------------------------------
keymap("n", ";", ":noh<CR>", opts)

-------------------- Go to buffer quickly ----------------------
keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)

-------------------- split window ------------------------------
keymap("n", "<leader>\\", ":vsplit<CR>", opts)
keymap("n", "<leader>/", ":split<CR>", opts)

-------------------- Switch two windows ------------------------
keymap("n", "<A-o>", "<C-w>r", opts)

-------------------- Inspect --------------------------------
keymap("n", "<F2>", "<cmd>Inspect<CR>", opts)

-------------------- Tmux --------------------------------
keymap("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft <CR>", opts)
keymap("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown <CR>", opts)
keymap("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp <CR>", opts)
keymap("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight <CR>", opts)

-------------------- Fuzzy Search --------------------------------
vim.keymap.set("n", "<C-f>", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes"))
end, { desc = "[/] Fuzzily search in current buffer]" })
