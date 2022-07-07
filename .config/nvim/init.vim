" simple coding
set nocompatible            " disable compatibility to old-time vi
set mouse=v                 " middle-click paste with mouse
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set clipboard=unnamedplus   " set clipboard to system

" filetype syntax on
filetype on " syntax based on filename
filetype plugin on " allow indent based on filename
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on
" tabs
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set wildmode=longest,list   " get bash-like tab completions

" search
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set hlsearch                " highlight search results
" shortcuts
" toggle paste mode
:noremap <F2> :set paste! nopaste?<CR>

" toggle number lines
:noremap <F3> :set nonumber! nonumber?<CR>

" plugins
call plug#begin()

Plug 'deoplete-plugins/deoplete-clang'

call plug#end()

" config
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'vim': ['vint'],
    \ 'cpp': ['clang'],
    \ 'c': ['clang']
\}
" custom setting for clangformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

