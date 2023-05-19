
require 'nvim-treesitter.install'.compilers = { "gcc" }

require'nvim-treesitter.configs'.setup {

  ensure_installed = { "rust", "c", "cpp", "c_sharp", "lua", "vim" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
