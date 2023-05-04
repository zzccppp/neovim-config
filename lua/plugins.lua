local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lazy_config = {
	checker = {
		-- automatically check for plugin updates
		enabled = true,
		concurrency = nil, ---@type number? set to 1 to check for updates very slowly
		notify = false, -- get a notification when new updates are found
		frequency = 3600, -- check for updates every hour
	},
}

require("lazy").setup({
	"folke/lazy.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function()
			require("plugin-config.nvim-treesitter")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"LinArcX/telescope-env.nvim",
			-- "nvim-telescope/telescope-dap.nvim",
			"debugloop/telescope-undo.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		},
		event = "VeryLazy",
		config = function()
			require("plugin-config.telescope")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "BufEnter",
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
		event = "BufEnter",
		config = function()
			require("plugin-config.bufferline")
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
		"nvim-tree/nvim-tree.lua",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
		config = function()
			require("plugin-config.nvim-tree")
		end,
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"jayp0521/mason-null-ls.nvim",
			"nvim-lua/plenary.nvim",
			---- JSON enhance
			"b0o/schemastore.nvim",
			---- For lua
			"folke/neodev.nvim",
			---- For dap
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
			{ "jayp0521/mason-nvim-dap.nvim", commit = "2b5f8a23d418e7efdf6dee569dd409bd1e807eae" },
			"theHamsta/nvim-dap-virtual-text",
			--- dap extensions
			"leoluz/nvim-dap-go",
			"mxsdev/nvim-dap-vscode-js",
			"mfussenegger/nvim-dap-python",
		},
		event = "VeryLazy",
		config = function()
			require("plugin-config.mason")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			---- Common programming language code snippets
			"rafamadriz/friendly-snippets",
			--- ui denpendences
			"onsails/lspkind-nvim",
			--- autopairs
			"windwp/nvim-autopairs",
		},
		event = "VeryLazy",
		config = function()
			require("plugin-config.cmp")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin-config.gitsigns")
		end,
	},
	{
		"utilyre/barbecue.nvim",
		event = "VeryLazy",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		config = function()
			require("plugin-config.barbecue")
		end,
	},
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin-config.fidget")
		end,
	},
	{
		"m-demare/hlargs.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		event = "VeryLazy",
		config = function()
			require("plugin-config.hlargs")
		end,
	},
	{
		"anuvyklack/windows.nvim",
		event = "VeryLazy",
		dependencies = "anuvyklack/middleclass",
		config = function()
			require("plugin-config.windows")
		end,
	},
	{
		-- dir = "~/code/lua/LspUI.nvim",
		"jinzhongjia/LspUI.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin-config.LspUI")
		end,
	},
	{
		"dnlhc/glance.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin-config.glance")
		end,
	},
	{
		"stevearc/aerial.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin-config.aerial")
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		event = "VeryLazy",
		dependencies = {
			"kevinhwang91/promise-async",
			{
				"luukvbaal/statuscol.nvim",
				config = function()
					require("statuscol").setup({
						foldfunc = "builtin",
						setopt = true,
					})
				end,
			},
		},
		config = function()
			require("plugin-config.nvim-ufo")
		end,
	},
	{
		"voldikss/vim-floaterm",
		event = "VeryLazy",
	},
	{
		"voldikss/vim-translator",
		event = "VeryLazy",
		config = function() end,
	},
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},

	--------------------- colorschemes --------------------
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
		-- enabled = false,
	},
	{
		"sainnhe/gruvbox-material",
		config = function()
			vim.opt.background = "dark"
			vim.g.gruvbox_material_background = "medium"
			vim.g.gruvbox_material_better_performance = 1
			vim.cmd.colorscheme("gruvbox-material")
		end,
		enabled = false,
	},
}, lazy_config)
