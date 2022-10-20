local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

local options = {
  options = {
    -- Pretty stuff
    indicator = {
        icon = "▎",
    },
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    -- Other commands
    numbers = "none",
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    -- Heavy processing so don't add a lot of stuff
    offsets = {
        {
          filetype = "undotree",
          text = "Undotree",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "NvimTree",
          text = "Explorer",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "DiffviewFiles",
          text = "Diff View",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "flutterToolsOutline",
          text = "Flutter Outline",
          highlight = "PanelHeading",
        },
        {
          filetype = "packer",
          text = "Packer",
          highlight = "PanelHeading",
          padding = 1,
        },
    },
    show_tab_indicators = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = false
  },
}

bufferline.setup(options)
