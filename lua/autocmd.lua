vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank {
			higroup = "OnYank",
			timeout = 200,
		}
	end,
})

vim.o.autoread = true

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = "*",
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'go' },
	callback = function()
		vim.treesitter.start()
	end,
})
