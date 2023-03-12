local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	vim.notify("not found nvim-treesitter")
	return
end

treesitter.setup({
	-- Install language parser
	-- :TSInstallInfo command to view supported languages
	ensure_installed = "all",

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	-- Enable code highlighting module
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	-- Enable incremental selection module
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},
	-- Enable code indentation module (=)
	-- indent = {
	-- 	enable = true,
	-- },
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
