-- setup LSP
local lsp = require('lspconfig')

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {noremap=true, silent=true})
vim.keymap.set('n', '<leader>[', vim.diagnostic.goto_prev, {noremap=true, silent=true})
vim.keymap.set('n', '<leader>]', vim.diagnostic.goto_next, {noremap=true, silent=true})

local on_attach = function(client, bufnr)
  -- Mappings.
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, {buffer=0})
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {buffer=0})
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {buffer=0})
  vim.keymap.set('n', '<leader>gc', vim.lsp.buf.code_action, {buffer=0})
  vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, {buffer=0})
  vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {buffer=0})
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {buffer=0})
  vim.keymap.set('n', '<leader>gf', vim.lsp.buf.formatting, {buffer=0})

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
	filetypes = { 'python' },
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
  cmd = { os.getenv("HOME") .. "/.vim/elixir-ls/release/language_server.sh" }
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

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  callback = function() 
    vim.lsp.buf.formatting_sync(nil, 1000)
  end
})


lsp.vuels.setup{
	on_attach = on_attach,
  capabilities = capabilities,
	filetypes = { 'vue' }
}

