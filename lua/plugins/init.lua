return {
	{
		'mfussenegger/nvim-dap',
		-- NOTE: And you can specify dependencies as well
		dependencies = {
			-- Creates a beautiful debugger UI
			'rcarriga/nvim-dap-ui',

			-- Required dependency for nvim-dap-ui
			'nvim-neotest/nvim-nio',

			-- Installs the debug adapters for you
			'mason-org/mason.nvim',
			'jay-babu/mason-nvim-dap.nvim',

			-- Add your own debuggers here
			'leoluz/nvim-dap-go',
		},
		config = require("configs.dap")
		-- opts = require("configs.dap"),
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = 'v0.2.1',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
	},
	{
		'stevearc/conform.nvim',
		event = { 'BufWritePre' },
		cmd = { 'ConformInfo' },
		keys = {
			{
				'<leader>f',
				function()
					require('conform').format { async = true, lsp_format = 'fallback' }
				end,
				mode = '',
				desc = '[F]ormat buffer',
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function()
				return {
					timeout_ms = 500,
					lsp_format = 'fallback',
				}
			end,
			formatters_by_ft = {
				lua = { 'stylua' },
				go = { 'gofmt' },
			},
		},
	},
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.config').setup {
				-- install_dir
				ensure_installed = { "lua", "go" },
				auto_install = false,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			}
		end
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			{
				"windwp/nvim-autopairs",
				opts = {},
			},
		},
		version = "1.*",
		lazy = false,
		opts = require "configs.blink",
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {}
		end,
	},
	{
		"folke/snacks.nvim",
		event = { "BufEnter" },
		opts = require "configs.snacks",
	},
	{
		"okuuva/auto-save.nvim",
		version = "^1.0.0",
		event = { "InsertLeave", "TextChanged" },
		opts = {
			trigger_events = {
				immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
				defer_save = {},
			},
			debounce_delay = 2000,
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	{
		"Yu-Leo/gosigns.nvim",
		ft = "go",
		cmd = { "GosignsEnable", "GosignsDisable", "GosignsToggle" },
	},
}
