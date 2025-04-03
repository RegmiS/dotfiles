return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "rust_analyzer", "ts_ls", "pyright", "lua_ls" },
				automatic_installation = true,
			})
			local lspconfig = require("lspconfig")
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({})
				end,
			})
		end,
	},
	-- handles not just lsp's but also tools like formatters and linters and lsps
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"eslint_d",
					"clangd",
				},
				auto_update = true, -- Automatically update tools
				run_on_start = true, -- Install missing tools when Neovim starts
			})
		end,
	},

	-- Install nvim-lspconfig (LSP client for Neovim)
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Additional LSP configurations if needed
    end,
  },
}
