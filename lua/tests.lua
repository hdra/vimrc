vim.cmd [[
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
]]
