return {
  'junegunn/fzf.vim',
  enabled = true,

  dependencies = {
    'junegunn/fzf'
  },

  config = function()
    vim.cmd [[
      let g:fzf_layout = { 'window': { 'width': 0.85, 'height': 0.85 } }
      " let g:fzf_layout = { 'down': '40%' }

      " let $FZF_DEFAULT_OPTS='--reverse'

      let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']
    ]]
  end,

  keys = {
    { '<C-p>', ':GFiles<CR>', noremap = true, silent = true },
    { '<leader>fr', ':History<CR>', noremap = true, silent = true },
    -- { '<C-Space>', ':Buffers<CR>', noremap = true, silent = true },
  }
}
