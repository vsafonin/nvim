vim.opt.shell = "/bin/zsh"
vim.g.mapleader = " "
-- 
-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Line Numbers
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.number = true
vim.opt.relativenumber = true
-- 
-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true
-- 
-- Indent Settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
-- spell checker
vim.opt.spelllang = {'en_us', 'ru'}
vim.opt.spell = true
-- redundancy
vim.opt.undofile = true --  keep undo history between sessions
vim.opt.undodir = vim.fn.expand("$HOME/.local/share/nvim/undo/") -- keep undo files out of file dir
vim.opt.directory = vim.fn.expand("$HOME/.local/share/nvim/swp/") -- keep unsaved changes away from file dir
vim.opt.backupdir = vim.fn.expand("$HOME/.local/share/nvim/backup/") -- backups also should not go to git

vim.g.python3_host_prog = vim.fn.expand("$HOME/.local/share/nvim/venv/bin/python3")
vim.opt.colorcolumn = "80"

