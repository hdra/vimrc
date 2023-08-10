call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ibhagwan/fzf-lua'

Plug 'tpope/vim-fugitive'
Plug 'google/vim-searchindex'
Plug 'vim-scripts/BufOnly.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-test/vim-test'
Plug 'junegunn/vim-easy-align'

Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'leoluz/nvim-dap-go'

Plug 'joshdick/onedark.vim'
Plug 'sainnhe/sonokai'
Plug 'rmehri01/onenord.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'ray-x/aurora'
Plug 'ray-x/starry.nvim'

Plug 'rebelot/heirline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'elixir-editors/vim-elixir'
Plug 'SmiteshP/nvim-navic'

Plug 'nvim-treesitter/nvim-treesitter'

Plug 'nvim-lua/plenary.nvim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'ray-x/guihua.lua'
Plug 'ray-x/go.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lua'

Plug 'hashivim/vim-terraform'

Plug 'github/copilot.vim'

call plug#end()

syntax enable       "enable syntax
filetype plugin on  "load filetype-specific plugins
filetype indent on  "load filetype-specific indent

set t_Co=256
set t_ut=
set background=dark
set termguicolors

colorscheme kanagawa

set complete-=i     "ignore included file on autocomplete
set backspace=indent,eol,start     "backspace delete these set autoindent
set tabstop=2       "number of visual space per-tab
set softtabstop=2   "number of spaces to insert when <tab> is pressed
set smarttab        "shiftwidth when tab on beginning of line
set shiftwidth=2    "size of an indent
set expandtab       "change tab to spaces

set laststatus=2    "always display status bar. 2=always, 1=when > 1 window, 0=never
set showcmd     "display last command
set wildmenu    "visual autocomplete menu
set showmatch   "Highlight matching brackets
set autoread    "automatically reload file when file changes outside
set signcolumn=number "display diag in line number column

set incsearch   "search as characters is typed
set ignorecase  "case insenstive searce
set smartcase   "but case sensitive when search term include caps
if has("nvim")
  set inccommand=nosplit "Live substitution
endif

set list        "Display whitespace characters
"Set whitespace characters display
set listchars=tab:▸>,trail:~,extends:>,precedes:<,nbsp:+,space:·

set clipboard=unnamed   "Enable yank to system clipboard

"Display relative line number to cursor position
"and current line number on the cursor
set relativenumber
set number

set nowrap  "Turn off word wrap
set hidden   "Switch between buffer without saving

set scrolloff=15  "scroll offset

"New split on below and right
set splitbelow
set splitright

"Keep cursor position when moving between buffers
set nostartofline

let mapleader="\<space>"
"Map double semi-colon to escape insert mode
inoremap jj <Esc>

"Map lead-s to save
nnoremap <leader>s :write<cr>
"Clear search highlight on esc
nnoremap <esc> :noh<CR><esc>
"Map lead-c to close buffer
nnoremap <leader>c :bd<cr>
"Map leader-h to move to previous buffer
nnoremap <silent> <leader>h :bprev<CR>
"Map leader-l to move to next buffer
nnoremap <silent> <leader>l :bnext<CR>
"Map leader-C to close other buffers
nnoremap <silent> <leader>C :BufOnly<CR>

"Keep visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Easier window nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"NERDTree configs
let NERDTreeShowLineNumbers=1
"map lead-ne to toggle NERDTree
nmap <leader>n :NERDTreeToggle<cr>

"Custom command to search for string within the project with ripgrep
"-nargs=+ => The command accepts 1 or more arguments
"-complete=file => Command autocompletion. accepts file.
"-bar => The command can be followed by another command
"cwindow -> pipe result to a cwindow
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --color=never\ -F
  command! -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
  "Press \ to search in files
  nnoremap \ :Rg<SPACE>
endif

lua require('go').setup()

lua require('syntax/main')
lua require('lsp/main')
lua require('lsp/completions')
lua require('dap/main')
lua require('fzf/main')
lua require('testing/main')
lua require('statline/lualine')

xmap ga <Plug>(EasyAlign)

if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

let g:terraform_fmt_on_save = 1
let g:terraform_fold_sections = 1



imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
