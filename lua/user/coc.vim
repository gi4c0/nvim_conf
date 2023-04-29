" Global extension names to install when they aren't installed.
let g:coc_global_extensions = [
  \ 'coc-json', 'coc-tsserver', 'coc-tslint-plugin', 'coc-rust-analyzer', 'coc-format-json',
  \ 'coc-tslint', 'coc-spell-checker', 'coc-yaml', 'coc-sh', 'coc-fish', 'coc-go',
  \ 'coc-protobuf', 'coc-lua', 'coc-zig', 'coc-eslint'
\]

" Menu -> JSON format
nnoremap <leader>mj :CocCommand formatJson --indent=2 --quote=" --trailing=false<CR>

" Scrolling in float window
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Map keys for goto's
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <C-w>v <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> gy <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Toggle menu of options on current line
vmap <silent> <C-Space> <Plug>(coc-codeaction-line)
" nmap <silent> <C-Space> <Plug>(coc-codeaction-line)

" Toggle menu of options on current word
vmap <silent> <leader>a <Plug>(coc-codeaction-selected)
nmap <silent> <leader>a <Plug>(coc-codeaction-selected)

" Map for rename current word
nmap <silent> <leader>mrr <Plug>(coc-rename)

" Restart Coc server
nmap <silent> <leader>mrs :CocRestart<cr>

" Menu (Coc) Search
nmap <leader>ms :CocSearch 

" Rename file/imports
nmap <silent> <leader>mrf :CocCommand workspace.renameCurrentFile<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

inoremap <silent><C-k> <C-\><C-O>:call CocActionAsync('showSignatureHelp')<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use ctrl+k and ctrl+j to navigate diagnostics
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

" Show list of errors from current buffer
nmap <silent> <leader>el :CocDiagnostics<CR>
nmap <silent> <leader>eL :CocDiagnostics<CR>

augroup cocGroup
  autocmd!
  " Highlight the symbol and its references when holding the cursor.
  " autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
augroup END
