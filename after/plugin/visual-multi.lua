
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
