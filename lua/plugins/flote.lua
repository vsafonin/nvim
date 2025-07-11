-- заметки разделенные по корню
return {
    'JellyApple102/flote.nvim',
    lazy = true,
    keys = {
        { "<leader>fl", "<cmd>Flote<cr>", desc = "Open Flote note manager"},
    },
    config = function()
        require('flote').setup()
    end,
}
