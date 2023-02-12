local status, ident_blankline = pcall(require, "indent_blankline")
if not status then
	vim.notify("not found indent_blankline")
	return
end

ident_blankline.setup({
    show_end_of_line = true,
	-- empty line placeholder
	space_char_blankline = " ",
	-- Judging context with treesitter
	show_current_context = true,
	show_current_context_start = true,
	-- vertical bar style
	char = '¦'
	-- char = '┆'
	-- char = '│'
	-- char = "⎸",
	-- char = "▏",
})
