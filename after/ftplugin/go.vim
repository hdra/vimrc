" map <leader>gd :GoDef<cr>
" map <leader>gD :GoDef<cr>
" map <leader>gr :GoReferrers<cr>
"

function! FixAndFormat()
  YcmCompleter FixIt
  YcmCompleter Format
endfunction


autocmd BufWritePre <buffer> call FixAndFormat()

set noexpandtab
