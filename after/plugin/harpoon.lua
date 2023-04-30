local term = require("harpoon.term")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set({ "n", "t" }, "<A-e>", ui.toggle_quick_menu)

vim.keymap.set({ "n", "t" }, "<A-a>", function() ui.nav_file(1) end)
vim.keymap.set({ "n", "t" }, "<A-s>", function() ui.nav_file(2) end)
vim.keymap.set({ "n", "t" }, "<A-d>", function() ui.nav_file(3) end)
vim.keymap.set({ "n", "t" }, "<A-f>", function() ui.nav_file(4) end)

vim.keymap.set("n", "<A-t>", function() term.gotoTerminal(1) end)
