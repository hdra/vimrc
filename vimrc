"############
"START VUNDLE
set nocompatible "set to Improved - required for Vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Manage Vundle with Vundle
Plugin 'gmarik/Vundle.vim'


Plugin 'tpope/vim-sensible'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'

call vundle#end()    

filetype plugin on
"END VUNDLE
"###########

"Map double semi-colon to escape insert mode
imap jj <Esc>

let mapleader="\<tab>"
"map lead-ne to open NERDTree
nmap <leader>ne :NERDTree<cr>
"Map lead-s to save
nmap <leader>s :write<cr>

"Map C-n to open-and close the file browser
map <silent> <C-n> :NERDTreeToggle<CR>

"Map C-h to move to previous buffer
nmap <silent> <C-h> :bprev<CR>

"Map C-l to move to next buffer
nmap <silent> <C-l> :bnext<CR>

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

"Switch between buffer without saving
set hidden

"Turn off backup before overwrite
set nobackup
set nowritebackup

"Set 256 color terminal
set t_Co=256
colorscheme badwolf
let g:badwolf_darkgutter = 1

"Replace gofmt with goimports, automatically called on save by vim-gp
let g:go_fmt_command = "goimports"

"vim-airline config. enable tab line
let g:airline#extensions#tabline#enabled = 1
"vim-airline config. enable powerline fonts. need to have the fonts installed
let g:airline_powerline_fonts = 1
