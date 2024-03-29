require('multicursors').setup {}

vim.keymap.set('n', "<Leader>m", ":MCstart<CR>")
vim.keymap.set('v', "<Leader>M", ":MCstart<CR>")
vim.keymap.set('n', "<Leader>n", ":MCunderCursor<CR>")
vim.keymap.set('v', "<Leader>n", ":MCunderCursor<CR>")
