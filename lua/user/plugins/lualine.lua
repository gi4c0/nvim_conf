local function full_path()
    local path = vim.fn.expand('%')
    return '/' .. path:match("([^/]+/[^/]+)$")
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
       'nvim-tree/nvim-web-devicons',
  },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'tokyonight',
      component_separators = {'', ''},
      section_separators = {'', ''},
      disabled_filetypes = {}
    },
    sections = {
      lualine_a = {'branch'},
      lualine_b = {'diagnostics'},
      lualine_c = {full_path},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    tabline = {},
    extensions = {}
  }
}
