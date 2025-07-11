return {
     'nvim-telescope/telescope.nvim',
     dependencies = { 'nvim-lua/plenary.nvim' },
     config = function()
        require('telescope').setup()
     end,
       keys = {
        { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
        { "<leader>fw", function() require("telescope.builtin").live_grep() end, desc = "Live Grep" },
        { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find Buffers" },
        { "<leader>fg", function() require("telescope.builtin").grep_string() end, desc = "Grep String Under Cursor" },
        -- { "<Tab>", function() require("telescope.builtin").buffers() end, desc = "Find Buffers" },
        { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help Tags" },
        { "<leader>gb", function() require("telescope.builtin").git_branches() end, desc = "Git Branches" },
        { "<leader>gc", function() require("telescope.builtin").git_commits() end, desc = "Git Commits" },
        { "<leader>gs", function() require("telescope.builtin").git_status() end, desc = "Git Status" },
        { "<leader>ls", function() require("telescope.builtin").lsp_document_symbols() end, desc = "LSP Document Symbols" },
    -- { "gr", function() require("telescope.builtin").lsp_references() end, desc = "LSP References" },
    -- { "gd", function() require("telescope.builtin").lsp_definitions() end, desc = "LSP Definitions" },
  },


}
