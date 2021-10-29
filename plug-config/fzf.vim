" Make Ripgrep ONLY search file contents and not filenames
" command! -bang -nargs=* Rg
  " \ call fzf#vim#grep(
  " \   'rg --column --line-number --hidden --smart-case --no-heading --color=always '.shellescape(<q-args>), 1,
  " \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  " \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -e'}, 'right:50%', '?'),
  " \   <bang>0)

" Show list of buffers
nnoremap <silent> <C-Space> :Buffers<CR>

" File history
nnoremap <silent> <leader>fr :History<CR>

" Search through the project
nnoremap <leader>/ :Rg<space>

" Show list of files
nnoremap <silent> <C-p> :GFiles<CR>

" Git (history) commits
nnoremap <silent> <leader>ghh :Commits<CR>

" Git (history) commits for buffer
nnoremap <silent> <leader>ghb :BCommits<CR>

" ============ Fzf ===================
let g:fzf_layout = { 'window': { 'width': 0.85, 'height': 0.85 } }
" let g:fzf_layout = { 'down': '40%' }

" let $FZF_DEFAULT_OPTS='--reverse'

let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']

" Check out branch
nnoremap <leader>gc :GBranches<CR>

" Search word under the cursor in project
nnoremap <leader>* yiw:Rg <C-r>0<CR>

" Search visually selected word in project
vnoremap <leader>* y:Rg <C-r>0<CR>

nnoremap <silent> <Leader>ff :Files <C-R>=expand('%:h')<CR><CR>

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

nnoremap <leader>bD :BD<CR>
