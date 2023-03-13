
vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("v", "<C-c>", "<Esc>")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<A-h>", "<C-W>h")
vim.keymap.set("n", "<A-j>", "<C-W>j")
vim.keymap.set("n", "<A-k>", "<C-W>k")
vim.keymap.set("n", "<A-l>", "<C-W>l")

vim.keymap.set("i", "<A-h>", "<C-W>h")
vim.keymap.set("i", "<A-j>", "<C-W>j")
vim.keymap.set("i", "<A-k>", "<C-W>k")
vim.keymap.set("i", "<A-l>", "<C-W>l")

vim.keymap.set("v", "<A-h>", "<C-W>h")
vim.keymap.set("v", "<A-j>", "<C-W>j")
vim.keymap.set("v", "<A-k>", "<C-W>k")
vim.keymap.set("v", "<A-l>", "<C-W>l")

vim.keymap.set("t", "<A-h>", "<C-\\><C-N><C-W>h")
vim.keymap.set("t", "<A-j>", "<C-\\><C-N><C-W>j")
vim.keymap.set("t", "<A-k>", "<C-\\><C-N><C-W>k")
vim.keymap.set("t", "<A-l>", "<C-\\><C-N><C-W>l")

vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")

vim.keymap.set(
    {'n', 'v', 'i'}, "<C-j>", 
    ":call vm#commands#add_cursor_down(0, v:count1)<cr>",
    { noremap = true, silent = true }
)   
  
vim.keymap.set(
    {'n', 'v', 'i'}, "<C-k>", 
    ":call vm#commands#add_cursor_up(0, v:count1)<cr>",
    { noremap = true, silent = true } 
) 
