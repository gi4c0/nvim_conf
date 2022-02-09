local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

-- Global extension names to install when they aren't installed.
vim.g.coc_global_extensions = {
   'coc-json', 'coc-tsserver', 'coc-tslint-plugin', 'coc-rls', 'coc-format-json',
   'coc-tslint', 'coc-spell-checker', 'coc-yaml', 'coc-sh', 'coc-fish', 'coc-go',
   'coc-protobuf',
}

-- Menu -> JSON format
keymap('n', '<leader>mj', ':CocCommand formatJson --indent=2 --quote=" --trailing=false<CR>', options)

-- Scrolling in float window

vim.cmd [[
  nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
]]

-- Map keys for goto's
keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
keymap('n', '<leader>gt', '<Plug>(coc-type-definition)', { silent = true })
keymap('n', '<leader>gy', '<Plug>(coc-implementation)', { silent = true })
keymap('n', '<leader>gr', '<Plug>(coc-references)', { silent = true })

-- Toggle menu of options on current word
keymap('n', '<leader>a', '<Plug>(coc-codeaction-selected)', { silent = true })
keymap('v', '<leader>a', '<Plug>(coc-codeaction-selected)', { silent = true })

-- Map for rename current word
keymap('n', '<leader>mrr', '<Plug>(coc-rename)', { silent = true })

-- Restart Coc server
keymap('n', '<leader>mrs', ':CocRestart<cr>', { silent = true })

-- Rename file/imports
keymap('n', '<leader>mrf', ':CocCommand workspace.renameCurrentFile<CR>', { silent = true })

-- Use K to show documentation in preview window.
vim.cmd [[
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  nnoremap <silent> K :call <SID>show_documentation()<CR>
]]

-- Use <c-space> to trigger completion.
keymap('i', '<leader>mrf', 'coc#refresh()', { silent = true, noremap = true, expr = true })
-- inoremap <silent><expr> <c-space> coc#refresh()

-- Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
-- position. Coc only does snippet and additional edit on confirm.
-- <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use ctrl+k and ctrl+j to navigate diagnostics
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

" Show list of errors from current buffer
nmap <silent> <leader>el :CocDiagnostics<CR>
nmap <silent> <leader>eL :CocDiagnostics<CR>

vim.cmd [[
  augroup cocGroup
    autocmd!
    " Highlight the symbol and its references when holding the cursor.
    " autocmd CursorHold * silent call CocActionAsync('highlight')
    autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
  augroup END
]]
