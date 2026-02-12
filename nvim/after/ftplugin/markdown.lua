vim.o.linebreak = true
-- vim.o.number = false
-- vim.o.relativenumber = false

vim.keymap.set("n", "<leader>fs", ":Telescope heading<CR>", { desc = "Show headings (markdown)" })

vim.keymap.set("n", "<leader>cc", '/```/-<CR>V??+<CR>"+y', { desc = "Copy the current code block to clipboard" })
vim.keymap.set("n", "<leader>cy", "/```/-<CR>V??+<CR>y", { desc = "Yank the current code block" })
