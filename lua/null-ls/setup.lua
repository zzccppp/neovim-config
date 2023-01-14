local mason_null_ls = require("mason-null-ls")
local null_ls = require("null-ls")

local list = require("null-ls.list")
local sources = {}
local handlers = {}

for _, ele in pairs(list) do
	local name = ele[1]
	local attrs = ele[2]
	-- insert name to sources
	table.insert(sources, name)
	-- create func of name to register
	handlers[name] = function()
		if #ele == 3 then
			for _, attr in pairs(attrs) do
				local arg = ele[3]
				null_ls.register({
					name = name,
					sources = {
						null_ls.builtins[attr][name].with(arg),
					},
				})
			end
		else
			for _, attr in pairs(attrs) do
				null_ls.register({
					name = name,
					sources = {
						null_ls.builtins[attr][name],
					},
				})
			end
		end
	end
end

mason_null_ls.setup({
	ensure_installed = sources,
})

mason_null_ls.setup_handlers(handlers)

null_ls.setup({
	debug = false,
	sources = {
		-- null_ls.builtins.code_actions.gitsigns.with({
		-- 	disabled_filetypes = {
		-- 		"alpha",
		-- 		"packer",
		-- 		"terminal",
		-- 		"help",
		-- 		"log",
		-- 		"TelescopePrompt",
		-- 		"mason",
		-- 		"lspinfo",
		-- 		"floaterm",
		-- 		"NvimTree",
		-- 		"null-ls-info",
		-- 	},
		-- }),
		null_ls.builtins.formatting.zigfmt,
		require("typescript.extensions.null-ls.code-actions"),
	},
	-- save auto format
	-- on_attach = function(_)
	-- 	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()']])
	-- end,
})
