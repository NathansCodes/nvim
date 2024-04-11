function Colors()
    -- this will be changed by my awm theme switcher
    vim.cmd.colorscheme("catppuccin-mocha")

    local bufferline_bg = vim.api.nvim_get_hl(0, { name = "BufferLineFill" }).bg
    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = bufferline_bg })
end

return {
    "ap/vim-css-color",
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = true,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
        opts = {
            term_colors = true,
            color_overrides = {
                mocha = {
                    mantle = "#181825",
                }
            },
            integrations = {
                telescope = {
                    enabled = true,
                    style = "nvchad",
                },
            }
        }
    },
    {
        "Biscuit-Colorscheme/nvim",
        name = "biscuit",
        lazy = true,
    },
}
