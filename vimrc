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
Plugin 'plasticboy/vim-markdown'
Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'


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

"Map lead-c to close buffer
nmap <leader>c :bd<cr>

"Map C-n to open-and close the file browser
map <silent> <C-n> :NERDTreeToggle<CR>

"Map C-h to move to previous buffer
nmap <silent> <C-h> :bprev<CR>

"Map C-l to move to next buffer
nmap <silent> <C-l> :bnext<CR>

"Map space to colon
noremap <space> :

"Size of a tab character
set tabstop=4

"Size of an indent
set shiftwidth=4

"Change tab to spaces
set expandtab

"Display absolute line number
"set number

"Enable yank to system clipboard
set clipboard=unnamed

"Display relative line number to cursor position
set relativenumber

"Turn off word wrap
set nowrap

"Switch between buffer without saving
set hidden

"Turn off backup before overwrite
set nobackup
set nowritebackup

"Turn off temp file
set noswapfile

"Set 256 color terminal
set t_Co=256
colorscheme wombat256 

"Replace gofmt with goimports, automatically called on save by vim-gp
let g:go_fmt_command = "goimports"

"vim-airline config. enable tab line
let g:airline#extensions#tabline#enabled = 1
"vim-airline config. enable powerline fonts. need to have the fonts installed
let g:airline_powerline_fonts = 1

"Syntastic configs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" On by default, turn it off for html
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
	\ 'passive_filetypes': ['html'] }
" Use jsxhint (jshint wrapper to add supports for jsx, uses ~/.jshintrc)
let g:syntastic_javascript_checkers = ['jsxhint']


"vim-jsx configs
"Enable jsx syntax highlight for .js files
let g:jsx_ext_required = 0


"YCM configs
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 1
