local status, ident_blankline = pcall(require, "indent_blankline")
if not status then
	vim.notify("not found indent_blankline")
	return
end

ident_blankline.setup({
	-- empty line placeholder
	space_char_blankline = " ",
	-- Judging context with treesitter
	show_current_context = true,
	show_current_context_start = true,
	context_patterns = {
		"class",
		"function",
		"method",
		"element",
		"^if",
		"^while",
		"^for",
		"^object",
		"^table",
		"block",
		"arguments",
	},
	-- :echo &filetype
	filetype_exclude = {
		"alpha",
		"packer",
		"terminal",
		"help",
		"log",
		"markdown",
		"TelescopePrompt",
		"lsp-installer",
		"lspinfo",
		"toggleterm",
	},
	-- vertical bar style
	-- char = '¦'
	-- char = '┆'
	-- char = '│'
	-- char = "⎸",
	char = "▏",
})
