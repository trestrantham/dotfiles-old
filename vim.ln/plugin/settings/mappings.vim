" basic Mappings
nnoremap ; :
nnoremap j gj
nnoremap k gk

" enter in normal mode removes highlight except in quickfix window
nnoremap <cr> :noh<cr>
autocmd BufReadPost Quickfix nnoremap <buffer> <cr> <cr>

" Remove all trailing whitespace
nnoremap <silent> <leader>kws :let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>

""" Fugitive
nmap <leader>gb :Gblame<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gll :Glog --<cr>
nmap <leader>gc :Gcommit<cr>

""" NERDTree
nmap <leader>n :NERDTreeToggle<cr>

""" Commentary
nmap <leader>c gcc<cr>
vmap <leader>c gc<cr>
xmap <leader>c gc<cr>

""" CtrlP
nmap <leader>ff  :CtrlP<cr>
nmap <leader>fa  :CtrlP app<cr>
nmap <leader>fm  :CtrlP app/models<cr>
nmap <leader>fc  :CtrlP app/controllers<cr>
nmap <leader>fv  :CtrlP app/views<cr>
nmap <leader>fh  :CtrlP app/helpers<cr>
nmap <leader>faj :CtrlP app/assets/javascripts<cr>
nmap <leader>fas :CtrlP app/assets/stylesheets<cr>
nmap <leader>fi  :CtrlP app/interactors<cr>
nmap <leader>fd  :CtrlP db<cr>
nmap <leader>fs  :CtrlP spec<cr>

""" Tabular
map <leader>tj  :Tabularize json<cr>
map <leader>t:  :Tabularize first_colon<cr>
map <leader>th  :Tabularize hash_rocket<cr>
map <leader>t=  :Tabularize first_equals<cr>
map <leader>t'  :Tabularize first_single_quote<cr>
map <leader>t"  :Tabularize first_double_quote<cr>
map <leader>t{  :Tabularize first_left_stash<cr>
map <leader>t}  :Tabularize first_right_stash<cr>
map <leader>t\| :Tabularize bar<cr>
