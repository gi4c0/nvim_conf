return {
  'navarasu/onedark.nvim',
  init = function()
    require('onedark').setup {
      style = 'warmer',
      transparent = true,
      code_style = {
        comments = 'italic',
        keywords = 'bold',
        -- functions = 'none',
        -- strings = 'none',
        -- variables = 'none'
      },
      lualine = {
        transparent = true, -- lualine center bar transparency
      },
    }

    require('onedark').load()
  end
}
