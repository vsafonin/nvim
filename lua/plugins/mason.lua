return {
    "mason-org/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    opts = {},
    config = function()
        require("mason").setup()
        -- костыль для автоматической установки нужного мне
        local ensureinstalled = {'bash-language-server','lua-language-server', 'ruff', 'black', 'debugpy', 'basedpyright', 'ansible-lint', 'ansible-language-server', 'pylint', 'yapf'}
        local registry = require "mason-registry"

        for _,v in pairs(ensureinstalled) do
            if not registry.is_installed(v) then
                print('Installing ' .. v)
            vim.cmd(':MasonInstall ' .. v)
            end
        end
    end,
}
