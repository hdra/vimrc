
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

vim.cmd [[
  set foldlevelstart=99
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
]]
