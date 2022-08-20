
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
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
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
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', '<space>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<space>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<space>gI', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<space>gc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
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

