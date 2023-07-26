local theme = require("lualine.themes.rose-pine")
local modes = { "normal", "insert", "visual", "replace", "command", "inactive" }
for _, mode in ipairs(modes) do
    theme[mode].a.fg = theme[mode].b.fg
    theme[mode].a.bg = "none"
    theme[mode].b.bg = "none"
    theme[mode].c.bg = "none"
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = theme,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                'filetype',
                icon_only = true,
            }, 'filename', 'diagnostics'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                'filetype',
                icon_only = true,
            }, 'filename', 'diagnostics'
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    extensions = {
        'fugitive',
        'nvim-dap-ui',
    },
}
