local custom_rose_pine = require('lualine.themes.rose-pine')

custom_rose_pine.normal.c.bg = 'none'
custom_rose_pine.visual.c.bg = 'none'
custom_rose_pine.insert.c.bg = 'none'
custom_rose_pine.command.c.bg = 'none'

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = custom_rose_pine,
        component_separators = { left = '', right = ''},
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
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filetype', 'filename', 'location'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {
        'fugitive',
        'nvim-dap-ui',
    },
}
