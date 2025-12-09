-- навигация по коду
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  keys = {
    -- Стандартные привязки
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },

    -- Новые привязки для работы с диагностиками
    {
      "<leader>fd",
      mode = { "n" },
      function()
        require("flash").jump({
          matcher = function(win)
            local diagnostics = vim.diagnostic.get(vim.api.nvim_win_get_buf(win))
            return vim.tbl_map(function(diag)
              return {
                pos = { diag.lnum + 1, diag.col },
                end_pos = { diag.end_lnum + 1, diag.end_col - 1 },
              }
            end, diagnostics)
          end,
          action = function(match, state)
            vim.api.nvim_win_call(match.win, function()
              vim.api.nvim_win_set_cursor(match.win, match.pos)
              vim.diagnostic.open_float()
            end)
            state:restore()
          end,
        })
      end,
      desc = "Flash: Show diagnostics (with highlight)",
    },
    {
      "<leader>fD",
      mode = { "n" },
      function()
        require("flash").jump({
          action = function(match, state)
            vim.api.nvim_win_call(match.win, function()
              vim.api.nvim_win_set_cursor(match.win, match.pos)
              vim.diagnostic.open_float()
            end)
            state:restore()
          end,
        })
      end,
      desc = "Flash: Show diagnostics (simple)",
    },
  },
}

