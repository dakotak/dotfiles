
set nocompatible            " disable vi compatibility
set showmatch               " show matching brackets
set ignorecase              " ignore case when searching
set hlsearch                " highlight search results
set incsearch               " incremental search


set tabstop=4               " tab width
set softtabstop=4           " tab width when editing
set expandtab               " use spaces instead of tabs
set shiftwidth=4            " number of spaces to use for autoindenting

set autoindent              " autoindent
set cc=80                   " set colorcolumn to 80

set wildmode=longest,list   " command line completion mode
filetype plugin indent on   " enable filetype detection, plugins and indenting
filetype plugin on          " enable filetype plugins
syntax on                   " enable syntax highlighting
set mouse=a                 " enable mouse support

set cursorline              " highlight current line
set ttyfast                 " speed up redrawing screen

" set spell                " enable spell checking
