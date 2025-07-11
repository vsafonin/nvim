local py_version = vim.fn.system("python3 -c 'import sys; print(\"{}.{}\".format(sys.version_info.major, sys.version_info.minor))'")
py_version = string.gsub(py_version, "\n", "") -- remove trailing newline

local venv_path = vim.fn.getcwd() .. "/.venv/lib/python" .. py_version .. "/site-packages"

return {
    'nvimtools/none-ls.nvim',
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
        sources = {
            null_ls.builtins.formatting.yapf,
            -- null_ls.builtins.diagnostics.pylint,
            null_ls.builtins.diagnostics.pylint.with({
                 extra_args = {
                    "--init-hook",
                    "import sys; sys.path.insert(0, '" .. venv_path .. "')"
                  }
            })
        },
    })
    end,
}
