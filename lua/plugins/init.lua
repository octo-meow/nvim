return {
	{ "catppuccin/nvim",            name = "catppuccin", priority = 1000 },
	{ "sainnhe/sonokai" },
	{ "projekt0n/github-nvim-theme" },
	{ "Mofiqul/vscode.nvim" },
	{ "joshdick/onedark.vim" },
	{ "ellisonleao/gruvbox.nvim",   priority = 1000,     config = true },
	{ 'marko-cerovac/material.nvim' },
	{ 'tomasiser/vim-code-dark' },
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
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require("bufferline").setup({})
		end,
	},
	{
		"folke/snacks.nvim",
		event = { "BufEnter" },
		opts = require "configs.snacks",
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>fl",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
		},
	},
	{
		url = "https://codeberg.org/andyg/leap.nvim",
		config = function()
			local leap = require('leap')
			leap.setup({
				safe_labels = {},
				max_phase_one_targets = 0,
				max_hightlighted_traversal_targets = 10,
				lables = 'jklasdfghqwertyuipzxcvbnm',
				equivalence_classes = { " \t\r\n", "([{", "}])", "'\"`" },
			})
			vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
			vim.keymap.set({ 'n', 'o' }, 'r', function()
				require('leap.remote').action()
			end)
		end
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/neotest-go",
			-- Your other test adapters here
		},
		config = function()
			-- get neotest namespace (api call creates or returns namespace)
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						local message =
								diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)
			require("neotest").setup({
				-- your neotest config here
				adapters = {
					require("neotest-go"),
				},
			})
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		keys = {
			{ "<c-h>",  "<cmd><C-B>TmuxNavigateLeft<cr>" },
			{ "<c-j>",  "<cmd><C-B>TmuxNavigateDown<cr>" },
			{ "<c-k>",  "<cmd><C-B>TmuxNavigateUp<cr>" },
			{ "<c-l>",  "<cmd><C-B>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-B>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },

		config = function()
			-- local fzf = require("fzf-lua")
			-- fzf.setup({})
			require("fzf-lua").setup({})
			-- vim.keymap.set('n', '<leader>ff', fzf.files)
		end,

		-- or if using mini.icons/mini.nvim
		-- dependencies = { "nvim-mini/mini.icons" },
		---@module "fzf-lua"
		---@type fzf-lua.Config|{}
		---@diagnostic disable: missing-fields
		opts = {}
		---@diagnostic enable: missing-fields
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
	{
		"theHamsta/nvim-dap-virtual-text",
		opts = {},
	},
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
		-- status line
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = custom_theme,
					component_separators = "",
					icons_enabled = true,
					globalstatus = true,
					always_show_tabline = true,
					disabled_filetypes = { "Quickfix", "dashboard", "NvimTree", "Outline" },
				},
				sections = {
					lualine_a = {
						{
							"mode",
							fmt = function(str)
								local extra = "       "
								str = str .. extra
								return str:sub(1, 7)
							end,
						},
					},
					lualine_b = {
						{
							"branch",
						},
						{
							"diagnostics",
							sources = { "nvim_workspace_diagnostic" },
						},
					},
					lualine_c = {
						{
							'filename',
							path = 1,
						},
					},
					lualine_y = {
					},
					lualine_z = {},
				},
			})
		end,
	},
	{
		{
			"nvim-neotest/neotest",
			dependencies = {
				"nvim-neotest/nvim-nio",
				"nvim-lua/plenary.nvim",
				"antoinemadec/FixCursorHold.nvim",
				{
					"nvim-treesitter/nvim-treesitter", -- Optional, but recommended
					branch = "main",              -- NOTE; not the master branch!
					build = function()
						vim.cmd(":TSUpdate go")
					end,
				},
				{
					"fredrikaverpil/neotest-golang",
					version = "*",                                                      -- Optional, but recommended; track releases
					build = function()
						vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
					end,
				},
			},
			config = function()
				local config = {
					runner = "gotestsum", -- Optional, but recommended
				}
				require("neotest").setup({
					adapters = {
						require("neotest-golang")(config),
					},
				})
			end,
		},
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
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
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = false },
		},
		opts = {},
		init = function()
			vim.g.loaded_netrwPlugin = 1
		end,
	},
}
