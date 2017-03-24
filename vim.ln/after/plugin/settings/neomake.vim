" Configure gutter values and colors
let g:neomake_warning_sign = {
  \ 'text': '△',
  \ 'texthl': 'GitGutterChangeDelete',
  \ }
let g:neomake_error_sign = {
  \ 'text': '✘',
  \ 'texthl': 'GitGutterDelete',
  \ }

let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_elixir_enabled_makers = ['mix', 'credo']

" Use eslint when there's a config present
function! NeomakeESlintChecker()
  let l:npm_bin = ''
  let l:eslint = 'eslint'

  if executable('npm')
    let l:npm_bin = split(system('npm bin'), '\n')[0]
  endif

  if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
    let l:eslint = l:npm_bin . '/eslint'
  endif

  let b:neomake_javascript_eslint_exe = l:eslint
endfunction

autocmd FileType javascript :call NeomakeESlintChecker()
autocmd! BufWritePost,BufReadPost * Neomake
