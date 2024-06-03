return require('packer').startup(function(use)
    -- плагины располагать здесь.
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- file manager
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }
    -- nvim window picker для выбора окна куда открыть файл
    use {
        's1n7ax/nvim-window-picker',
        tag = 'v2.*',
        config = function()
            require 'window-picker'.setup()
        end,
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- lsp
    use {
        "neovim/nvim-lspconfig"
    }

    -- theme
    use {
        "navarasu/onedark.nvim"
    }
    -- cmp
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline' }
    }
    -- mason
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }
    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- comentary
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- formatter and linters
    -- fork of null-ls
    use {
        'nvimtools/none-ls.nvim'
    }
    -- isort
    use {
        'brentyi/isort.vim'
    }
    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    -- git diff
    use { "sindrets/diffview.nvim" }

    -- terminal
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }

    -- neogen - documentation
    use {
        "danymat/neogen",
        config = function()
            require('neogen').setup {}
        end,
        requires = "nvim-treesitter/nvim-treesitter",
        -- Uncomment next line if you want to follow only stable versions
        -- tag = "*"
    }

    -- snippets
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        run = "make install_jsregexp"
    })
    use "rafamadriz/friendly-snippets"

    -- dap
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "rcarriga/cmp-dap", 'nvim-neotest/nvim-nio' } }
    use "folke/neodev.nvim"

    -- osc52  буфер обмена
    use { 'ojroques/nvim-osc52' }

    -- neotest
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        }
    }
    use {
        "nvim-neotest/neotest-python"
    }
    -- suda.vim
    -- Сохранение файла с sudo
    use {
        "lambdalisue/suda.vim"
    }
    -- markdown preview
    -- -- install without yarn or npm
    -- use({
    --     "iamcco/markdown-preview.nvim",
    --     run = function() vim.fn["mkdp#util#install"]() end,
    -- })
    use { "ellisonleao/glow.nvim",
        config = function() require("glow").setup() end }
    -- ansible plugin
    use {
        'pearofducks/ansible-vim'
    }
    -- sneak navigation
    use {
        'ggandor/leap.nvim'
    }
    -- remote ssh
    use {
        'nosduco/remote-sshfs.nvim',
        requires = { { 'nvim-telescope/telescope.nvim' } } -- optional if you declare plugin somewhere else
    }
    -- venv selector
    use {
        'linux-cultist/venv-selector.nvim',
        branch = "regexp",
        requires = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
    }
    -- aerail vim
    use {
        "stevearc/aerial.nvim",
        config = function()
            require("aerial").setup()
        end,
    }
    -- multicursor
    use {
        "smoka7/multicursors.nvim",
        requires = { 'smoka7/hydra.nvim', }
    }
    -- save sessions
    use {
        "tpope/vim-obsession"
    }
    -- commentary
    use {
        "terrortylor/nvim-comment",
        config = function()
            require('nvim_comment').setup()
        end,
    }
    -- rsync
    use { 'kenn7/vim-arsync',
        requires = {
            { 'prabirshrestha/async.vim' }
        }
    }
    -- skel
    use "motosir/skel-nvim"
end)
