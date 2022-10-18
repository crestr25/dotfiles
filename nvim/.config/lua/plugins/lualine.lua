local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end
local options = {
  options = {
    icons_enabled = true,
    theme = 'onedark',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = { { 'filename', path = 1, shorting_target = 40 } },
    lualine_x = { 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_d = {},
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = { 'quickfix', 'fugitive', 'nvim-tree' },
}

lualine.setup(options)
