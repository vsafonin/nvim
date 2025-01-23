local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.yapf,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.pylint.with({only_local = ".venv/bin",})
    },
})
