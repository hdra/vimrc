 vim.cmd [[
 nnoremap <leader>tn :TestNearest<cr>
 nnoremap <leader>tf :TestFile<cr>
 nnoremap <leader>tl :TestLast<cr>

 let test#python#djangotest#options = '--keepdb'
 let test#go#gotest#options = '-v'
 ]]
