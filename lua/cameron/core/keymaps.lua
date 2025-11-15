vim.g.mapleader = ","

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", {
	desc = "Exit insert mode with jk",
})

keymap.set("n", "<leader>nh", ":nohl<CR>", {
	desc = "Clear search highlights",
})

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", {
	desc = "Split window vertically",
})
keymap.set("n", "<leader>sh", "<C-w>s", {
	desc = "Split window horizontally",
})
keymap.set("n", "<leader>se", "<C-w>=", {
	desc = "Make splits equal size",
})
keymap.set("n", "<leader>sx", "<cmd>close<CR>", {
	desc = "Close current split",
})
keymap.set("n", "<leader>sk", "<C-w>>", {
	desc = "Make split window larger",
})
keymap.set("n", "<leader>sj", "<C-w><", {
	desc = "Make split window smaller",
})

-- To switch between windows:
--   <C-[hjkl]>

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", {
	desc = "Open new tab",
})
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", {
	desc = "Close current tab",
})
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", {
	desc = "Go to next tab",
})
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", {
	desc = "Go to previous tab",
})
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", {
	desc = "Open current buffer in new tab",
})

-- Switch out of TERMINAL mode to swap windows
keymap.set("t", "<C-t>", "<C-\\><C-n>:echo<CR>", {
	noremap = true,
	silent = true,
})

-- Nvim-Spectre
keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
})
keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word",
})
keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word",
})
keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file",
})

-- Disable arrow keys to prevent myself from abusing them
-- keymap.set("n", "<Up>", "<Nop>", { noremap = true })
-- keymap.set("n", "<Down>", "<Nop>", { noremap = true })
-- keymap.set("n", "<Left>", "<Nop>", { noremap = true })
-- keymap.set("n", "<Right>", "<Nop>", { noremap = true })
-- keymap.set("i", "<Up>", "<Nop>", { noremap = true })
-- keymap.set("i", "<Down>", "<Nop>", { noremap = true })
-- keymap.set("i", "<Left>", "<Nop>", { noremap = true })
-- keymap.set("i", "<Right>", "<Nop>", { noremap = true })
