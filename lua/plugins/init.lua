return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			'rcarriga/nvim-dap-ui',
			'nvim-neotest/nvim-nio',
			'mason-org/mason.nvim',
			'jay-babu/mason-nvim-dap.nvim',
			'leoluz/nvim-dap-go',
		},
		config = require("configs.dap")
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
		config = function()
			require('telescope').setup({
				pickers = {
					find_files = {
						hidden = true,
						no_ignore = false,
					}
				}
			})
		end
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
				indent = {
					enable = true,
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
			require("nvim-tree").setup {
				filters = {
					dotfiles = false,
				},
				disable_netrw = true,
				hijack_cursor = true,
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				view = {
					width = 30,
					preserve_window_proportions = true,
				},
				git = {
					enable = true,
					ignore = false,
				}, diagnostics = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = true,
				debounce_delay = 100,
				severity = {
					min = vim.diagnostic.severity.ERROR,
					max = vim.diagnostic.severity.ERROR,
				},
			},
			}
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
		"lewis6991/gitsigns.nvim",
		version = "*",
		config = function()
			require("gitsigns").setup({})
		end
	},
	{
		"Yu-Leo/gosigns.nvim",
		ft = "go",
		cmd = { "GosignsEnable", "GosignsDisable", "GosignsToggle" },
	},
	-- {
	-- 	'akinsho/bufferline.nvim',
	-- 	version = "*",
	-- 	dependencies = 'nvim-tree/nvim-web-devicons',
	-- 	config = function()
	-- 		require("configs.bufferline")
	-- 	end,
	-- },
	{
		"rmagatti/auto-session",
		lazy = false,

		---enables autocomplete for opts
		---@module "auto-session"
		---@type AutoSession.Config
		opts = {
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			-- log_level = 'debug',
		},
	},
	{
		'nvim-mini/mini.statusline',
		version = '*',
		config = function()
			require("mini.statusline").setup({})
		end
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
		config = function()
			require("configs.diffview")
		end,
	},
	---@type LazySpec
	{
		"mikavilpas/yazi.nvim",
		version = "*", -- use the latest stable version
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
		},
		keys = {
			-- 👇 in this section, choose your own keymappings!
			{
				"<leader>;",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				-- Open in the current working directory
				"<leader>cw",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
			{
				"<c-up>",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		---@type YaziConfig | {}
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
		},
		-- 👇 if you use `open_for_directories=true`, this is recommended
		init = function()
			-- mark netrw as loaded so it's not loaded at all.
			--
			-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
			vim.g.loaded_netrwPlugin = 1
		end,
	},
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup({})
		end
	}
}
