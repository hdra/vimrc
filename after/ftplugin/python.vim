set tabstop=4       "number of VISUAL space per-tab
set softtabstop=4   "number of spaces to INSERT when <TAB> is pressed
set smarttab        "shiftwidth when tab on beginning of line
set shiftwidth=4    "Size of an indent
set expandtab       "Change tab to spaces
set textwidth=81
set nowrap
set colorcolumn=81

if !empty($VIRTUAL_ENV)
    let g:ycm_python_binary_path = $VIRTUAL_ENV.'/bin/python'
endif
