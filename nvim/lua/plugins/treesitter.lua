return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" }, -- Load Treesitter when opening files
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "python", "rust", "javascript", "typescript" }, -- Add languages you need
			sync_install = false, -- Install parsers synchronously (false = async)
			auto_install = true, -- Automatically install missing parsers

			highlight = {
				enable = true, -- Enable Treesitter-based highlighting
				additional_vim_regex_highlighting = false,
			},

			indent = {
				enable = true, -- Enable improved indentation
			},
		})
	end,
}
