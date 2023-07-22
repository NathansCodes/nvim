local transparent = require("transparent")

require("rose-pine").setup({
    dark_variant='moon'
})

function Colors(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

end

Colors()

transparent.setup {
    extra_groups = {
        "TelescopeNormal", "TelescopeBorder", "TelescopePromptNorml"
    }
}
