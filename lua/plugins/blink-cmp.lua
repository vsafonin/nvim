return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
      'rafamadriz/friendly-snippets' ,
      "milanglacier/minuet-ai.nvim",
      {"fang2hou/blink-copilot",
        config = true
      }
  },

  version = '1.*',
  -- use a release tag to download pre-built binaries
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  config = function()
    local minuet = require('minuet')  -- теперь точно будет найден
    require('blink-cmp').setup {
      keymap = {
        ['<A-y>'] = minuet.make_blink_map(),
      },
    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
        documentation = { auto_show = true },
        ghost_text = { enabled = true },
        menu = {
		    draw = {
			    columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
				components = {
				source_name = {
					width = { max = 30 },
					text = function(ctx)
                                return "[" .. ctx.source_name .. "]"
					        end,
					highlight = "BlinkCmpSource",
					},
				},
			},
		},

    },


    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      -- default = { 'lsp', 'copilot', 'path', 'snippets', 'buffer' },
      default = { 'lsp', 'path', 'snippets', 'buffer'},
      providers = {
           minuet = {
                name = 'minuet',
                module = 'minuet.blink',
                async = true,
                -- Should match minuet.config.request_timeout * 1000,
                -- since minuet.config.request_timeout is in seconds
                timeout_ms = 5000,
                score_offset = 50, -- Gives minuet higher priority among suggestions

            },
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
    },

    },
     -- Recommended to avoid unnecessary request
    completion = { trigger = { prefetch_on_insert = false } },
    snippets = { preset = "luasnip" },
    
    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "lua" }

    }
    end,
  -- opts_extend = { "sources.default" }
}
