local dapConfig = function()
	local dap = require("dap")

	require("dapui").setup({
		layouts = {
			{
				elements = {
					"scopes",
				},
				size = 10,
				position = "bottom",
			},
		},
	})

	dap.adapters.go = {
		type = "server",
		host = "localhost",
		port = "2345",
	}
	dap.configurations.go = {
		{
			type = "go",
			name = "Attach remote111 from dap",
			mode = "remote",
			request = "attach",
		}
	}
end

return dapConfig
-- local dap = require("nvim-dap")
--
-- dap.adapters.go = {
-- 	type = "server",
-- 	host = "localhost",
-- }
