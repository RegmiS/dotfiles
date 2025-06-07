vim.opt.number = true
vim.g.have_nerd_font = true
vim.opt.showmode = false
vim.opt.inccommand = "split"

vim.opt.autoindent = true
vim.opt.cursorline = true
vim.opt.expandtab = true -- use spaces instead of tab

vim.opt.scrolloff = 10
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 99
vim.opt.foldenable = true

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })

vim.keymap.set("n", "<leader>fd", vim.diagnostic.open_float, { desc = "Show diagnostic popup" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

require("config.lazy")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
