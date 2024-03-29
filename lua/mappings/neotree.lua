vim.g.mapleader = " "

-- NeoTree
vim.keymap.set('n', '<leader>e', ':Neotree float focus toggle<CR>')

-- реализация копирования в буфер имени файла или пути к нему 
local copy_path = function(part)
    return function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        local value = vim.fn.fnamemodify(path, part)
        vim.fn.setreg("", value)
        -- vim.fn.setreg("+", value)
        print(value)
    end
end

require("neo-tree").setup({
    commands = {
    yank_relative_path = copy_path(":."),
    yank_absolute_path = copy_path(":p"),
    yank_filename = copy_path(":t"),
    yank_folder = copy_path(":p:h"),
},
window ={
    mappings = {
        ["<leader>cf"] = "yank_relative_path",
        ["<leader>cF"] = "yank_absolute_path",
        ["<leader>ct"] = "yank_filename",
        ["<leader>cT"] = "yank_folder",
    }
}
})
