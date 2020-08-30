" syntax highlighting
:syntax on
    
:set autoindent

"show line number (relative)
:set number relativenumber
:set nu rnu

"status line always at the bottom
set laststatus=2

"set the behavior of backspace
set backspace=indent,eol,start

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

"status line
set statusline= "empty to set the rest
set statusline+=%f "the name of the file
set statusline+=%= "go to the left side
set statusline+=%y "type of file
set statusline+=\ row:%l\ col:%c "show the row and column

"use the correct plugin for each file type
filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4
set softtabstop=4

" On pressing tab, insert 4 spaces
set expandtab

" Automatically closing braces
inoremap {<CR> {<CR>}<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko
inoremap (<CR> (<CR>)<Esc>ko
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha

"Plugin config
let g:plug_timeout=99999
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
call plug#end()

"highlight the search string when using '/'  
set hls

" Changes coloring for YCM and ctrl p menus
colorscheme gruvbox

let g:gruvbox_contrast_dark = 'hard'

let mapleader = " "
hi Pmenu cterm=none ctermbg=DarkGray ctermfg=DarkYellow
set background=dark
set t_Co=256

" Enable debugging
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'

" Load YCM (only)
let &rtp .= ',' . expand( '<sfile>:p:h' )
" Mapping the exit and write command to common mistypings
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang>     <args>
command Q q
command WQ wq
command Wq wq

" Make Y yank till end of line
nnoremap Y y$

"Persistent undo
set undofile
set undodir=~/.vim/undodir

"stop YCM from opening preview window
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
