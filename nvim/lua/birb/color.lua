-- Colorscheme
vim.cmd("set bg=")

require("kanagawa").setup({
	dimInactive = false,
	background = { light = "lotus", dark = "dragon" },
	overrides = function(colors)
		local theme = colors.theme
		return {
			Normal = { bg = "none" },
			NormalFloat = { bg = "none" },
			FloatBorder = { bg = "none" },
			FloatTitle = { bg = "none" },

			-- Set some diagnostic colors
			DiagnosticError = { fg = colors.samuraiRed },
			DiagnosticWarn = { fg = colors.roninYellow },
			DiagnosticInfo = { fg = colors.waveAqua1 },
			DiagnosticHint = { fg = colors.dragonBlue },

			-- Save an hlgroup with dark background and dimmed foreground
			-- so that you can use it where your still want darker windows.
			-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
			NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

			-- Popular plugins that open floats will link to NormalFloat by default;
			-- set their background accordingly if you wish to keep them dark and borderless
			LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
			MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
		}
	end,
})

vim.opt.termguicolors = true

vim.cmd.colorscheme("kanagawa")

-- Lualine colorscheme
local colors = require("kanagawa.colors").setup().palette

Kanagawa_lualine = {
	normal = {
		a = { bg = colors.springGreen, fg = colors.sumiInk4, gui = "bold" },
		b = { bg = colors.sumiInk0, fg = colors.oldWhite },
		c = { bg = colors.sumiInk2, fg = colors.oldWhite },
	},
	insert = {
		a = { bg = colors.crystalBlue, fg = colors.sumiInk4, gui = "bold" },
		b = { bg = colors.sumiInk0, fg = colors.oldWhite },
		c = { bg = colors.sumiInk2, fg = colors.oldWhite },
	},
	visual = {
		a = { bg = colors.oniViolet, fg = colors.sumiInk4, gui = "bold" },
		b = { bg = colors.sumiInk0, fg = colors.oldWhite },
		c = { bg = colors.sumiInk2, fg = colors.oldWhite },
	},
	replace = {
		a = { bg = colors.autumnRed, fg = colors.fujiWhite, gui = "bold" },
		b = { bg = colors.sumiInk0, fg = colors.oldWhite },
		c = { bg = colors.sumiInk2, fg = colors.oldWhite },
	},
	command = {
		a = { bg = colors.surimiOrange, fg = colors.sumiInk4, gui = "bold" },
		b = { bg = colors.sumiInk0, fg = colors.oldWhite },
		c = { bg = colors.sumiInk2, fg = colors.oldWhite },
	},
	inactive = {
		a = { bg = colors.sumiInk0, fg = colors.sumiInk2, gui = "bold" },
		b = { bg = colors.sumiInk0, fg = colors.sumiInk2 },
		c = { bg = colors.sumiInk0, fg = colors.sumiInk2 },
	},
}
