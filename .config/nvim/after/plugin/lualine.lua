require('lualine').setup{
  options = {
    theme = 'auto',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_y = {'progress'},
  }
}
