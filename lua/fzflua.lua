local fzf = require('fzf-lua')
fzf.setup {
  winopts = {
    preview = {
      border = 'noborder',
      delay = 30,
      layout = 'vertical',
      vertical = 'up:40%'
    }
  },
  previewers = {
    builtin = {
      syntax = false
    }
  }
}

vim.cmd [[
  nnoremap <leader>rs :lua require('fzf-lua').lsp_document_symbols({ fzf_cli_args = '--with-nth 2..' })<cr>
  nnoremap <leader>p :FzfLua buffers<cr>
  nnoremap <leader>/ :FzfLua blines<cr>
  nnoremap <C-p> :FzfLua files<cr>
  nnoremap <leader>if :FzfLua lsp_document_diagnostics<cr>
  nnoremap <leader>ip :FzfLua lsp_workspace_diagnostics<cr>
]]
