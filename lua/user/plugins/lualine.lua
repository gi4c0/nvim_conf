return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
       'nvim-tree/nvim-web-devicons',
       {
            'SmiteshP/nvim-navic',
            config = {
                lsp = {
                    auto_attach = true,
                    preference = { 'typescript-tools' },
                },
            }
        },
  },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'onedark',
      component_separators = {'', ''},
      section_separators = {'', ''},
      disabled_filetypes = {}
    },
    sections = {
      lualine_a = {'branch'},
      lualine_b = {'filename'},
      lualine_c = {
          { -- This is a bread crumbs plugin `SmiteshP/nvim-navic`
              "navic",

              -- Component specific options
              color_correction = nil, -- Can be nil, "static" or "dynamic". This option is useful only when you have highlights enabled.
              -- Many colorschemes don't define same background for nvim-navic as their lualine statusline backgroud.
              -- Setting it to "static" will perform a adjustment once when the component is being setup. This should
              --   be enough when the lualine section isn't changing colors based on the mode.
              -- Setting it to "dynamic" will keep updating the highlights according to the current modes colors for
              --   the current section.

              navic_opts = nil  -- lua table with same format as setup's option. All options except "lsp" options take effect when set here.
          },
        {
          'diagnostics',
          -- table of diagnostic sources, available sources:
          -- nvim_lsp, coc, ale, vim_lsp
          sources = { 'coc', 'nvim_lsp' },
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
}
