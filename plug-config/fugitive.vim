" FUGITIVE
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P "Add to info to status line

" Open git status vertical from right side
nnoremap <silent> <leader>gs :vertical :Git<cr>
nnoremap <silent> <leader>gS :vertical :Git<cr><C-w>o
" Git blame
nnoremap <silent> <leader>gb :Git blame<cr>

nnoremap <leader>gp :G pull origin master

nnoremap <silent> <leader>gt :0Gclog<cr>

augroup AutoMakes
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" Take the right part during merge conflict
nmap <leader>gml :diffget //3<CR>
" Take the left part during merge conflict
nmap <leader>gmh :diffget //2<CR>

nnoremap <leader>gc :Gvsplit :%<left><left>
