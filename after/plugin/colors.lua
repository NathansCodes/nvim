local transparent = require("transparent")

require("rose-pine").setup()
require("catppuccin").setup()

function Colors(color)
	color = color or 'catppuccin-macchiato'
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

