--
-- test --
vim.keymap.set('n', '<leader>dtm', function() require("neotest").run.run() end)
vim.keymap.set('n', '<leader>dtt', function() require("neotest").run.stop() end)
vim.keymap.set('n', '<leader>dtc', function() require("neotest").run.run(vim.fn.expand("%")) end)
vim.keymap.set('n', '<leader>dtc', function() require("neotest").run.run(vim.fn.expand("%")) end)
vim.keymap.set('n', '<leader>dtd', function() require("neotest").run.run({ strategy = "dap" }) end)
vim.keymap.set('n', '<leader>dto', function() require("neotest").output.open({enter = true}) end)
