vim.opt.completeopt={"menu", "menuone", "noselect"}

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'nvim_lua' },
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-y>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
    ['<C-e>'] = cmp.mapping.close(),
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
  -- Mappings.
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, {buffer=0})
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {buffer=0})
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {buffer=0})
  vim.keymap.set('n', '<leader>gc', vim.lsp.buf.code_action, {buffer=0})
  vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, {buffer=0})
  vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {buffer=0})
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {buffer=0})
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {buffer=0})
  vim.keymap.set('n', '<leader>[', vim.lsp.diagnostic.goto_prev, {buffer=0})
  vim.keymap.set('n', '<leader>]', vim.lsp.diagnostic.goto_next, {buffer=0})

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

lsp.vuels.setup{
	on_attach = on_attach,
  capabilities = capabilities,
	filetypes = { 'vue' }
}

