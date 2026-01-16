local map = vim.keymap.set

--< misc
map("n", "<leader>e", ":NvimTreeToggle<CR>")

map("v", "<leader>c", '"+y')

map({ "n", "v" }, "d", '"_d')
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
