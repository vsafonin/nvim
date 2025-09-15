 return {
        'milanglacier/minuet-ai.nvim',
        keys ={
            {
                "<leader>mi", "<cmd>Minuet virtualtext toggle<cr>",
                desc = "Enable AI complete"
            }
        },
        config = function()
            require('minuet').setup {
                -- Your configuration options here
                virtualtext = {
                    auto_trigger_ft = {},
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
                provider = 'openai_fim_compatible',
                n_completions = 1, -- recommend for local model for resource saving
                -- I recommend beginning with a small context window size and incrementally
                -- expanding it, depending on your local computing power. A context window
                -- of 512, serves as an good starting point to estimate your computing
                -- power. Once you have a reliable estimate of your local computing power,
                -- you should adjust the context window to a larger value.
                context_window = 512,
                request_timeout = 15,
                provider_options = {
                    openai_fim_compatible = {
                    -- For Windows users, TERM may not be present in environment variables.
                    -- Consider using APPDATA instead.
                    api_key = 'TERM',
                    name = 'Ollama',
                    end_point = 'http://192.168.19.216:11434/v1/completions',
                    -- end_point = 'http://192.168:11434/v1/completions',
                    -- model = 'qwen2.5-coder:7b',
                    model = 'qwen2.5-coder:7b',
                    optional = {
                        max_tokens = 98,
                        top_p = 0.9,
                    },
                    },
                }
            }
        end,
}
