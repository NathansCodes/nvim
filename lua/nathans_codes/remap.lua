
vim.g.mapleader = " "

-- general remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("v", "<C-c>", "<Esc>")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- remaps for splits
vim.keymap.set({ 'n', 't' }, '<A-h>', '<C-W>h')
vim.keymap.set({ 'n', 't' }, '<A-j>', '<C-W>j')
vim.keymap.set({ 'n', 't' }, '<A-k>', '<C-W>k')
vim.keymap.set({ 'n', 't' }, '<A-l>', '<C-W>l')
vim.keymap.set({ 'n', 't' }, '<A-o>', '<C-W>o')
vim.keymap.set({ 'n', 't' }, '<C-->', '<C-W>-')
vim.keymap.set({ 'n', 't' }, '<C-_>', '<C-W>_')
vim.keymap.set({ 'n', 't' }, '<C-+>', '<C-W>+')
vim.keymap.set({ 'n', 't' }, '<C-=>', '<C-W>=')
vim.keymap.set({ 'n', 't' }, '<C-|>', '<C-W>|')

vim.keymap.set('t', '<A-a>', '<C-\\><C-N><C-W>h')
vim.keymap.set('t', '<A-s>', '<C-\\><C-N><C-W>j')
vim.keymap.set('t', '<A-w>', '<C-\\><C-N><C-W>k')
vim.keymap.set('t', '<A-d>', '<C-\\><C-N><C-W>l')


-- terminal stuff
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")

-- debugging
local dap = require('dap')

vim.keymap.set("n", "<leader>c", function() dap.continue() end)
vim.keymap.set("n", "<leader>n", function() dap.step_over() end)
vim.keymap.set("n", "<leader>i", function() dap.step_into() end)
vim.keymap.set("n", "<leader>o", function() dap.step_out() end)
vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set("n", "<leader>s", function() dap.close() end)
