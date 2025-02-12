require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "vendor/", "build/", "assets/" },
	},
})

require("telescope").load_extension("ui-select")
