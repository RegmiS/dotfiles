return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				-- remove this entirely if you want to manually install LSPs via :Mason
				ensure_installed = { "lua_ls", "pyright" }, -- safe servers
				automatic_installation = false,
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			-- manually setup each server you care about
			local lspconfig = require("lspconfig")

			-- Lua
			lspconfig.lua_ls.setup({})

			-- Python
			lspconfig.pyright.setup({})
		end,
	},
}
