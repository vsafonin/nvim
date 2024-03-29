local dap = require("dap")
local dapui = require("dapui")
vim.keymap.set('n', '<F9>', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<F17>', function() dap.terminate() end) -- shit + f5
vim.keymap.set('n', '<F6>', function() dap.pause() end)      -- shit + f5
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<leader>dE', function() dapui.eval() end)
vim.keymap.set('n', '<leader>du', function() dapui.toggle() end)
vim.keymap.set('n', '<leader>dh', function() dapui.hover() end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<F23>', function() dap.step_out() end)
