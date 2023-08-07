-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- icons
    use("nvim-tree/nvim-web-devicons")

    -- colors
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })
    use("xiyaowong/nvim-transparent")
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground', {run = ':TSUpdate'})
    use('nvim-treesitter/nvim-treesitter-context')

    -- for easy switching between files
    use('theprimeagen/harpoon')

    -- undotree
    use('mbbill/undotree')

    -- for practice
    use('theprimeagen/vim-be-good')

    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }
    use('neovim/nvim-lspconfig')

    -- manage lang servers, debug adapters, etc.
    use {
        "williamboman/mason.nvim",
        run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    }

    -- Autocompletion
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('saadparwaiz1/cmp_luasnip')
    use('hrsh7th/cmp-nvim-lua')

    -- Snippets
    use('L3MON4D3/LuaSnip')
    use('rafamadriz/friendly-snippets')

    -- debugging
    use('nvim-lua/plenary.nvim')
    use('mfussenegger/nvim-dap')
    use('rcarriga/nvim-dap-ui')
    use('theHamsta/nvim-dap-virtual-text')
    use('nvim-telescope/telescope-dap.nvim')
    use{'puremourning/vimspector', run = 'python3 install_gadget.py --all'}

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} },
    }

    -- awesome plugins for rust
    use('simrat39/rust-tools.nvim')
    use {
        'saecki/crates.nvim',
        tag = 'v0.3.0',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    }

    -- git integration
    use('tpope/vim-fugitive')

    -- beautification
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- navigation with tmux
    use({
        'christoomey/vim-tmux-navigator',
        lazy = false,
    })

    -- git signs
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release', -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    use {
        "startup-nvim/startup.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
        config = function()
            require"startup".setup()
        end
    }

    use("tpope/vim-surround")

    -- notification beautification
    use("rcarriga/nvim-notify")

    -- noice
    use("MunifTanjim/nui.nvim")
    use {
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
        }
    }

    -- easily view errors
    use {
        "folke/trouble.nvim",
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            icons = true,
        },
    }

    -- comments, todos and notes
    use {
        "folke/todo-comments.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    }

    -- better file tree
    use("stevearc/oil.nvim")

    -- COLORS!!!
    use("ap/vim-css-color")

    -- rofi config highlighting
    use {
        "Fymyte/rasi.vim",
        ft = "rasi",
        requires = {
            "ap/vim-css-color"
        },
    }
end)

