local code_action = "code_actions"
local completion = "completion"
local diagnostics = "diagnostics"
local formatting = "formatting"
local hover = "hover"

local list = {
	-- To add one of null-ts component,
	-- you just add a table with name and attribute,
	-- the attributes are :
	-- "code_action",
	-- "completion",
	-- "diagnostics",
	-- "formatting",
	-- "hover"
	-- For detailed support of components, please see null-ts BUILTIN
	-- And you can add third element to the table, which is the param of function "with"
	-- more about above, see https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md#runtime_condition
	{ "clang_format", { formatting } },
	{ "cmake_format", { formatting } },
	{ "gofumpt", { formatting } },
	{ "goimports", { formatting } },
	-- { "golines", { formatting } },
	{ "staticcheck", { diagnostics } },
	-- { "eslint_d", { code_action, diagnostics } },
	{ "markdownlint", { diagnostics } },
	{ "prettierd", { formatting } },
	{ "shellcheck", { code_action } },
	{ "stylua", { formatting } },
	{ "jq", { formatting } },
	{ "shfmt", { formatting } },
	{
		"codespell",
		{ diagnostics },
		{
			disabled_filetypes = {
				"alpha",
				"packer",
				"terminal",
				"help",
				"log",
				"TelescopePrompt",
				"mason",
				"lspinfo",
				"floaterm",
				"NvimTree",
				"null-ls-info",
			},
		},
	},
	{ "hadolint", { diagnostics } },
	-- { "haml_lint", { diagnostics } },
	{ "black", { formatting } },
	{ "isort", { formatting } },
	{ "vint", { diagnostics } },
	{ "rustfmt", { formatting } },
	-- { "cspell", { diagnostics, code_action } },
}

return list
