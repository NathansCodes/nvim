local transparent = require("transparent")

require("rose-pine").setup {
    dark_variant='moon'
}

vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup()

function Colors(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)
end

Colors()

transparent.setup {
    extra_groups = {
        "TelescopeNormal", "TelescopeBorder", "TelescopePromptNormal",
        "GitSignsAdd", "GitSignsChange", "GitSignsDelete", "GitSignsChangedelete",
        "FloatBorder", "FloatTitle", "NormalFloat",
    }
}

