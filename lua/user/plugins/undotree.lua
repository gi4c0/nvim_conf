return {
  'mbbill/undotree',

  init = function()
    -- Persistent undo
    vim.cmd [[
      if has("persistent_undo")
        set undodir=~/dev/.undodir
        set undofile
      endif
    ]]
  end,

  keys = {
    {'<leader>u', ':UndotreeToggle<cr>:UndotreeFocus<cr>', noremap = true, silent = true }
  }
}
