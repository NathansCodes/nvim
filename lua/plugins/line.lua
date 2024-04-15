local lualine = {
    "nvim-lualine/lualine.nvim",
    name = "lualine",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", opt = true },
        "nvim-tree/nvim-tree.lua",
        "akinsho/bufferline.nvim",
    },
    opts = {
        options = {
            theme = "auto",
            icons_enabled = true,
            component_separators = "",
            section_separators = { left = "", right = "" },
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
            disabled_filetypes = { statusline = { "NvimTree" } },
        },
        sections = {
            lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
            lualine_b = { 'filename', 'branch' },
            lualine_c = {},
            lualine_x = {},
            lualine_y = { 'filetype', 'progress' },
            lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 } },
        },
        inactive_sections = {
            lualine_a = { 'filename' },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'location' },
        },
        winbar = {},
        inactive_winbar = {},
        extensions = {
            "fugitive",
            "nvim-dap-ui",
        },
    }
}

local bufferline = {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            mode = "buffers",
            themable = false,
            diagnostics = "nvim_lsp",
            diagnostics_update_in_insert = true,
            diagnostics_indicator = function(count, level, _, _)
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
            end,
            separator_style = "slant",
            offsets = { {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "NvimTreeNormal",
            } },
        },
    }
}

return { lualine, bufferline }
