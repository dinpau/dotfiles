" Colorscheme
colorscheme mydesert

set nocompatible              " be iMproved, required
runtime macros/matchit.vim
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Python support
Plugin 'davidhalter/jedi-vim'
" Clevertab Accept Autocompletion
Plugin 'neitanod/vim-clevertab'
" Git 
Plugin 'tpope/vim-fugitive'
" Typescript support
Plugin 'Quramy/tsuquyomi'
Plugin 'HerringtonDarkholme/yats.vim'
" Fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'
" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'jvanja/vim-bootstrap4-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" CtrlP Options use gitignore to exclude files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Disable linewrap by default
set nowrap

" Remap local leader to space
let mapleader=" "

" Netrw Options and keybindings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Ctrl-Space for completions. Heck Yeah!
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Clevertab configuration pick omnicompletion ultinsips chain
call CleverTab#OmniFirst()

" Configure autocompletion
:set completeopt=longest,menuone "Pick lcc

" Autocompletion for html/css/xml
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" Configure tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Remap the leader key
nnoremap <leader>e : e .<CR>

