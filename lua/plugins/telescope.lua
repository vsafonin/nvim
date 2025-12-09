return {
     'nvim-telescope/telescope.nvim',
     dependencies = { 'nvim-lua/plenary.nvim',
                      'nvim-telescope/telescope-frecency.nvim'
                  },
     config = function()
        require('telescope').setup()
        require('telescope').load_extension('frecency')
     end,
       keys = {
        -- { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
        { "<leader>ff", function() require("telescope.").extensions.frecency.frecency({workspace=CWD}) end, desc = "Find Files" },
        { "<leader>fw", function() require("telescope.builtin").live_grep() end, desc = "Live Grep" },
        { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find Buffers" },
        { "<leader>fg", function() require("telescope.builtin").grep_string() end, desc = "Grep String Under Cursor" },
        -- { "<Tab>", function() require("telescope.builtin").buffers() end, desc = "Find Buffers" },
        { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help Tags" },
        { "<leader>fgb", function() require("telescope.builtin").git_branches() end, desc = "Git Branches" },
        { "<leader>fgc", function() require("telescope.builtin").git_commits() end, desc = "Git Commits" },
        { "<leader>fgs", function() require("telescope.builtin").git_status() end, desc = "Git Status" },
        { "<leader>fls", function() require("telescope.builtin").lsp_document_symbols() end, desc = "LSP Document Symbols" },
        { "<leader>fld", function() require("telescope.builtin").diagnostics({bufnr=0}) end, desc = "LSP Lists Diagnostics" },
        { "<leader>flm", function() require("telescope.builtin").lsp_document_symbols({ symbols = {"Method", "Function"}}) end, desc = "LSP Methods"}
    -- { "gr", function() require("telescope.builtin").lsp_references() end, desc = "LSP References" },
    -- { "gd", function() require("telescope.builtin").lsp_definitions() end, desc = "LSP Definitions" },
  },


}
