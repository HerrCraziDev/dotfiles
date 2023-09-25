set history=500

" Filetype plugins
filetype plugin on
filetype indent on

" Auto read externally modified files
set autoread
au FocusGained,BufEnter * silent! checktime

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Regexes, search
set magic
set incsearch
set showmatch
set smartcase
set ignorecase
set hlsearch

" Line numbers
set number

" Ruler
set ruler

" Colors
syntax enable
set t_Co=256

" Default filetypes
set ffs=unix,dos,mac


" Tabs and indentation
""""""""""""""""""""""

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


