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
vim.o.listchars = "trail:-,nbsp:+,tab:▏ " -- Characters to show for tabs, spaces, and end of line
vim.o.list = true -- Show whitespace characters
vim.o.autoread = true

require "configs.lazy"
require "autocmd"
require "lsp"

vim.schedule(function()
	require "keymap"
end
)

vim.cmd('colorscheme vscode')
vim.cmd('colorscheme tokyonight-night')
vim.cmd [[set ignorecase]]
vim.cmd [[set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',ё\\,яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,Ё/|]]
