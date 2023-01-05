local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	-- print("install lazy")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

vim.opt.runtimepath:prepend(lazypath)

local lazy_config = {
	checker = {
		-- automatically check for plugin updates
		enabled = true,
		concurrency = nil, ---@type number? set to 1 to check for updates very slowly
		notify = false, -- get a notification when new updates are found
		frequency = 3600, -- check for updates every hour
	},
}

local lazy = require("lazy")

lazy.setup({
	-- Lazy manager self
	"folke/lazy.nvim",

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"p00f/nvim-ts-rainbow",
			"windwp/nvim-ts-autotag",
		},
		event = "VeryLazy",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		config = function()
			require("plugin-config.nvim-treesitter")
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-packer.nvim",
			"LinArcX/telescope-env.nvim",
			"GustavoKatel/telescope-asynctasks.nvim",
			"nvim-telescope/telescope-dap.nvim",
			"ahmedkhalf/project.nvim",
			"debugloop/telescope-undo.nvim",
		},
		event = "VeryLazy",
		config = function()
			require("plugin-config.telescope")
		end,
	},

	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin-config.project")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"arkav/lualine-lsp-progress",
		},
		event = "VimEnter",
		config = function()
			require("plugin-config.lualine")
		end,
	},

	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"moll/vim-bbye",
		},
		event = "VimEnter",
		config = function()
			require("plugin-config.bufferline")
		end,
	},

	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VimEnter",
		config = function()
			require("plugin-config.alpha")
		end,
	},

	{
		"skywind3000/asynctasks.vim",
		dependencies = { "skywind3000/asyncrun.vim" },
		event = "VeryLazy",
		config = function()
			require("plugin-config.asynctasks")
		end,
	},

	-- Translator
	{
		"voldikss/vim-translator",
		event = "VeryLazy",
		config = function() end,
	},

	{
		"williamboman/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"nvim-lua/plenary.nvim",
			"jayp0521/mason-null-ls.nvim",
			"mfussenegger/nvim-dap",
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"jayp0521/mason-nvim-dap.nvim",
			--- dap extensions
			"leoluz/nvim-dap-go",
			"mxsdev/nvim-dap-vscode-js",
			"mfussenegger/nvim-dap-python",
			-- typescript plugin
			"jose-elias-alvarez/typescript.nvim",
			-- neovim lua develop plugin
			"folke/neodev.nvim",
			---- JSON enhance
			"b0o/schemastore.nvim",
			--- ui denpendences
			"onsails/lspkind-nvim",
			--- Completion
			"hrsh7th/nvim-cmp",
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			---- Common programming language code snippets
			"rafamadriz/friendly-snippets",
		},
		event = "VeryLazy",
		config = function()
			require("plugin-config.mason")
		end,
	},

	-- lspsaga
	{
		"jinzhongjia/lspsaga.nvim",
		branch = "main",
		event = "VeryLazy",
		config = function()
			require("plugin-config.lspsaga")
		end,
	},

	-- git handle
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin-config.gitsigns")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin-config.indent-blankline")
		end,
	},

	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin-config.comment")
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		config = function()
			require("plugin-config.nvim-autopairs")
		end,
	},

	{
		"voldikss/vim-floaterm",
		event = "VeryLazy",
	},

	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
		config = function()
			require("plugin-config.nvim-colorizer")
		end,
	},

	{
		"simrat39/symbols-outline.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin-config.symbols-outline")
		end,
	},

	--------------------- colorschemes --------------------
	-- Tokyonight
	-- use({
	-- 	"projekt0n/github-nvim-theme",
	-- 	config = function()
	-- 		local status, github_theme = pcall(require, "github-theme")
	-- 		if not status then
	-- 			vim.notify("not found github-theme")
	-- 			return
	-- 		else
	-- 			github_theme.setup({
	-- 				theme_style = "dimmed",
	-- 				overrides = function(c)
	-- 					return {
	-- 						BufferLineBackground = {},
	-- 					}
	-- 				end,
	-- 			})
	-- 		end
	-- 	end,
	-- })

	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			local status, catppuccin = pcall(require, "catppuccin")
			if not status then
				vim.notify("not found Catppuccin")
				return
			else
				catppuccin.setup({
					flavour = "macchiato",
				})
			end
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}, lazy_config)
