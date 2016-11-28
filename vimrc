"############
"Plugin Management

call plug#begin('~/.vim/bundle')
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'fatih/vim-go'
Plug 'Valloric/YouCompleteMe'
Plug 'justinmk/vim-sneak'
Plug 'vim-scripts/BufOnly.vim'
Plug 'tpope/vim-surround'
Plug 'benekastah/neomake'
Plug 'junegunn/vim-easy-align'
"Syntax files
Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mitsuhiko/vim-jinja'
Plug 'jwalton512/vim-blade'
Plug 'elixir-lang/vim-elixir'

"Airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'swekaj/php-foldexpr.vim'

Plug 'plasticboy/vim-markdown'
"Plug 'nvie/vim-flake8'
"Cosmetics stuffs
Plug 'hdra/vim-hybrid'
Plug 'chriskempson/base16-vim'
Plug 'jacoborus/tender'
Plug 'joshdick/onedark.vim'

call plug#end()
"###########

"Neovim Configs
if has("nvim")
    "Python path setup
    let g:python_host_prog = '/usr/local/bin/python'
    let g:python3_host_prog = '/usr/local/bin/python3'
endif


"Sane default
syntax enable       "enable syntax
filetype plugin on  "load filetype-specific plugins
filetype indent on  "load filetype-specific indent

"Color Scheme
set t_Co=256
set t_ut=
set background=dark
set termguicolors
colorscheme onedark

set visualbell     "Use visualbell instead of audible one
set t_vb=          "Set visual bell to nothing

set complete-=i     "ignore included file on autocomplete
set backspace=indent,eol,start     "backspace delete these
set autoindent
set tabstop=4       "number of visual space per-tab
set softtabstop=4   "number of spaces to insert when <tab> is pressed
set smarttab        "shiftwidth when tab on beginning of line
set shiftwidth=4    "size of an indent
set expandtab       "change tab to spaces

set laststatus=2    "always display status bar. 2=always, 1=when > 1 window, 0=never
set showcmd     "display last command
set wildmenu    "visual autocomplete menu
set showmatch   "Highlight matching brackets
set autoread    "automatically reload file when file changes outside

set incsearch   "search as characters is typed
set ignorecase  "case insenstive searce
set smartcase   "but case sensitive when search term include caps

set lazyredraw
set cursorline  "highlight current line

set list        "Display whitespace characters
"Set whitespace characters display
set listchars=tab:▸>,trail:~,extends:>,precedes:<,nbsp:+,space:▪

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

"Keep cursor position when moving between buffers
set nostartofline

"Ctags tag file path. Current directory, look for `tags` file, if not found, look
"at parent, and the the grandparent, etc.
set tags=tags;

"Set leader key
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

"map lead-b to toggle tagbar
nmap <leader>b :TagbarToggle<cr>

"NERDTree configs
let NERDTreeShowLineNumbers=1
"map lead-ne to toggle NERDTree
nmap <leader>n :NERDTreeToggle<cr>
"Relative line number on NERDTree
autocmd FileType nerdtree setlocal relativenumber

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

" Easier window nav
nnoremap <C-h> <C-w>h
" Bug workaround. https://github.com/neovim/neovim/issues/2048
if has('nvim')
    nnoremap <BS> <C-w>h
endif
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Disable markdown conceal
let g:vim_markdown_conceal = 0

"Replace gofmt with goimports, automatically called on save by vim-gp
let g:go_fmt_command = "goimports"

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ }

"If Ag is installed
if executable('ag')

    "Grep using silversearcher
    set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep\ --silent

    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

    "Press \ to search in files
    nnoremap \ :Ag<SPACE>

    "Search via silversearcher
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --ignore-case -g ""'

    "Disable caching, since silversearcher is fast enough
    let g:ctrlp_use_caching = 0

endif

"Map K to search word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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
fun! RunNeoMake()
    " Don't run neomake on these
    if &ft =~ 'go\|javascript'
        return
    endif
    :Neomake
endfun
autocmd BufWritePost * call RunNeoMake()

let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_python_flk8_maker = {
    \ 'exe' : '/Users/hndr/.virtualenvs/flake8/bin/flake8',
    \ 'args': ['--verbose'],
    \ 'errorformat':
        \ '%E%f:%l: could not compile,%-Z%p^,' .
        \ '%A%f:%l:%c: %t%n %m,' .
        \ '%A%f:%l: %t%n %m,' .
        \ '%-G%.%#',
    \ 'postprocess': function('neomake#makers#ft#python#Flake8EntryProcess')
\ }

let g:neomake_python_enabled_makers = ['flk8']

"vim-jsx configs
"Enable jsx syntax highlight for .js files
let g:jsx_ext_required = 0

"Whitespace clean up
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"YCM configs
"let g:ycm_python_binary_path = '/usr/local/bin/python3'
if !empty($VIRTUAL_ENV)
    "Use auto completion for the active venv python version
    let g:ycm_python_binary_path = $VIRTUAL_ENV.'/bin/python'
endif

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_min_num_of_chars_for_completion = 7

"Map leader gd to
map <leader>gD :YcmCompleter GoToDefinition<cr>
map <leader>gd :YcmCompleter GoToDeclaration<cr>
map <leader>gr :YcmCompleter GoToReferences<cr>

"Disable TYCM for these:
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \ 'php' : 1
      \}

"Vim-sneak
let g:sneak#streak = 0

"Vim-Json
let g:vim_json_syntax_conceal = 0

"Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"Commented because proxied to neomake
"PyFlakes config
"let g:flake8_cmd="/Users/hndr/.virtualenvs/flake8/bin/flake8"
"autocmd BufWritePost *.py call Flake8()
