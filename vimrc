" This is a file to customize vim for me.
" Author: Dakota Knutson

" Enable Auto Indenting
set autoindent

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" Enable Line Numbers and make them grey vs yellow
set number
highlight LineNr ctermfg=white
highlight LineNr ctermbg=grey

" Make the colors of the signs or gutter column match the line nubmer colors
highlight SignColumn ctermbg=gray

" Make all comments green. Blue was to hard to read on the black background.
highlight Comment ctermfg=green
