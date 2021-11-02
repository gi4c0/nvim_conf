nnoremap <silent> <C-m> :lua require("harpoon.mark").add_file()<CR>

nnoremap <silent> <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent> <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent> <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent> <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <silent> <leader>5 :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <silent> <leader>6 :lua require("harpoon.ui").nav_file(6)<CR>

nnoremap <silent> <C-h> :lua require("harpoon.ui").toggle_quick_menu()<CR>
