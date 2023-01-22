local dap = require('dap')
local dapui = require('dapui')
local dapgo = require('dap-go')
local dapvt = require('nvim-dap-virtual-text')

dapvt.setup()
dapui.setup({})

-- nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
-- nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
-- nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
vim.api.nvim_set_keymap("n", "<leader>db", "", {
    noremap = true,
    callback = dap.toggle_breakpoint
})
vim.api.nvim_set_keymap("n", "<leader>da", "", {
    noremap = true,
    callback = dap.clear_breakpoints
})
vim.api.nvim_set_keymap("n", "<leader>do", "", {
    noremap = true,
    callback = dapui.toggle
})
vim.api.nvim_set_keymap("n", "<leader>dc", "", {
    noremap = true,
    callback = dap.continue
})


-- Setup auto-open dap-ui on debug. initalized, terminated, exited are the evenet names
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
  dap.repl.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
  dap.repl.close()
end


dapgo.setup()
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go" },
  callback = function() 
    vim.api.nvim_set_keymap('n', '<leader>dt', '', {
      noremap = true,
      callback = dapgo.debug_test
    })
  end,
})

