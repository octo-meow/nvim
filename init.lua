vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.number = true
vim.o.mouse = "a"
vim.o.smartcase = true
vim.o.clipboard = "unnamedplus"
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.confirm = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.keymap.set("n", "<leader>e", ":Explore<CR>")
vim.keymap.set("v", "<leader>c", '"+y')
vim.keymap.set({ "n", "v" }, "d", '"_d')

require("config.lazy")
require("lsp")
