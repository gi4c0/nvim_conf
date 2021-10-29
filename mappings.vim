" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize -8<CR>
nnoremap <silent> <M-k>    :resize +8<CR>
nnoremap <silent> <M-h>    :vertical resize -8<CR>
nnoremap <silent> <M-l>    :vertical resize +8<CR>

nnoremap <silent> Q :bdelete<cr>

" Save file
nnoremap <silent> <C-s> :w<cr>

" Clear search
nnoremap <silent> <leader>sc :nohlsearch<CR>

" better mark jumping
nnoremap ' `

" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk

" Remap Y to yank till end of line
nnoremap Y y$

" Find and replace selected text with prompted
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Jump to notes
nnoremap <leader>on :e ~/notes.md<cr>

" Open vimrc
nnoremap <leader>fed :edit $MYVIMRC<CR>

" Output path to current file/buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%' 

" New tab with <C-t>
nnoremap <C-t> :tabedit<CR>

" Change first word
nnoremap cI ^ciw

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

inoremap <C-l> <esc>la
