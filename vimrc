"############
"Plugin Management

call plug#begin('~/.vim/bundle')
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-haml'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'Valloric/YouCompleteMe'
Plug 'flazz/vim-colorschemes'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'mustache/vim-mustache-handlebars'
Plug 'swekaj/php-foldexpr.vim'
Plug 'justinmk/vim-sneak'
Plug 'vim-scripts/BufOnly.vim'
Plug 'tpope/vim-surround'
Plug 'benekastah/neomake'
Plug 'sheerun/vim-polyglot'

call plug#end()
"###########

"Sane default
syntax enable       "enable syntax
filetype plugin on  "load filetype-specific plugins
filetype indent on  "load filetype-specific indent

"Color Scheme
set t_Co=256
colorscheme Tomorrow-Night

set complete-=i     "ignore included file on autocomplete
set backspace=indent,eol,start     "Backspace delete these
set autoindent
set tabstop=4       "number of VISUAL space per-tab
set softtabstop=4   "number of spaces to INSERT when <TAB> is pressed
set smarttab        "shiftwidth when tab on beginning of line
set shiftwidth=4    "Size of an indent
set expandtab       "Change tab to spaces

set laststatus=2    "always display status bar. 2=always, 1=when > 1 window, 0=never
set showcmd     "display last command
set wildmenu    "visual autocomplete menu
set showmatch   "Highlight matching brackets
set autoread    "automatically reload file when file changes outside

set incsearch   "search as characters is typed
set smartcase   "case sensitive when search term include caps

set cursorline  "highlight current line

"Set whitespace characters display
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

set foldenable  "enable folding
set foldlevelstart=5    "open folds at this level by default
set foldmethod=indent   "fold by indent, unless overridden otherwise

set clipboard=unnamed   "Enable yank to system clipboard
set mouse=a             "Mouse use

"Display relative line number to cursor position
"and current line number on the cursor
set relativenumber
set number

set nowrap  "Turn off word wrap
set hidden   "Switch between buffer without saving

set nobackup  "Turn off backup before overwrite
set nowritebackup
set noswapfile  "Turn off temp file

set scrolloff=15  "scroll offset

"New split on below and right
set splitbelow
set splitright


"Set leader key
let mapleader="\<space>"

"Map double semi-colon to escape insert mode
inoremap jj <Esc>

"Map lead-s to save
nnoremap <leader>s :write<cr>
"Clear search highlight on enter
nnoremap <CR> :noh<CR><CR>
"Map lead-c to close buffer
nnoremap <leader>c :bd<cr>
"Map leader-h to move to previous buffer
nnoremap <silent> <leader>h :bprev<CR>
"Map leader-l to move to next buffer
nnoremap <silent> <leader>l :bnext<CR>

"map lead-b to toggle tagbar
nmap <leader>b :TagbarToggle<cr>
"map lead-ne to toggle NERDTree
nmap <leader>n :NERDTreeToggle<cr>

"Open tag buffer
map <leader>r :CtrlPBufTag<cr>
"Open ctrl to search through buffers
map <leader>p :CtrlPBuffer<cr>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"Keep visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" move vertically by visual line
nnoremap j gj
nnoremap k gk


"Replace gofmt with goimports, automatically called on save by vim-gp
let g:go_fmt_command = "goimports"

"If Ag is installed
if executable('ag')

    "Grep using silversearcher
    set grepprg=ag\ --nogroup\ --nocolor

    "Search via silversearcher
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

    "Disable caching, since silversearcher is fast enough
    let g:ctrlp_use_caching = 0

endif

"Airline vim mode shortform
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

"vim-airline config. enable tab line
let g:airline#extensions#tabline#enabled = 1
"vim-airline config. enable powerline fonts. need to have the fonts installed
let g:airline_powerline_fonts = 1

" Run Neomake on save
autocmd BufWrite * :Neomake
"vim-jsx configs
"Enable jsx syntax highlight for .js files
let g:jsx_ext_required = 1

"YCM configs
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 1
