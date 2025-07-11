return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    keys = {
    {
      "<Leader>nf",
      function() require("neogen").generate() end,
      desc = "Generate Doc (neogen)",
      mode = "n",
      noremap = true,
      silent = true,
    },
      },
    config = true

}
