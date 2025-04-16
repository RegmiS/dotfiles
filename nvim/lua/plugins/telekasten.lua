return {
	"renerocksai/telekasten.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		local home = vim.fn.expand("~/Nextcloud/Documents/Obsidian/KnowledgeVault")

		local telekasten = require("telekasten")

		telekasten.setup({
			home = home,
			extension = ".md",
			template_new_note = home .. "/Templates/minimum-temp.md", -- Optional
			template_new_daily = home .. "/Templates/daily note template.md", -- Optional
			-- template_new_weekly = home .. "",   -- Optional
			dailies = home .. "/Daily Notes",
			-- weeklies = home .. "/Weekly",
			image_subdir = "media",
			new_note_filename = function()
				local title = vim.fn.input("Enter note title: ")
				if title == "" then
					print("Note name cannot be empty!")
					return
				end
				return title:gsub("%s+", "_"):lower() .. ".md"
			end,
			fuzzy_finder = "telescope",
			show_tags_theme = "dropdown",
			follow_creates_nonexisting = true,
		})

		-- Keybindings
		vim.keymap.set("n", "<leader>zn", require("telekasten").new_note, { desc = "New note" })
		vim.keymap.set("n", "<leader>zf", require("telekasten").find_notes, { desc = "Find notes" })
		-- vim.keymap.set("n", "<leader>zg", require("telekasten").search_notes, { desc = "Grep notes" })
		-- vim.keymap.set("n", "<leader>zd", require("telekasten").goto_today, { desc = "Today’s daily note" })
		-- -- vim.keymap.set("n", "<leader>zw", require("telekasten").goto_thisweek, { desc = "This week's note" })
		-- vim.keymap.set("n", "<leader>zD", require("telekasten").delete_note, { desc = "Delete note" })
		-- vim.keymap.set("n", "<leader>zz", require("telekasten").follow_link, { desc = "Follow [[link]]" })
	end,
}
