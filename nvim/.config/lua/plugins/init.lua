local plugins = { -- Plug Manager and required plugins
    {"wbthomason/packer.nvim"},
	{"nvim-lua/plenary.nvim"},
    {"lewis6991/impatient.nvim"},
    {"kyazdani42/nvim-web-devicons"},

    -- Colorscheme
    {"cpea2506/one_monokai.nvim",
        config = function()
            require "plugins.colorscheme"
        end,
    },
    {"navarasu/onedark.nvim",
    config = function()
        require "plugins.colorscheme"
    end,
    },

    -- Lualine / Buffers
    {"nvim-lualine/lualine.nvim",
        config = function()
            require "plugins.lualine"
        end,
    },

    {"akinsho/bufferline.nvim",
        config = function()
            require "plugins.bufferline"
        end,
    },

    -- TreeSitter
    {"nvim-treesitter/nvim-treesitter",
     run = ":TSUpdate",
     config = function()
       require "plugins.treesitter"
     end,
    },

    -- Gitsigns
    {"lewis6991/gitsigns.nvim",
        config = function()
            require"plugins.gitsigns"
        end,
    },

    -- CMP
    {"rafamadriz/friendly-snippets"},
    {"L3MON4D3/LuaSnip", after = "friendly-snippets"},

    {"hrsh7th/nvim-cmp",
        after = "LuaSnip",
        config = function()
            require "plugins.cmp"
        end
    },

    {"hrsh7th/cmp-buffer", after = "nvim-cmp"},
    {"hrsh7th/cmp-path", after = "cmp-buffer"},
    {"hrsh7th/cmp-cmdline", after = "cmp-path"},
    {"saadparwaiz1/cmp_luasnip", after = "cmp-cmdline"},
    {"hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip"},
    {"hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp"},

    -- Lsp Stuff
    {"williamboman/mason.nvim",
        config = function()
            require "plugins.mason"
        end,
    },

    {"neovim/nvim-lspconfig",
        after = "cmp_luasnip",
     config = function()
       require "plugins.lspconfig"
     end
    },

    -- file managing , picker etc
    {"kyazdani42/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require "plugins.nvimtree"
        end,
    },

    -- Comments
    {"numToStr/Comment.nvim",
     config = function()
       require("plugins.comment")
     end,
    },

    {"lukas-reineke/indent-blankline.nvim",
     config = function()
       require("plugins.blankline")
     end,
    },

    {
        "windwp/nvim-autopairs",
        after = "nvim-cmp",
        config = function()
            require("plugins.autopairs")
        end
    },

    -- Telescope
    {"nvim-telescope/telescope.nvim",
     config = function()
       require "plugins.telescope"
     end,
   },

    -- Tmux
    {"alexghergh/nvim-tmux-navigation"},
}

-- setup packer + plugins
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
  print "Cloning packer .."
  fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }

  -- install plugins + compile their configs
  vim.cmd [[packadd packer.nvim]]
  vim.cmd "PackerSync"
end

-- Load all plugins
local present, packer = pcall(require, "packer")

if present then
    vim.cmd "packadd packer.nvim"
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
            return require("packer.util").float { border = "single" }
          end,
        },
    }

    for _, v in pairs(plugins) do
        packer.use(v)
    end
end
