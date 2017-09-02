" Colorscheme
colorscheme mydesert

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Quramy/tsuquyomi'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" CtrlP Options use gitignore to exclude files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Remap local leader to space
let mapleader=" "

" Netrw Options and keybindings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Configure tabs
set tabstop=4
set shiftwidth=4
set expandtab

nnoremap <leader>e : e .<CR>

