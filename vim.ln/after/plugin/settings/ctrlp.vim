" Do not manage the working directory
let g:ctrlp_working_path_mode = 0

" Show hidden files
let g:ctrlp_show_hidden = 1

" Files and directories to ignore
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v\/(\.git|\.bundle|bin|vendor\/bundle|tmp|public\/system|coverage|app\/assets\/bower_components)$',
    \ 'file': '\v\.(gitkeep|gitignore|jpg|jpeg|gif|png|ico)$'
    \ }

" Use ag for ctrlp
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" let g:ctrlp_user_command = 'cd %s && git ls-files'
let g:ctrlp_use_caching = 0

let g:ctrlp_max_files = 0

" set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/app/assets/bower_components/
