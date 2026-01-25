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
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = false
vim.o.autoindent = true
vim.o.colorcolumn = "100"
vim.o.relativenumber = true

vim.o.autoread = true

require "configs.lazy"
require "autocmd"
require "keymap"
require "lsp"

-- vim.cmd [[colorscheme catppuccin]]
-- vim.cmd [[colorscheme tokyonight-day]]
vim.cmd [[colorscheme habamax]]

vim.cmd([[
	highlight Visual guifg=NONE guibg=#303030 guisp=NONE gui=NONE ctermfg=234 ctermbg=66 cterm=NONE term=NONE
]])
