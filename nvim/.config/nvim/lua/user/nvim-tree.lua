local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
  disable_netrw = true,
  hijack_netrw = true,
  update_cwd= false,

  diagnostics = {
    enable = false,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },

  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = '',
        git = {
          unstaged = '✗',
          staged = '✓',
          unmerged = '',
          renamed = '➜',
          untracked = '★',
          deleted = '',
          ignored = '◌',
        },
        folder = {
          default = '',
          open = '',
          arrow_open = "",
          arrow_closed = "",
          empty = ' ',
          empty_open = ' ',
          symlink = '',
          symlink_open = '',
        },
      },
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },

  filters = {
    dotfiles = true,
    custom = { '__pycache__' }
  },

  view = {
    width = 35,
    side = 'left',
    mappings = {
      custom_only = false,
      list = {
        { key = "h", cb = tree_cb "toggle_dotfiles" },
        { key = "o", cb = tree_cb "edit" },
        { key = "s", cb = tree_cb "split" },
        { key = "t", cb = tree_cb "tabnew" },
        { key = "v", cb = tree_cb "vsplit" },
        { key = "?", cb = tree_cb "toggle_help" },
      },
    },
  },
})
