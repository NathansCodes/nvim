local dap, dapui = require('dap'), require("dapui")


dapui.setup()

vim.keymap.set("n", "<leader>db", function() dapui.toggle() end)

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = 'C:/Users/Nathan/AppData/Local/nvim-data/site/pack/packer/start/vimspector/gadgets/windows/download/CodeLLDB/v1.9.0/root/extension/adapter/codelldb.exe',
        args = {"--port", "${port}"},
    }
}

dap.configurations.rust = { {
    name = "Rust debug",
    type = "codelldb",
    request = "launch",
    showDisassembly = "never",
    program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
}
