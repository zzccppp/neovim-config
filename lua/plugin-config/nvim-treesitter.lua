local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	vim.notify("not found nvim-treesitter")
	return
end

treesitter.setup({
	-- Install language parser
	-- :TSInstallInfo command to view supported languages
	ensure_installed = "all",
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
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	autotag = {
		enable = true,
	},
})

-- Open the Folding module
-- vim.opt.foldmethod     = 'expr'
-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
---WORKAROUND
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
	callback = function()
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	end,
})

-- Temporarily fix the bug of the files of the Telescope before taking the effect before FOLD takes effect
-- pcall(
-- 	vim.cmd,
-- 	[[
--         augroup fold_fix
--         autocmd!
--         autocmd BufRead * autocmd BufWinEnter * ++once normal! zx zR
--         augroup end
--     ]]
-- )

---ENDWORKAROUND
-- Do not fold by default
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
