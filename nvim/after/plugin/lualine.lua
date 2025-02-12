require("birb.color")

WordCounterEnabled = false
WordCounterGoal = 0
local starting_word_count = 0 -- Set to non-zero to make the WordCounterGoal relative

function SetNewWordGoal(new_words)
	WordCounterEnabled = true
	starting_word_count = vim.fn.wordcount().words
	WordCounterGoal = starting_word_count + new_words
end

function ResetNewWordGoal()
	starting_word_count = 0
	WordCounterGoal = 0
end

local function get_wordcount()
	if WordCounterEnabled then
		local word_count = "Words: " .. tostring(vim.fn.wordcount().words - starting_word_count)

		-- If a goal has been set, append that into the word_count variable
		if WordCounterGoal > 0 then
			word_count = word_count .. "/" .. tostring(WordCounterGoal - starting_word_count)
		end

		return word_count
	else
		return ""
	end
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = Kanagawa_lualine,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { get_wordcount, "hostname", "encoding", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = { "nerdtree" },
})
