keymap = vim.keymap.set
-- General keymaps --
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
keymap("n", "<C-c>", 'ggVG"+y', { desc = "Copy whole file to system clipboard" })
keymap("n", "<leader>o", "o <Esc>", { desc = "Add line under cursor" })
keymap("n", "<leader>O", "O <Esc>", { desc = "Add line over cursor" })
keymap("n", "∆", "<cmd>m .+1<cr>==", { desc = "Move Down" }) -- alt + k
keymap("n", "˚", "<cmd>m .-2<cr>==", { desc = "Move Up" }) -- alt + j
keymap("i", "∆", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap("i", "˚", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap("v", "∆", ":m '>+1<cr>gv=gv", { desc = "Move Down" }) -- alt + k
keymap("v", "˚", ":m '<-2<cr>gv=gv", { desc = "Move Up" }) -- alt + j
keymap("n", "<C-s>", ":w<CR>", { desc = "Save file" })
keymap("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save file in insert mode" })

-- tabs --
keymap("n", "†", ":tabnew<CR>", { desc = "Create new tab" }) -- alt + t
keymap("n", "œ", ":tabclose<CR>", { desc = "Close tab" }) -- alt + q
keymap("n", "¬", ":+tabnext<CR>", { desc = "Move to right tab" }) -- alt + l
keymap("n", "˙", ":-tabnext<CR>", { desc = "Move to left tab" }) -- alt + j
keymap("n", "ø", ":tabonly<CR>", { desc = "Close all tabs but current one" }) -- alt + o
