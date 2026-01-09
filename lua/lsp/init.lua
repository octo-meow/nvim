local function on_attach(_, bufnr)
	local map = vim.keymap.set

	local function map_opts(desc)
		return { buffer = bufnr, desc = "LSP: " .. desc }
	end

	local floating_windown_opts = {
		border = "single",
		max_width = 80,
	}

	map("n", "<leader>r", vim.lsp.buf.rename, map_opts("rename"))
	map("n", "K", function() return vim.lsp.buf.hover(floating_windown_opts) end, map_opts("hover"))

	local builtin = require "telescope.builtin"

	map('n', '<leader>ff', builtin.find_files, {})
	map('n', '<leader>f', builtin.current_buffer_fuzzy_find, {})
	map('n', '<leader>fz', builtin.live_grep, {})
	map('n', 'gr', builtin.lsp_references, {})
	map('n', 'gt', builtin.lsp_type_definitions, {})
	map('n', 'gi', builtin.lsp_implementations, {})
	map('n', 'gd', builtin.lsp_definitions, {})
end

vim.lsp.config('lua_ls', {
	on_attach = on_attach,
})

vim.lsp.config('gopls', {
	on_attach = on_attach,
	settings = {
		gopls = {
			codelenses = {
				test = true,
				generate = true,
				tidy = true,
				upgrade_dependency = true,
			},
			gofumpt = true,
			completeUnimported = true,
			staticcheck = true,
			analyses = {
				nilness = true,
				gofix = true,
				shadow = true,
				unreachable = true,
				unusedvariable = true,
			},
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params(0, "utf-8")
		params.context = { only = { "source.organizeImports" } }
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
		for _, res in pairs(result or {}) do
			for _, action in pairs(res.result or {}) do
				if action.edit then
					vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
				end
			end
		end
	end,
})

vim.diagnostic.config({
	severity_sort = true,
	float = { border = 'rounded', source = 'if_many' },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = '󰅚 ',
			[vim.diagnostic.severity.WARN] = '󰀪 ',
			[vim.diagnostic.severity.INFO] = '󰋽 ',
			[vim.diagnostic.severity.HINT] = '󰌶 ',
		},
	} or {},
	virtual_text = {
		source = 'if_many',
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
})

vim.lsp.enable({ 'lua_ls', 'gopls' })
