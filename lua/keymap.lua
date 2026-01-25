local map = vim.keymap.set

--< misc
map("n", "<leader>e", ":Yazi<CR>")
map("n", "<leader>sf", function()
	require("nvim-tree.api").tree.open { find_file = true, update_root = true }
end)

map("v", "<leader>c", '"+y')

map({ "n", "v" }, "d", '"_d')
map({ "n", "v" }, "c", '"_c')
map({ "n", "v" }, "x", '"_x')

map("n", "<A-j>", ":m .+1<CR>")
map("n", "<A-k>", ":m .-2<CR>")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

map('n', '<leader>r', vim.lsp.buf.rename, {})

map('n', 'K', function()
	return vim.lsp.buf.hover({ border = 'single', max_width = 80 })
end, {})
-->

--> Quickfix list
map("n", "<leader>xd", function()
	local diagnostics = vim.diagnostic.get(0)
	local qflist = {}
	for _, diagnostic in ipairs(diagnostics) do
		table.insert(qflist, {
			bufnr = diagnostic.bufnr,
			lnum = diagnostic.lnum + 1,
			col = diagnostic.col + 1,
			text = diagnostic.message,
			type = diagnostic.severity == vim.diagnostic.severity.ERROR and "E" or "W",
		})
	end
	vim.fn.setqflist(qflist)
end, { desc = "Send Diagnostics To QF List" })
--<

--< Insert Mode Movement
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })
map("i", "<C-l>", "<Right>", { desc = "move left" })
-->

-- --< Bufferline
-- map({ "n", "v" }, "<leader>tn", ":BufferLineMoveNext<CR>")
-- map({ "n", "v" }, "<leader>tN", ":BufferLineMovePrev<CR>")
-- map({ "n", "v" }, "<leader>tw", ":BufferLinePickClose<CR>")
-- map({ "n", "v" }, "<leader>n", ":BufferLineCycleNext<CR>")
-- map({ "n", "v" }, "<leader>N", ":BufferLineCyclePrev<CR>")
-- map({ "n", "v" }, "<leader>tp", ":BufferLineTogglePin<CR>")
-- -->

--< Dap
map("n", "<leader>0", ":DapContinue<CR>")
map("n", "<leader>b", ":DapToggleBreakpoint<CR>")
map("n", "<leader>7", ":DapStepInto<CR>")
map("n", "<leader>8", ":DapStepOver<CR>")
map("n", "<leader>9", ":DapStepOut<CR>")
map("n", "<leader>-", ":DapDisconnect<CR>")
-->

--< Telescope
local builtin = require 'telescope.builtin'

map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>f', builtin.current_buffer_fuzzy_find, {})
map('n', '<leader>fz', builtin.live_grep, {})
map('n', 'gr', builtin.lsp_references, {})
map('n', 'gt', builtin.lsp_type_definitions, {})
map('n', 'gi', builtin.lsp_implementations, {})
map('n', 'gd', builtin.lsp_definitions, {})
-->

--> Golang
map("n", "<leader>gg", ":!go generate %<CR>")
--<
