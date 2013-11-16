" basic Mappings
nnoremap ; :
nnoremap j gj
nnoremap k gk

" enter in normal mode removes highlight except in quickfix window
nnoremap <CR> :noh<CR>
autocmd BufReadPost Quickfix nnoremap <buffer> <CR> <CR>

""" Fugitive
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>

""" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
