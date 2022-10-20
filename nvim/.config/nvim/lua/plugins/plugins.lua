local plugins = { -- Plug Manager and required plugins

    -- General
    {"wbthomason/packer.nvim"},
	{"nvim-lua/plenary.nvim"},
    {"lewis6991/impatient.nvim"},

    --------
    -- UI --
    --------
    -- Icons
    {"kyazdani42/nvim-web-devicons"},
    --
    {"goolord/alpha-nvim"},
    -- Colorschemes
    {"navarasu/onedark.nvim"},
    -- file managing , picker etc
    {"kyazdani42/nvim-tree.lua"},
    -- Lualine
    {"nvim-lualine/lualine.nvim"},
    -- Bufferline
    {"akinsho/bufferline.nvim"},

    -------------------
    -- Functionality --
    -------------------
    -- Git
    {"lewis6991/gitsigns.nvim"},
    -- Comments
    {"numToStr/Comment.nvim"},
    -- Indent Blankline
    {"lukas-reineke/indent-blankline.nvim"},
    -- Auto pairs
    {"windwp/nvim-autopairs"},
    -- Terminal
    {"akinsho/toggleterm.nvim"},

    ---------
    -- CMP --
    ---------
    -- Cmp million stuff
    {"hrsh7th/nvim-cmp"},
    {"hrsh7th/cmp-buffer"},
    {"hrsh7th/cmp-path"},
    {"saadparwaiz1/cmp_luasnip"},
    {"hrsh7th/cmp-nvim-lsp"},
    {"hrsh7th/cmp-nvim-lua"},
    {"hrsh7th/cmp-cmdline"},
    -- Snippets
    {"L3MON4D3/LuaSnip"},
    {"rafamadriz/friendly-snippets"},

    ---------------
    -- Lsp Stuff --
    ---------------
    {"neovim/nvim-lspconfig"},
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},
    {"jose-elias-alvarez/null-ls.nvim"},

    ---------------
    -- Telescope --
    ---------------
    {"nvim-telescope/telescope.nvim"},

    ----------------
    -- TreeSitter --
    ----------------
    {"nvim-treesitter/nvim-treesitter"},

    ----------
    -- Tmux --
    ----------
    {"alexghergh/nvim-tmux-navigation"},
}

-- setup packer + plugins
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Load all plugins
local present, packer = pcall(require, "packer")

if present then
    packer.init {
        auto_clean = true,
        compile_on_sync = true,
        git = { clone_timeout = 6000 },
        display = {
            working_sym = "ﲊ",
            error_sym = "✗ ",
            done_sym = " ",
            removed_sym = " ",
            moved_sym = "",
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end,
        },
    }

    for _, v in pairs(plugins) do
        packer.use(v)
    end
end
