local function main_config()
    vim.lsp.enable('ts_ls')
    vim.lsp.enable('ansiblels')
    vim.lsp.enable('bashls')
    vim.lsp.enable('dockerls')
    vim.lsp.enable('lua-language-server')
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
            analysis = {
                diagnosticMode = "workspace",
            },
        },
    },
    }
    )
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
end


local function mappings_config()
    -- LSP
    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc = 'diagnostic go to prev'})
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {desc = 'diagnostic go to next'})
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, {desc = 'diagnostic set local list'})
    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local buffer = ev.buf 
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {buffer = ev.buf, desc = 'go to declaration'})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = ev.buf, desc = 'go to definition'})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = ev.buf, desc = 'show method doc'})
            vim.keymap.set('n', 'gi', vim.lsp.buf.references, {buffer = ev.buf, desc = 'show method references'})
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {buffer = ev.buf, desc = 'show signature help'})
            vim.keymap.set('n', '<leader>cwa', vim.lsp.buf.add_workspace_folder, {buffer = ev.buf, desc = 'add workspace folder'})
            vim.keymap.set('n', '<leader>cwr', vim.lsp.buf.remove_workspace_folder, {buffer = ev.buf, desc = 'remove workspace folder'})
            vim.keymap.set('n', '<leader>cwl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, {buffer = ev.buf, desc = 'list workspace folders'})
            vim.keymap.set('n', '<leader>cd', vim.lsp.buf.type_definition, {buffer = ev.buf, desc = 'show type definition'})
            vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, {buffer = ev.buf, desc = 'rename'})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {buffer = ev.buf, desc = 'code actions'})
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer = ev.buf, desc = 'go to references'})
            vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
                vim.lsp.buf.format { async = true }
            end, {buffer = ev.buf, desc = 'format buffer'})
            vim.keymap.set('n', '<space>cl', function()
                vim.diagnostic.open_float()
            end, {buffer = ev.buf, desc = 'open diagnostic'})
        end,
    })
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {"ray-x/lsp_signature.nvim",
          config = function()
            require "lsp_signature".setup({})
          end,
        },
    },
    config = function()
        main_config()
        mappings_config()
    end,
}
