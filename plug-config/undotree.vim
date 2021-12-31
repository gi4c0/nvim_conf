nnoremap <silent> <leader>u :UndotreeToggle<cr>:UndotreeFocus<cr>

" Persistent undo
if has("persistent_undo")
    set undodir=~/dev/.undodir
    set undofile
endif
