local dapConfig = function()
	local dap = require("dap")
	local dapui = require("dapui")

	dapui.setup({
		layouts = {
			{
				elements = {
					"scopes",
					"watches",
				},
				size = 80,
				position = "right",
			},
		},
	})

	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end

	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end

	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end

	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end

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
