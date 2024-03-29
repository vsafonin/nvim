require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
  ...
})
require("dapui").setup()
