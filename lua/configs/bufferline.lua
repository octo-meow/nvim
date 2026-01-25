local bufferline = require("bufferline")

bufferline.setup({
	options = {
		diagnostics = "nvim_lsp",
		show_tab_indicators = true,
	},
})
