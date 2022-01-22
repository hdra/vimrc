call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ibhagwan/fzf-lua'

Plug 'tpope/vim-fugitive'
Plug 'google/vim-searchindex'
Plug 'vim-scripts/BufOnly.vim'
Plug 'tpope/vim-commentary'
" Plug 'vim-test/vim-test' #till the django test pipenv is merged
Plug 'hdra/vim-test'
Plug 'junegunn/vim-easy-align'

Plug 'joshdick/onedark.vim'
Plug 'ojroques/nvim-hardline'
Plug 'elixir-editors/vim-elixir'

Plug 'nvim-treesitter/nvim-treesitter'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

Plug 'sebdah/vim-delve'
Plug 'hashivim/vim-terraform'


call plug#end()


syntax enable       "enable syntax
filetype plugin on  "load filetype-specific plugins
filetype indent on  "load filetype-specific indent

set t_Co=256
set t_ut=
set background=dark
set termguicolors
colorscheme onedark

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

set incsearch   "search as characters is typed
set ignorecase  "case insenstive searce
set smartcase   "but case sensitive when search term include caps
if has("nvim")
  set inccommand=nosplit "Live substitution
endif

set list        "Display whitespace characters
"Set whitespace characters display
set listchars=tab:▸>,trail:~,extends:>,precedes:<,nbsp:+,space:▪

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


nnoremap <leader>tn :TestNearest<cr>
nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>tl :TestLast<cr>


"NERDTree configs
let NERDTreeShowLineNumbers=1
"map lead-ne to toggle NERDTree
nmap <leader>n :NERDTreeToggle<cr>


if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --color=never\ -F
  "Define custom command.
  "-nargs=+ => The command accepts 1 or more arguments
  "-complete=file => Command autocompletion. accepts file.
  "-bar => The command can be followed by another command
  "cwindow -> pipe result to a cwindow
  command! -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
  "Press \ to search in files
  nnoremap \ :Rg<SPACE>
endif

let $FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(10)
  let width = float2nr(80)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction


lua << EOF

-- Setup treesitter
local tsconfig = require('nvim-treesitter.configs')
tsconfig.setup{
	ensure_installed = { 'javascript', 'typescript', 'python', 'elixir', 'svelte', 'go', 'vue' },
	highlight = {
		enable = true,
		disable = {'elixir'}
	},
}
vim.api.nvim_set_option('foldenable', false)
vim.api.nvim_set_option('foldmethod', 'expr')
vim.api.nvim_set_option('foldexpr', 'nvim_treesitter#foldexpr()')

EOF
set foldlevelstart=99 "Start with all fold open
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
"disable folding by default, so that folds are open when opening files
"but can be enabled back when we do zC


"set completeopt=menuone,noinsert,noselect

" Use <Tab> and <S-Tab> to navigate through popup menuo
" pumsibible -> when popup menu is open

"let g:completion_confirm_key = ""

lua << EOF
-- require('feline').setup()
require('hardline').setup {
  bufferline = true
}
EOF

"Completion
set completeopt=menuone,noselect
lua << EOF
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-Enter>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end
  }
})

-- setup LSP
local lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', '<space>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<space>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<space>gc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<space>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<space>]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false
    }
  )
end
-- nvim-cmp supports additional completion capabilities
local cmp_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp.pyright.setup{
	on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off"
      }
    }
  }
}
lsp.tsserver.setup{
	on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'javascript', 'typescript', 'typescriptreact',  }
}

lsp.elixirls.setup{
	on_attach = on_attach,
  capabilities = capabilities,
	filetypes = { 'elixir' },
  cmd = { "/Users/hndr/.vim/elixir-ls/release/language_server.sh" }
}

lsp.svelte.setup{
	on_attach = on_attach,
  capabilities = capabilities,
	filetypes = { 'svelte' }
}

lsp.gopls.setup{
	on_attach = on_attach,
  capabilities = capabilities,
	filetypes = { 'go' }
}

lsp.vuels.setup{
	on_attach = on_attach,
  capabilities = capabilities,
	filetypes = { 'vue' }
}


local fzf = require('fzf-lua')
fzf.setup {
  winopts = {
    preview = {
      layout = 'vertical',
      vertical = 'up:40%'
    }
  }
}
EOF
nnoremap <leader>rs :lua require('fzf-lua').lsp_document_symbols({ fzf_cli_args = '--with-nth 2..' })<cr>
nnoremap <leader>p :FzfLua buffers<cr>
nnoremap <leader>/ :FzfLua blines<cr>
nnoremap <C-p> :FzfLua files<cr>
nnoremap <leader>if :FzfLua lsp_document_diagnostics<cr>
nnoremap <leader>ip :FzfLua lsp_workspace_diagnostics<cr>

nnoremap <leader>tn :TestNearest<cr>
nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>tl :TestLast<cr>
let test#python#djangotest#options = '--keepdb'

let test#go#gotest#options = '-v'
function! DebugNearest()
  let g:test#go#runner = 'delve'
  TestNearest
  unlet g:test#go#runner
endfunction
nnoremap <leader>tb :call DebugNearest()<CR>
nnoremap <leader>db :DlvToggleBreakpoint<cr>
nnoremap <leader>dc :DlvClearAll<cr>


"Whitespace clean up
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


xmap ga <Plug>(EasyAlign)

autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)

if has('nvim')
  tmap <C-o> <C-\><C-n>
endif
