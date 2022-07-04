local go = require 'go'

go.setup({
  dap_debug_gui = false,
  dap_debug_vt = false
})


vim.cmd [[ nnoremap <leader>tn :GoTest -n<cr>]]
vim.cmd [[ nnoremap <leader>tf :GoTest -f<cr>]]
vim.cmd [[ nnoremap <leader>tb :GoDebug -t<cr>]]

