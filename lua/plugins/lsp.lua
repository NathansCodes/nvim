return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
        config = function()
            local lsp_zero = require('lsp-zero')

            lsp_zero.on_attach(function(_, bufnr)
                local opts = {buffer = bufnr, remap = true}

                lsp_zero.default_keymaps()

                local vdiag = vim.diagnostic
                local vlbuf = vim.lsp.buf
                vim.keymap.set("n", "[d",        vdiag.goto_next,        opts)
                vim.keymap.set("n", "]d",        vdiag.goto_prev,        opts)
                vim.keymap.set("n", "L",         vdiag.open_float,       opts)
                vim.keymap.set("n", "K",         vlbuf.hover,            opts)
                vim.keymap.set("n", "<leader>w", vlbuf.workspace_symbol, opts)
                vim.keymap.set("n", "<leader>a", vlbuf.code_action,      opts)
                vim.keymap.set("n", "<leader>r", vlbuf.references,       opts)
                vim.keymap.set("n", "<leader>n", vlbuf.rename,           opts)
                vim.keymap.set("i", "<C-h>",     vlbuf.signature_help,   opts)

                vim.lsp.codelens.refresh()
            end)

            -- disable sign icons
            lsp_zero.set_sign_icons {
                error = '',
                warn = '',
                hint = '',
                info = ''
            }

            require('mason').setup {}
            require('mason-lspconfig').setup {
                ensure_installed = {'lua_ls', 'rust_analyzer'},
                handlers = {
                    lsp_zero.default_setup,
                    rust_analyzer = lsp_zero.noop,
                }
            }

            local cmp = require('cmp')
            local cmp_format = require('lsp-zero').cmp_format()
            local cmp_select = { behaviour = cmp.SelectBehavior.Select }

            cmp.setup({
                formatting = cmp_format,
                mapping = cmp.mapping.preset.insert({
                    -- scroll up and down the documentation window
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-g>"] = cmp.mapping.complete(),
                }),
            })
        end,
    },
    -- rofi config highlighting
    {
        "Fymyte/rasi.vim",
        ft = "rasi",
        dependencies = {
            "ap/vim-css-color"
        },
    },
}
