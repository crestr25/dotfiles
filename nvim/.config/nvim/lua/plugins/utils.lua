return {
    { "nvim-lua/plenary.nvim", lazy = true },
    { "MunifTanjim/nui.nvim" },
    {
        "moll/vim-bbye",
        event = { "BufRead" },
        keys = { { "<leader>d", "<cmd>Bdelete!<cr>", desc = "Close Buffer" } },
    },

    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
    -- comments
    { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
    {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        opts = {
            hooks = {
                pre = function()
                    require("ts_context_commentstring.internal").update_commentstring({})
                end,
            },
        },
        config = function(_, opts)
            require("mini.comment").setup(opts)
        end,
    },

    -- indent guides for Neovim
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            -- char = "▏",
            filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },

            show_trailing_blankline_indent = false,
            use_treesitter = true,
            show_current_context = true,
        },
    },
    -- Tmux
    {
        "alexghergh/nvim-tmux-navigation",
        config = function()
            local nvim_tmux_nav = require("nvim-tmux-navigation")
            nvim_tmux_nav.setup({
                disable_when_zoomed = true, -- defaults to false
            })
        end,
    },
}
