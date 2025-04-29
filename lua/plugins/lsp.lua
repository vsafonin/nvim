-- local lspconfig = require('lspconfig')
vim.lsp.enable('ts_ls')
vim.lsp.enable('ansiblels')
vim.lsp.enable('bashls')
vim.lsp.enable('dockerls')
-- lspconfig.jedi_language_server.setup{}
vim.lsp.enable('basedpyright')
vim.lsp.config('basedpyright', {
    -- Server-specific settings. See `:help lspconfig-setup`
    capabilities = {
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true,
            },
        },
    },
    settings = {
        basedpyright = {
            typeCheckingMode = "standard",
        },
    },
})
vim.lsp.enable('ruff')
vim.lsp.enable('docker_compose_language_service')
-- file format автоматически
vim.filetype.add({
    pattern = {
        ["compose.*%.ya?ml"] = "yaml.docker-compose",
        ["docker%-compose.*%.ya?ml"] = "yaml.docker-compose",
    },
})
-- 
vim.lsp.config('lspconfig', {
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using
                        -- (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT'
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                            -- "${3rd}/luv/library"
                            -- "${3rd}/busted/library",
                        }
                        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                        -- library = vim.api.nvim_get_runtime_file("", true)
                    }
                }
            })

            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
    end
}
)
