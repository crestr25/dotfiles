return {
    cmd = {
        "/usr/lib/lua-language-server/lua-language-server",
        "-E",
        "/usr/share/lua-language-server/main.lua"
    },
    settings = {

        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                [vim.fn.stdpath "config" .. "/lua"] = true,
            },
          },
          telemetry = {
            enable = false,
          },
        },
    },
}
