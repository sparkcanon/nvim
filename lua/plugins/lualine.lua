require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'moonfly',
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(str)
          return str:sub(1, 1)
        end,
      },
    },
    lualine_b = { 'branch', 'diff' },
    lualine_c = { 'filename' },
    lualine_x = { 'diagnostics', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
}
