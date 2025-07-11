return {
    "akinsho/toggleterm.nvim",
    keys = {
    -- Выйти из терминального режима
    { "<Esc>", [[<C-\><C-n>]], mode = "t", desc = "Exit terminal mode" },
    {"<F7>", "<cmd>ToggleTerm<cr>", desc = "Run Toggle Term"},

    -- Переключение терминалов по номерам
    { [[1\t]], ":ToggleTerm 1<CR>", mode = "t", desc = "Toggle terminal 1", silent = true },
    { [[2\t]], ":ToggleTerm 2<CR>", mode = "t", desc = "Toggle terminal 2", silent = true },
    { [[3\t]], ":ToggleTerm 3<CR>", mode = "t", desc = "Toggle terminal 3", silent = true },
    { [[4\t]], ":ToggleTerm 4<CR>", mode = "t", desc = "Toggle terminal 4", silent = true },
  },
  config = function()
    require("toggleterm").setup({
      -- можешь добавить свои настройки
      open_mapping = [[<c-\>]],
      direction = "float", -- или "horizontal", "vertical", "tab"
      shade_terminals = true,
      start_in_insert = true,
    })
  end,

}
