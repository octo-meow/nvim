local map = vim.keymap.set

--< misc
map("n", "<leader>;", ":Yazi<CR>")
map("n", "<leader>'", ":Yazi cwd<CR>")
map("n", "<leader>L", ":cclose<CR>")

map("v", "y", '"+y')
map({ "n", "v" }, "p", '"+p')

map({ "n", "v" }, "d", '"_d')
map({ "n", "v" }, "c", '"_c')
map({ "n", "v" }, "x", '"_x')

map("n", "<A-j>", ":m .+1<CR>")
map("n", "<A-k>", ":m .-2<CR>")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

map('n', '<leader>r', vim.lsp.buf.rename, {})
map('n', '<leader>gi', vim.lsp.buf.implementation, {})

map('n', 'K', function()
	return vim.lsp.buf.hover({ border = 'single', max_width = 80 })
end, {})

-- add new line in normal mode
map('n', '<leader>o', 'o<ESC>')
map('n', '<leader>O', 'O<ESC>')

-- move cursor over line
map("i", "<C-e>", "<C-o>$")
map("n", "<leader>gg", "0")
map("n", "<leader>G", "g_")

-- search word in the current window
-- map("n", "<leader>f", "<c-*>")

-- close buffer wihtout closing of the window
map("n", "<leader>ww", ":bp<bar>sp<bar>bn<bar>bd<CR>")
map("n", "<leader>h", ":BufferLineCyclePrev<CR>")
map("n", "<leader>j", ":BufferLineMovePrev<CR>")
map("n", "<leader>k", ":BufferLineMoveNext<CR>")
map("n", "<leader>l", ":BufferLineCycleNext<CR>")
-->

--< Insert Mode Movement
map("n", "<leader>w", "<Cmd>wall<CR>", { desc = "Save" })
map("n", "<leader>q", "<cmd>wqall<CR>", { desc = "Window quit" })

map("n", "q:", "", { desc = "Disable commands history" })

map("n", "n", "nzz", { desc = "Go to next search result" })
map("n", "N", "Nzz", { desc = "Go to prev search result" })

map("n", "zo", "za", { desc = "Toggle fold" })

-- Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })
map("i", "<C-l>", "<Right>", { desc = "move left" })

map("i", "<C-p>", "<C-O>p", {})
map("i", "<C-P>", "<C-O>P", {})
-->

--< Dap
map("n", "<leader>0", ":DapContinue<CR>")
map("n", "<leader>b", ":DapToggleBreakpoint<CR>")
map("n", "<leader>7", ":DapStepInto<CR>")
map("n", "<leader>8", ":DapStepOver<CR>")
map("n", "<leader>9", ":DapStepOut<CR>")
map("n", "<leader>-", ":DapDisconnect<CR>")
-->

--< fzf
local fzf = require("fzf-lua")

map('n', '<leader>ff', fzf.files)
map('n', '<leader>fz', fzf.live_grep)
map('n', 'gd', fzf.lsp_definitions)
map('n', 'gi', fzf.lsp_implementations)
map('n', 'gR', fzf.lsp_references, {})
-->

--> Golang
map("n", "<leader>gg", ":!go generate %<CR>")
--<
