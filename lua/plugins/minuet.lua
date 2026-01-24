local status, secrets = pcall(require, "secrets")
if not status then
    -- Если файла нет, создаем пустышку, чтобы не было ошибок
    secrets = { llm_api_endpoint = "", token = "" }
end

return {
    {
        'milanglacier/minuet-ai.nvim',
        config = function()
            require('minuet').setup({
                virtualtext = {
                    auto_trigger_ft = {},
                    auto_trigger_ignore_ft = { "*" },
                    keymap = {
                        -- accept whole completion
                        accept = '<A-A>',
                        -- accept one line
                        accept_line = '<A-a>',
                        -- accept n lines (prompts for number)
                        -- e.g. "A-z 2 CR" will accept 2 lines
                        accept_n_lines = '<A-z>',
                        -- Cycle to prev completion item, or manually invoke completion
                        prev = '<A-[>',
                        -- Cycle to next completion item, or manually invoke completion
                        next = '<A-]>',
                        dismiss = '<A-e>',
                    },
                },
                provider = 'openai_fim_compatible', -- используем совместимый провайдер
                provider_options = {
                    openai_fim_compatible = {
                        model = 'MagnitCopilotAutoComplete',
                        end_point = secrets.llm_api_endpoint ..'/v1/completions',
                        api_key = function() return secrets.token end,
                        name = 'MagnitCopilot',
                        -- stream = true,
                        template = {
                            -- Формируем строку: <|fim_prefix|>ПРИФИКС<|fim_suffix|>СУФФИКС<|fim_middle|>
                            prompt = function(prefix, suffix)
                                return '<|fim_prefix|>' .. prefix .. '<|fim_suffix|>' .. suffix .. '<|fim_middle|>'
                            end,
                            -- В данном случае suffix в шаблоне провайдера оставляем пустым, 
                            -- так как мы уже включили его в основной prompt выше
                            suffix = function(_, _)
                                return nil
                            end,
                        },
                        -- Соответствие вашим настройкам VSCode
                        optional = {
                            max_tokens = 256,
                            stop = { '<|file_separator|>', '<|fim_prefix|>', '<|fim_suffix|>', '<|fim_middle|>' },
                        },
                        transform_request = function(body)
                            body.suffix = nil -- Удаляем отдельное поле suffix
                            body.stream = false -- Отключаем стриминг для стабильности
                            return body
                        end,
                        -- template = {
                        --     prefix = '<|fim_prefix|>',
                        --     suffix = '<|fim_suffix|>',
                        --     middle = '<|fim_middle|>'
                        -- },
                        -- transform = {},
                        -- Custom function to extract LLM-generated text from JSON output
                        -- get_text_fn = {}
                    }
                },

                throttle = 10000
        })
        end,
        keys = {
        {
            "<A-y>",
            function()
                require("minuet.virtualtext").action.next()
            end,
            mode = "i",
            desc = "Minuet One-shot Completion",
        },
        },
    },
    { 'nvim-lua/plenary.nvim' },
}
