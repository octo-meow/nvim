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

require "configs.lazy"
require "keymap"
require "lsp"

vim.cmd [[colorscheme habamax]]
