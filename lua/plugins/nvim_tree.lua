return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local nvtree = require("nvim-tree")
        local api = require("nvim-tree.api")

        local function edit_or_open()
            local node = api.tree.get_node_under_cursor()

            if node.nodes ~= nil then
                -- expand or collapse folder
                api.node.open.edit()
            else
                -- open file
                api.node.open.edit()
            end
        end

        -- open as vsplit on current node
        local function vsplit_preview()
            local node = api.tree.get_node_under_cursor()

            if node.nodes ~= nil then
                -- expand or collapse folder
                api.node.open.edit()
            else
                -- open file as vsplit
                api.node.open.vertical()
            end

            -- Finally refocus on tree if it was lost
            api.tree.focus()
        end

        nvtree.setup {
            filters = { custom = { "^.git$" } },
            -- on_attach = function(bufnr)
                -- local function opts(desc)
                --     return {
                --         desc = 'nvim-tree: ' .. desc,
                --         buffer = bufnr,
                --         noremap = true,
                --         silent = true,
                --         nowait = true,
                --     }
                -- end
                -- vim.keymap.set("n", "l", edit_or_open,          opts("Edit Or Open"))
                -- vim.keymap.set("n", "L", vsplit_preview,        opts("Vsplit Preview"))
                -- vim.keymap.set("n", "h", edit_or_open,          opts("Close"))
                -- vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
            -- end
        }

        vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeOpen<cr>")

        -- auotmatically open nvim-tree on enter
        -- if no file was/no arguments were passed
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                vim.cmd.NvimTreeOpen()
            end
        })
    end
}
