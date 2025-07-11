return {
  "L3MON4D3/LuaSnip",
  build = "make install_jsregexp", -- если ты используешь регулярки
  dependencies = {
      "rafamadriz/friendly-snippets"
  },
  keys = {
    { "<C-K>", function() require("luasnip").expand() end, mode = { "i" }, desc = "LuaSnip Expand" },
    { "<C-L>", function() require("luasnip").jump(1) end, mode = { "i", "s" }, desc = "LuaSnip Jump Forward" },
    { "<C-J>", function() require("luasnip").jump(-1) end, mode = { "i", "s" }, desc = "LuaSnip Jump Backward" },
    {
      "<C-E>",
      function()
        local ls = require("luasnip")
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end,
      mode = { "i", "s" },
      desc = "LuaSnip Change Choice"
    },
  },
  config = function()
    require("luasnip").config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
    })
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}

