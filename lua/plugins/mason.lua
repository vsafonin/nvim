local ensureinstalled = {'bash-language-server','lua-language-server', 'ruff', 'autopep8', 'isort', 'black', 'debugpy', 'basedpyright', 'ansible-lint', 'ansible-language-server', 'ruff-lsp'}
require("mason").setup()

-- require("mason-lspconfig").setup {
--     ensure_installed = { "pyright", "lua_ls", 'ruff_lsp' },
-- }
--
local registry = require "mason-registry"

for _,v in pairs(ensureinstalled) do
    if not registry.is_installed(v) then
        print('Installing ' .. v)
        vim.cmd(':MasonInstall ' .. v)
    end
end
