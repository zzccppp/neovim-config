local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("not found telescope")
	return
end

telescope.setup({
	defaults = {
		-- The initial mode entered after opening the pop-up window, the default is insert, it can also be normal
		initial_mode = "insert",
		-- Shortcut keys in the window
		mappings = {
			i = {
				-- Moving up and down
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<Down>"] = "move_selection_next",
				["<Up>"] = "move_selection_previous",
				-- history record
				["<C-n>"] = "cycle_history_next",
				["<C-p>"] = "cycle_history_prev",
				-- close the window
				["<C-c>"] = "close",
				-- The preview window scrolls up and down
				["<C-u>"] = "preview_scrolling_up",
				["<C-d>"] = "preview_scrolling_down",
			},
		},
		file_ignore_patterns = { "node_modules", "dist", "__pycache__" },
	},
	pickers = {
		-- Built-in pickers configuration
		find_files = {
			-- Find files for skinning, supported parameters are: dropdown, cursor, ivy
			-- theme = "dropdown",
			hidden = true,
		},
	},
	extensions = {
		-- Extensions
		file_browser = {
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
		},
		undo = {
			side_by_side = true,
			layout_strategy = "vertical",
			layout_config = {
				preview_height = 0.8,
			},
		},
	},
})

-- Telescope extensions
telescope.load_extension("file_browser")
-- telescope.load_extension("packer")
telescope.load_extension("env")
telescope.load_extension("asynctasks")
telescope.load_extension("dap")
telescope.load_extension("projects")
telescope.load_extension("undo")
