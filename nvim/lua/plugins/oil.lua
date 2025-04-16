return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["q"] = "actions.close",
			},
		})

		vim.keymap.set("n", "<leader>-", "<cmd>Oil<CR>", { desc = "Open parent directory in Oil" })
	end,
}
