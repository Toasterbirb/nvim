vim.g.mapleader = " "

-- Register keymap stuff to which-key
-- require("which-key").register({
-- 	{ "<leader>c", group = "Commands" },
-- 	{ "<leader>c_", hidden = true },
-- 	{ "<leader>d", group = "Documentation" },
-- 	{ "<leader>d_", hidden = true },
-- 	{ "<leader>f", group = "Telescope" },
-- 	{ "<leader>f_", hidden = true },
-- 	{ "<leader>l", group = "LuaSnip" },
-- 	{ "<leader>l_", hidden = true },
-- 	{ "<leader>n", group = "nvim tree" },
-- 	{ "<leader>n_", hidden = true },
-- 	{ "<leader>s", group = "Manage split" },
-- 	{ "<leader>s_", hidden = true },
-- 	{ "<leader>t", group = "Floating terminal" },
-- 	{ "<leader>t_", hidden = true },
-- 	{ "<leader>w", group = "VimWiki" },
-- 	{ "<leader>w_", hidden = true },
-- 	{ "<leader>x", group = "Trouble" },
-- 	{ "<leader>x_", hidden = true },
-- })

-- Generic keymaps
vim.keymap.set("n", "<C-i>", function()
	vim.diagnostic.goto_next()
end, { desc = "Browse diagnostic errors" })
vim.keymap.set("n", "T", vim.cmd.tabnew, { desc = "Opens a new tab" })
vim.keymap.set("i", "<C-f>", "<C-x><C-f>", { desc = "Autocomplete filepaths" })
vim.keymap.set("n", "<Esc>", vim.cmd.nohl, { desc = "Clear search highlighting" })
vim.keymap.set("n", "<leader>ww", vim.cmd.VimwikiIndex, { desc = "Open the vimwiki index page" })
vim.keymap.set("v", "<leader>cs", ":sort<CR>", { desc = "Sort the selection" })
vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { desc = "Apply fix" })
vim.keymap.set("v", "<leader>cn", ":s/\\n/ /g<CR>", { desc = "Replace newlines with whitespace" })
vim.keymap.set("n", "<leader>cy", 'gg<S-v>G"+y', { desc = "Copy the entire file to system clipboard" })

-- Split and window movement
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Move to the split on the left side" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Move to the split on the right side" })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Move to the split above" })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Move to the split below" })
vim.keymap.set("n", "<leader>sv", ":vs<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>sh", ":sv<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<C-q>", ":close<CR>", { desc = "Close the current buffer" })

-- Keep selection when indenting
vim.keymap.set("v", ">", ">gv", { desc = "Keep selection after indenting" })
vim.keymap.set("v", "<", "<gv", { desc = "Keep selection after unindenting" })

-- Move lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move the selected line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move the selected line up" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Browse vim buffers" })
vim.keymap.set(
	"n",
	"<leader>fs",
	builtin.lsp_document_symbols,
	{ desc = "List LSP document symbols in the current buffer" }
)
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "List LSP references for word under the cursor" })
vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>", { desc = "Browse recent projects" })

-- NvimTree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle nvim tree" })
vim.keymap.set("n", "<leader>nn", ":NvimTreeToggle<CR>", { desc = "Toggle nvim tree" })
vim.keymap.set("n", "<leader>nf", ":NvimTreeFocus<CR>", { desc = "Focus to nvim tree" })
vim.keymap.set("n", "<leader>no", ":NvimTreeFindFile<CR>", { desc = "Find the currently active file in nvim tree" })

-- Trouble
vim.keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end, { desc = "Toggle trouble list" })

-- Luasnip
vim.keymap.set({ "i", "s" }, "<A-k>", function()
	local ls = require("luasnip")
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })
vim.keymap.set(
	"n",
	"<leader>ls",
	"<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>",
	{ desc = "Source luasnip config" }
)

-- Neogen
vim.keymap.set("n", "<leader>df", function()
	require("neogen").generate()
end, { desc = "Generate doxygen docs" })

-- FloatTerm
local script_name = "vimrun.sh" -- Name of the script that floaterm will run from cwd

vim.keymap.set("n", "<leader>tt", ":FloatermNew<CR>", { desc = "Open a floating terminal window" })
vim.keymap.set("n", "<leader>tr", function()
	local script = io.open(script_name, "r")
	if script ~= nil then
		io.close(script)
		vim.cmd('FloatermNew "$PWD/' .. script_name .. '"')
	else
		vim.notify("No " .. script_name .. " script was found in current working directory", vim.log.levels.ERROR)
	end
end, { desc = "Run the " .. script_name .. " script in cwd" })

-- Neorg
vim.keymap.set("n", "<leader>wi", ":Neorg workspace notes<CR>", { desc = "Go to the neorg index page" })

-- gen.nvim
vim.keymap.set({ "n", "v" }, "<leader>oo", ":Gen<CR>", { desc = "Open Ollama Gen menu" })
vim.keymap.set({ "v" }, "<leader>or", ":Gen Review_Code<CR>", { desc = "Review code" })
vim.keymap.set({ "v" }, "<leader>oe", ":Gen Explain_Code<CR>", { desc = "Explain code" })
