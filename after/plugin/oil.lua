local oil = require("oil")

oil.setup {
    columns = {
        "icon"
    },
    keymaps = {
        ["<C-y>"] = "actions.select",
        ["<C-b>"] = "actions.parent",
        ["<C-p>"] = "actions.preview",
        ["<C-h>"] = "",
        ["<C-l>"] = "",
        ["cd"]    = "actions.cd",
        ["."]     = "actions.toggle_hidden",
        ["g?"]    = "actions.show_help",
    },
    float = {
        border = "rounded",
    },
}
