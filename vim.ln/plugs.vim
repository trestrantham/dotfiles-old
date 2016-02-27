" Install vim-plug if we don't arlready have it
if empty(glob("~/.vim/autoload/plug.vim"))
  " Ensure all needed directories exist  (Thanks @kapadiamush)
  execute 'mkdir -p ~/.vim/plugged'
  execute 'mkdir -p ~/.vim/autoload'
  " Download the actual plugin manager
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'benekastah/neomake'
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'corntrace/bufexplorer'
Plug 'elixir-lang/vim-elixir'
Plug 'emilford/vim-sweeter-vest'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'mattn/gist-vim'
Plug 'mileszs/ack.vim'
Plug 'rizzatti/funcoo.vim'
Plug 'rizzatti/dash.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive', { 'for': 'git' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

call plug#end()
