local float_preview = {
    "JMarkin/nvim-tree.lua-float-preview",
    lazy = true,
    -- default
    opts = {
        -- Whether the float preview is enabled by default. When set to false, it has to be "toggled" on.
        toggled_on = true,
        -- wrap nvimtree commands
        wrap_nvimtree_commands = true,
        -- lines for scroll
        scroll_lines = 20,
        -- window config
        window = {
            style = "minimal",
            relative = "win",
            border = "rounded",
            wrap = false,
        },
        mapping = {
            -- scroll down float buffer
            down = { "<C-d>" },
            -- scroll up float buffer
            up = { "<C-e>", "<C-u>" },
            -- enable/disable float windows
            toggle = { "<C-x>" },
        },
        -- hooks if return false preview doesn't shown
        hooks = {
            pre_open = function(path)
                -- if file > 5 MB or not text -> not preview
                local size = require("float-preview.utils").get_size(path)
                if type(size) ~= "number" then
                    return false
                end
                local is_text = require("float-preview.utils").is_text(path)
                return size < 5 and is_text
            end,
            post_open = function()
                return true
            end,
        },
    }
}

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        float_preview,
    },
    config = function()
        local nvtree = require("nvim-tree")

        local function on_attach(bufnr)
            local preview = require("float-preview")

            preview.attach_nvimtree(bufnr)

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

            local function opts(desc)
                return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- KEYBINDS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            vim.keymap.set("n", "l",  edit_or_open,                   opts("Edit or open"))
            vim.keymap.set("n", "h",  api.node.navigate.parent_close, opts("Close"))
            vim.keymap.set("n", "H",  api.tree.collapse_all,          opts("Collapse all"))
            vim.keymap.set("n", "r",  api.fs.rename_basename,         opts("Rename base name"))
            vim.keymap.set("n", "e",  api.fs.rename,                  opts("Rename"))
            vim.keymap.set("n", "a",  api.fs.create,                  opts("Create new file or directory"))
            vim.keymap.set("n", "d",  api.fs.remove,                  opts("Remove file or directory"))
            vim.keymap.set("n", "g?", api.tree.toggle_help,           opts("Remove file or directory"))
        end

        -- Auto close
        vim.api.nvim_create_autocmd("BufEnter", {
            group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
            pattern = "NvimTree_*",
            callback = function()
                local layout = vim.api.nvim_call_function("winlayout", {})
                if type(layout[2]) ~= "number" then return end
                local second_win = vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype")
                local third_win_exists = layout[3] == nil
                if layout[1] == "leaf" and second_win == "NvimTree" and third_win_exists then
                    vim.cmd("confirm quit")
                end
            end
        })

        nvtree.setup {
            filters = { custom = { "^.git$" } },
            on_attach = on_attach,
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
