-- Lazy vim boostrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- File types that should have autocompletion
-- Setup plugins
require("lazy").setup({
	"neovim/nvim-lspconfig",

	{ "williamboman/mason.nvim", event = "VeryLazy", dependencies = "williamboman/mason-lspconfig.nvim" },

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- Code snippets
			"L3MON4D3/LuaSnip",
			{
				"ray-x/lsp_signature.nvim",
				--event = "VeryLazy",
				opts = {},
				config = function(_, opts)
					require("lsp_signature").setup(opts)
				end,
			},
			"saadparwaiz1/cmp_luasnip",

			-- LSP Stuff
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lua",
			"VonHeikemen/lsp-zero.nvim",
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- Colorscheme
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
	},

	-- Code highlighting and diagnostics
	{ "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Code checking
	-- "dense-analysis/ale",
	"mfussenegger/nvim-lint",

	-- File browsing
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"nvim-tree/nvim-tree.lua",
	"nvim-telescope/telescope-ui-select.nvim",

	-- Statusbar
	"nvim-lualine/lualine.nvim",
	"nvim-tree/nvim-web-devicons",

	-- Keybinds
	-- {
	-- 	"folke/which-key.nvim",
	-- 	event = "VeryLazy",
	-- },

	-- Project management
	"ahmedkhalf/project.nvim",
	-- "vimwiki/vimwiki",

	-- Code commentting
	"numToStr/Comment.nvim",

	-- Documentation
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},

	-- Floating terminal
	"voldikss/vim-floaterm",

	-- Notifications
	"rcarriga/nvim-notify",

	-- Code formatting
	"mhartington/formatter.nvim",

	-- Folding
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
	},

	-- AI
	{ "David-Kunz/gen.nvim" },

	-- Note taking
	-- {
	-- 	"nvim-neorg/neorg",
	-- 	build = ":Neorg sync-parsers",
	-- 	lazy = false, -- specify lazy = false because some lazy.nvim distributions set lazy = true by default
	-- 	-- tag = "*",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- },
	"folke/zen-mode.nvim",
})
