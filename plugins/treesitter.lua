return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
    },
    opts = {
      auto_install = true,
      incremental_selection = {
        keymaps = {
          init_selection = false,
        },
      },
      rainbow = {
        disable = { "nix" },
      },
    },
  },
}
