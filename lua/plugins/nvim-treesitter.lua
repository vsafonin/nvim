return {
 "nvim-treesitter/nvim-treesitter",
 branch = 'master',
 lazy = false,
 build = ":TSUpdate",
 config = function()
     require'nvim-treesitter.configs'.setup {
	ensure_installed = { "lua", "vim", "vimdoc", "python", "markdown", "markdown_inline", "dockerfile", "yaml" }
	}
 end,
}
