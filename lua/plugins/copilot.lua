return {
    "zbirenbaum/copilot.lua",
    lazy = true,
    dependencies = {
         'AndreM222/copilot-lualine'
    },
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          python = true,
          help = true,
          ['*'] = false,
        },
    },
}
