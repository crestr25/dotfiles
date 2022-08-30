local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = {
        "python",
        "vim",
        "lua",
        "c",
        "json",
        "yaml",
        "vim",
        "dockerfile",
        "markdown",
        "toml",
        "go"
    },
    highlight = { enable = true },
    indent = { enable = true, disable = { "python", "yaml" } },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    incremental_selection = { enable = true },
    autotag = { enable = true },
}
