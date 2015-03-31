execute pathogen#infect()
syntax on
filetype plugin indent on

"Map double semi-colon to escape insert mode
imap jj <Esc>

let mapleader="\<tab>"
"map lead-ne to open NERDTree
nmap <leader>ne :NERDTree<cr>
"Map lead-s to save
nmap <leader>s :write<cr>

"Map C-n to open-and close the file browser
map <silent> <C-n> :NERDTreeToggle<CR>

"Size of a tab button
set tabstop=4

"Size of an indent
set shiftwidth=4

"Display absolute line number
"set number

"Display relative line number to cursor position
set relativenumber

"Turn off word wrap
set nowrap

"Set 256 color terminal
set t_Co=256
colorscheme molokai

"Replace gofmt with goimports, automatically called on save by vim-gp
let g:go_fmt_command = "goimports"
