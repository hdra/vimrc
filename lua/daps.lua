local dap = require('dap')
local dapui = require('dapui')

dapui.setup({
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        "repl",
      },
      size = 10,
      position = "bottom",
    },
  },
})


-- nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
-- nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
-- nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
-- nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
-- nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
-- nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
-- nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>

vim.api.nvim_set_keymap("n", "<leader>db", "", {
    noremap = true,
    callback = function()
      dap.toggle_breakpoint()
    end,
})


vim.api.nvim_set_keymap("n", "<leader>dr", "", {
    noremap = true,
    callback = function()
      dap.repl.open()
    end,
})
vim.api.nvim_set_keymap("n", "<leader>dc", "", {
    noremap = true,
    callback = function()
      dap.continue()
    end,
})
vim.api.nvim_set_keymap("n", "<leader>dq", "", {
    noremap = true,
    callback = function()
      dapui.close()
    end,
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end
