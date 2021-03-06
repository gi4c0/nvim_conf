require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'branch'},
    lualine_b = {'filename'},
    lualine_c = {
      {
        'diagnostics',
        -- table of diagnostic sources, available sources:
        -- nvim_lsp, coc, ale, vim_lsp
        sources = { 'coc' },
        -- displays diagnostics from defined severity
        -- sections = {'error', 'warn', 'info', 'hint'},
        -- all colors are in format #rrggbb
        -- color_error = nil, -- changes diagnostic's error foreground color
        -- color_warn = nil, -- changes diagnostic's warn foreground color
        -- color_info = nil, -- Changes diagnostic's info foreground color
        -- color_hint = nil, -- Changes diagnostic's hint foreground color
        -- symbols = {error = 'E: ', warn = 'W: ', info = 'I: ', hint = 'H: '}
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  tabline = {},
  extensions = {}
}
