return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons',
    {
        'linrongbin16/lsp-progress.nvim',
        config = true
     },
    },
    config = function()
        require("lualine").setup({
              sections = { 
                  lualine_c = {
                      function()
                        -- invoke `progress` here.
                        return require('lsp-progress').progress()
                      end,
                },
                lualine_x = { 'copilot' ,'encoding', 'fileformat', 'filetype' },
              },
          })
        -- listen lsp-progress event and refresh lualine
        vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
        vim.api.nvim_create_autocmd("User", {
          group = "lualine_augroup",
          pattern = "LspProgressStatusUpdated",
          callback = require("lualine").refresh,
        })

    end,
}
