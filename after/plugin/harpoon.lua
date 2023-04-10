local term = require("harpoon.term")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set({ "n", "t" }, "<C-e>", ui.toggle_quick_menu)

vim.keymap.set({ "n", "t" }, "<C-y>", function() ui.nav_file(1) end)
vim.keymap.set({ "n", "t" }, "<C-h>", function() ui.nav_file(2) end)
vim.keymap.set({ "n", "t" }, "<C-g>", function() ui.nav_file(3) end)
vim.keymap.set({ "n", "t" }, "<C-b>", function() ui.nav_file(4) end)

vim.keymap.set("n", "<C-t>", function() term.gotoTerminal(1) end)
