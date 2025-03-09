return {
  'echasnovski/mini.nvim',
  version = false,
  keys = {
    { '<leader>fm', function() require('mini.files').open(vim.api.nvim_buf_get_name(0)) end }
  }
}
