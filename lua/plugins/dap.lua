return {
    -- debugging
    "nvim-lua/plenary.nvim",
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-telescope/telescope-dap.nvim",
            {"puremourning/vimspector", build = "python3 install_gadget.py --all"},
        },
        config = function()
            local dap, dapui = require('dap'), require("dapui")

            dapui.setup()

            require("nvim-dap-virtual-text").setup{}

            local function open()
                require("nvim-tree.api").tree.close()
                dapui.open()
            end

            local function close()
                dap.terminate()
                dapui.close()
                require("nvim-tree.api").tree.open()
                vim.cmd [[ wincmd l ]]
            end

            vim.keymap.set("n", "<leader>dbc", function()
                dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
            end)
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>dt", dap.run_to_cursor    )
            vim.keymap.set("n", "<leader>ds", dap.step_over        )
            vim.keymap.set("n", "<leader>di", dap.step_into        )
            vim.keymap.set("n", "<leader>do", dap.step_out         )
            vim.keymap.set("n", "<leader>dc", dap.continue         )
            vim.keymap.set("n", "<leader>dq",     close            )

            -- eval var under cursor
            vim.keymap.set("n", "<leader>?", function()
                dapui.eval(nil, { enter = true })
            end)

            dap.listeners.before.attach.dapui_config = open
            dap.listeners.before.launch.dapui_config = open
            dap.listeners.before.event_terminated.dapui_config = close
            dap.listeners.before.event_exited.dapui_config = close
        end,
    },
}
