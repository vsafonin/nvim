require("skel-nvim").setup {
    templates_dir = vim.fn.stdpath("config") .. "/skeleton",
    -- file pattern -> template mappings
    mappings = {
        ['main.py'] = "main.py.skel",
        ['README.MD'] = "readme.md.skel",
        ['.vim-arsync'] = 'vim-arsync.skel',
        -- patterns can map to multiple templates
        ['LICENSE'] = { "license.mit.skel", "license.gpl.skel" }
    }
}
