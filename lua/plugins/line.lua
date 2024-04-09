local lualine = {
    "nvim-lualine/lualine.nvim",
    name = "lualine",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", opt = true },
        "nvim-tree/nvim-tree.lua",
        "akinsho/bufferline.nvim",
    },
    config = function()
        local theme = require("lualine.themes.catppuccin")
        local modes = { "normal", "insert", "visual", "replace", "command", "inactive" }
        for _, mode in ipairs(modes) do
            theme[mode].c = "none"
        end

        require("lualine").setup {
            options = {
                theme = theme,
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
                lualine_c = {
                    '%=', --[[ add your center compoentnts here in place of this comment ]]
                },
                lualine_x = {},
                lualine_y = { 'filetype', 'progress' },
                lualine_z = {
                    { 'location', separator = { right = '' }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' },
            },
            inactive_winbar = {},
            extensions = {
                "fugitive",
                "nvim-dap-ui",
            },
            winbar = {}
        }
    end,
}

local bufferline = {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        -- "nvim-tree/nvim-tree.lua",
    },
    config = function()
        require("bufferline").setup {
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
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = {"close"}
                },
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "BufferLineFill",
                    }
                },
            },
            -- highlights = {
            --     fill = {
            --         bg = {
            --             -- won't work all that well for some colorschemes,
            --             -- but it's the best way to get rid of the tint I've found so far
            --             highlight = "NormalSB",
            --             attribute = "bg",
            --         }
            --     },
            -- },
        }
    end
}

return { lualine, bufferline }
