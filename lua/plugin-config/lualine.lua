local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("not found lualine")
	return
end

lualine.setup({
	options = {
		theme = "auto",
		component_separators = { left = "|", right = "|" },
		-- https://github.com/ryanoasis/powerline-extra-symbols
		section_separators = { left = " ", right = "" },
		disabled_filetypes = {
			statusline = {
				-- "aerial",
				-- "NvimTree",
			},
			winbar = {},
		},
		ignore_focus = {
			"aerial",
			"NvimTree",
			"floaterm",
			"Glance",
			"Lspui_code_action",
			"Lspui_rename",
			"Lspui-diagnostic",
			"fugitiveblame",
			"",
		},
	},
	extensions = {},
	sections = {
		lualine_c = {
			"filename",
		},
		lualine_x = {
			"aerial",
			"filesize",
			{
				require("lazy.status").updates,
				cond = require("lazy.status").has_updates,
				color = { fg = "#ff9e64" },
			},
			{
				"fileformat",
				symbols = {
					unix = "", -- e712
					dos = "", -- e70f
					mac = "", -- e711
				},
			},
			"encoding",
			"filetype",
		},
	},
})
