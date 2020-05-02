set clipboard=unnamedplus

set relativenumber
set number

set ignorecase
set smartcase
set hlsearch
set incsearch

set shiftwidth=2
set tabstop=2
set expandtab

set encoding=UTF-8
if has("nvim")
  " Bootstrap Plug
  let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
  if !filereadable(autoload_plug_path)
    silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs 
        \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  unlet autoload_plug_path
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'ayu-theme/ayu-vim'
  Plug 'ryanoasis/vim-devicons'
call plug#end()


set termguicolors
let ayucolor="mirage"
colorscheme ayu

let g:airline_powerline_fonts = 1


nnoremap <Leader>f :Files<Cr>
nnoremap <Leader>b :Buffers<Cr>
nnoremap <Leader>r :Rg<Cr>
