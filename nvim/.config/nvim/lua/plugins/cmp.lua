local cmp = {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-buffer",     -- Buffer completions
        "hrsh7th/cmp-path",       -- Path completions
        "hrsh7th/cmp-nvim-lsp",   -- lsp completions
        "hrsh7th/cmp-nvim-lua",   -- lua completions
        "hrsh7th/cmp-cmdline",    -- Commandline completions
        "saadparwaiz1/cmp_luasnip", -- snippet completions
        "L3MON4D3/LuaSnip",       -- Snippet engine
        "rafamadriz/friendly-snippets", -- Bunch of snippets
        {
            "windwp/nvim-autopairs",
            config = function()
                local autopairs = require("nvim-autopairs")

                autopairs.setup({
                    check_ts = true, -- treesitter integration
                    disable_filetype = { "TelescopePrompt" },
                })

                local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                local cmp_status_ok, cmp = pcall(require, "cmp")
                if not cmp_status_ok then
                    return
                end
                cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({}))
            end,
        },
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets/snipmate" })
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({

            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping(
                    cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    { "i", "c" }
                ),
                ["<C-p>"] = cmp.mapping(
                    cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    { "i", "c" }
                ),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expandable() then
                        luasnip.expand()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif require("copilot.suggestion").is_visible() then
                        require("copilot.suggestion").accept()
                    else
                        fallback()
                    end
                end, {
                    "i",
                    "s",
                }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, {
                    "i",
                    "s",
                }),
                ["<Esc>"] = cmp.mapping(function(fallback)
                    require("luasnip").unlink_current()
                    fallback()
                end),
            }),
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, item)
                    local icons = require("utils.icons").kind
                    item.kind = icons[item.kind]
                    item.menu = ({
                        nvim_lsp = "Lsp",
                        nvim_lua = "Lua",
                        luasnip = "Snippet",
                        buffer = "Buffer",
                        path = "Path",
                    })[entry.source.name]
                    return item
                end,
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
            experimental = { ghost_text = true },
        })

        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { { name = "buffer" } },
        })
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
        })
    end,
}

return cmp
