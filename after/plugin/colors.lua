require("rose-pine").setup({
    dark_variant='moon'
})

function Colors(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" } )
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" } )
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" } )
	vim.api.nvim_set_hl(0, "Menu", { bg = "none" } )
	--vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" } )
	--vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" } )
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" } )
end

Colors()

local is_transparent = true
vim.keymap.set("n", "<C-t><C-t>", function() 
    if is_transparent then
        vim.cmd.colorscheme("rose-pine")
        is_transparent = false
    else
        Colors()
        is_transparent = true
    end
end)
vim.keymap.set("n", "<C-t><C-e>", function()
    Colors()
    is_transparent = true
end)
vim.keymap.set("n", "<C-t><C-d>", function()
    vim.cmd.colorscheme("rose-pine")
    is_transparent = false
end)
