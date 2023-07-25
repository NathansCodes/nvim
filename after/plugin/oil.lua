local oil = require("oil")

oil.setup {
    columns = {
        "icon"
    },
    keymaps = {
        ["<C-l>"] = "actions.select",
        ["<C-h>"] = "actions.parent",
        ["<C-p>"] = "actions.preview",
        ["cd"]    = "actions.cd",
        ["."]     = "actions.toggle_hidden",
        ["g?"]    = "actions.show_help",
    },
    float = {
        border = "rounded",
    },
}
