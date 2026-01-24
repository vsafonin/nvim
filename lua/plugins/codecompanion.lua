local status, secrets = pcall(require, "secrets")
if not status then
    -- Если файла нет, создаем пустышку, чтобы не было ошибок
    secrets = { llm_api_endpoint = "", token = "" }
end


return {
  "olimorris/codecompanion.nvim",
  lazy = false,
  opts = {
    display = {
        inline = {
            enabled = true,
        },
        diff = {
            enabled = false,
        },
        chat = {
            window = {
                layout = "vertical",
                position = "right",
            },
        },
    },
    adapters = {
            http = {
                magnit_copilot = function()
                    return require("codecompanion.adapters").extend("openai_compatible", {
                        name = "magnit_copilot",
                        env = {
                            url = secrets.llm_api_endpoint,
                            api_key = secrets.token,
                            chat_url = "/v1/chat/completions",
                            models_endpoint = "/v1/models"
                        },
                        schema = {
                            model = {
                                default = "MagnitCopilot",
                                coder   = "MagnitCopilotAutoComplete"
                            },
                        },
                    })
                end
                },
    },
    strategies = {
        chat = {adapter="magnit_copilot", model="default"},
        inline = {adapter="magnit_copilot", model="coder"},
        cmd = {adapter="magnit_copilot", model="coder"},
    },
    opts = {
        show_default_prompt_library = true,
        language = "Russian"
    },
    log_level = "TRACE",

  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = true
  }
