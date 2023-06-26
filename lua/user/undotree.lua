local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

keymap('n', '<leader>u', ':UndotreeToggle<cr>:UndotreeFocus<cr>', options)

-- Persistent undo
vim.cmd [[
  if has("persistent_undo")
      set undodir=~/dev/.undodir
      set undofile
  endif
]]
