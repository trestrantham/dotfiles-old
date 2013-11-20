" Do not manage the working directory
let g:ctrlp_working_path_mode = 0

" Show hidden files
let g:ctrlp_show_hidden = 1

" Files and directories to ignore
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v\/(\.git|\.bundle|bin|vendor\/bundle|tmp|public\/system|coverage)$',
    \ 'file': '\v\.(gitkeep|gitignore|jpg|jpeg|gif|png|ico)$'
    \ }
