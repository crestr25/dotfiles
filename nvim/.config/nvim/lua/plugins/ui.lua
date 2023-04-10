return {
    {
        "cpea2506/one_monokai.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    theme = "one_monokai",
                },
            })
            vim.cmd.colorscheme("one_monokai")
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        config = function()
            require("plugins.config.neo-tree")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {},
        config = function()
            require("plugins.config.lualine")
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
    {
        "akinsho/bufferline.nvim",
        event = "BufWinEnter",
        keys = {
            { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
            { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
        },
        opts = {
            options = {
                diagnostics = "nvim_lsp",
                always_show_bufferline = false,
                diagnostics_indicator = function(_, _, diag)
                    local icons = {
                        Error = " ",
                        Warn = " ",
                    }
                    local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                        .. (diag.warning and icons.Warn .. diag.warning or "")
                    return vim.trim(ret)
                end,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Neo-tree",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
            },
        },
    },
    {
        "akinsho/toggleterm.nvim",
        event = { "BufReadPost" },
        opts = {
            open_mapping = [[<C-\>]],
            start_in_insert = true,
            direction = "float",
            autochdir = false,
            float_opts = {
                -- border = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█" }, -- [ top top top - right - bottom bottom bottom - left ]
                border = { " ", "▁", " ", "▎", " ", "▔", " ", "▕" }, -- [ top top top - right - bottom bottom bottom - left ]
                winblend = 0,
            },
            highlights = {
                FloatBorder = { link = "ToggleTermBorder" },
                Normal = { link = "ToggleTerm" },
                NormalFloat = { link = "ToggleTerm" },
            },
            winbar = {
                enabled = true,
                name_formatter = function(term)
                    return string.format("%d:%s", term.id, term:_display_name())
                end,
            },
        },
    },
}
