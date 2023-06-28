require("toggleterm").setup{
  open_mapping = [[<c-t>]],
  hide_numbers = true,
  direction = "float",
  shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  shading_factor = 2,
  close_on_exit = true,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  shell = "fish",
  float_opts = {
    border = 'curved',
    -- width = <value>,
    -- height = <value>,
    winblend = 0,
    -- zindex = <value>,
  },
}


-- Terminal window mappings
-- It can be helpful to add mappings to make moving in and out of a terminal easier once toggled, whilst still keeping it open.

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
