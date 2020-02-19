set clipboard=unnamed
set relativenumber

set ignorecase
set smartcase
set hlsearch
set incsearch

set shiftwidth=2
set tabstop=2
set expandtab

set encoding=UTF-8

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'ayu-theme/ayu-vim'
  Plug 'ryanoasis/vim-devicons'
call plug#end()


set termguicolors
let ayucolor="mirage"
colorscheme ayu

let g:airline_powerline_fonts = 1
