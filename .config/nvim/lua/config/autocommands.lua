-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Initialize the autocmds for setting filetypes
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.cshtml",
	command = "set filetype=html.cshtml.razor",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.razor",
	command = "set filetype=html.cshtml.razor",
})
