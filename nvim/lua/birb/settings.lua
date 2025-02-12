-- Vim settings
vim.o.number = true
vim.o.incsearch = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.swapfile = false
vim.o.cmdheight = 1
vim.o.expandtab = false
vim.o.conceallevel = 1
vim.o.linebreak = true

-- Silence some warnings
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- Use nvim-notify for notifications
vim.notify = require("notify")

-- Folding settings
vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
