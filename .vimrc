" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
filetype plugin indent on

" get rid of preview window when done
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

filetype off
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
filetype plugin indent on

set sessionoptions-=options
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" enables syntax highlighting by default.
if has("syntax")
syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" jump to the last position when reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" load indentation rules and  according to the detected filetype.
if has("autocmd")
filetype plugin indent on
set nocp
filetype plugin on
endif

" Recommended features
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set relativenumber
set number

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
source /etc/vim/vimrc.local
endif

" Opens vimrc for editing.
nmap <Leader>v :e /etc/vim/vimrc<CR>

" Set default working dir

colorscheme elflord
set foldmethod=marker
   filetype on
filetype plugin on
set grepprg =grep\ -nH\ $*
set autoindent
set shiftwidth =4
set tabstop=4
set wildmenu
set wildmode =list:longest,full
set backspace =2
set hlsearch
" closing a tab removes the buffer
set nohidden
" tabs bar always on
set showtabline=2

" maps tab operations to be like Firefox: ctrl+tab goes to next,
" ctrl+shift+tab goes to previous, and ctrl+t creates a new tab.
map :Q :q
map :W :w
map :qq :q!
map <C-Tab> gt
map <C-S-Tab> gT
map <C-t> :tabnew<cr>
map ,j <C-w>j
map ,k <C-w>k
map ,l <C-w>l
map ,h <C-w>h
map p p==
nmap <space> zz
nmap n nzz
nmap N Nzz

" Insert mode stuff:
" when autocomment makes next line commented, this undoes the comment
" but only guaranteed to work for C++ comments of the form '// '
inoremap <S-CR> <BS><BS><BS>

" delete previous word like in Windows
inoremap <C-BS> <Esc>bdawa
" delete next word with ctrl+shift+backspace
inoremap <C-S-BS> <Esc>wdawi

set autoread
" 
nnoremap <F4> :set hlsearch! hlsearch?<CR>
" remap jj to esc in insert mode
inoremap jj <Esc>j
nnoremap JJJJ <Nop>
" comments out current line
inoremap <C-c> <Esc>0i// <Esc>A
" smart paste from clipboard. Shift+Ins
inoremap <S-Insert> <ESC>"+p`]a
" Make { and } open on separate lines with cursor in between
inoremap {<Cr> {<Cr>}<Esc>O


" Activate camelcase as default
" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" sunmap w
" sunmap b
" sunmap e

" <<<<<<<<<<<<<<<<<<<Function Mappings>>>>>>>>>>>>>>>>>>
" pastes current time with F3 in insert mode.
inoremap <F3> <C-R>=strftime('%c')<CR>
nnoremap <F2> <Esc>2jA
nnoremap <F4>  <Esc>:noh<CR><Esc>

" printer settings 
set printoptions=paper:letter,number:y

" get rid of swap files
set noswapfile

" Generate default C++
autocmd bufnewfile *.cpp so /home/paul/Templates/cppheader.txt
autocmd bufnewfile *.cpp exe "1," . 9 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.cpp exe "1," . 9 . "g/Creation Date :.*/s//Creation Date : " .strftime("%m-%d-%Y")
autocmd Bufwritepre,filewritepre *.cpp execute "normal ma"
autocmd Bufwritepre,filewritepre *.cpp exe "1," . 9 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.cpp execute "normal `a"

" latex
" set grep to always generate a file name
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

au FocusLost * silent! wa
