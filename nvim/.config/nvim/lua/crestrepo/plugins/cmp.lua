return {
    "hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp",   -- Nvim-lsp completion
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path",       -- source for file system paths
        "L3MON4D3/LuaSnip",       -- snippet engine
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        {
            "zbirenbaum/copilot-cmp",
            after = { "copilot.lua" },
        },
    },
    config = function()

        vim.opt.completeopt = { "menu", "menuone", "noselect" }
        vim.opt.shortmess:append("c")

        require("copilot_cmp").setup()

        -- setup lspkind
        local lspkind = require("lspkind")
        lspkind.init({})
        
        -- setup cmp
        local cmp = require("cmp")

        cmp.setup({
            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = "copilot" },
                { name = "nvim_lsp" },
                { name = "path" }, -- file system paths
                { name = "buffer" }, -- text within current buffer
            }),

            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}), -- previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}), -- next suggestion
                ["<C-y>"] = cmp.mapping(
                      cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                      },
                      { "i", "c" }
            ),
            }),

            snippet = { -- configure how nvim-cmp interacts with snippet engine
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
        })
    end,
}
