return {
  'kevinhwang91/rnvimr',
  config = function()
    -- Make Ranger replace netrw and be the file explorer
    vim.g.rnvimr_ex_enable = 1

    -- vim.api.nvim_set_keymap("n", "<leader>r", ":RnvimrToggle<CR>", options)

    --  Make Ranger to be hidden after picking a file
    vim.g.rnvimr_enable_picker = 1

    -- Make Neovim wipe the buffers corresponding to the files deleted by Ranger
    vim.g.rnvimr_enable_bw = 1

    -- Customize the initial layout
    vim.cmd [[
    " Customize the initial layout
    let g:rnvimr_layout = { 'relative': 'editor',
    \ 'width': float2nr(round(0.9 * &columns)),
    \ 'height': float2nr(round(0.9 * &lines)),
    \ 'col': float2nr(round(0.05 * &columns)),
    \ 'row': float2nr(round(0.05 * &lines)),
    \ 'style': 'minimal' }
    ]]

    -- Add a shadow window, value is equal to 100 will disable shadow
    vim.g.rnvimr_shadow_winblend = 40

  end,
  keys = {
    -- { "<leader>r", ":RnvimrToggle<CR>", noremap = true, silent = true }
  }
}
