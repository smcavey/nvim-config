return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Neotree",
    keys = {
      {
        "<leader>e",
        "<cmd>Neotree toggle<cr>",
        desc = "Toggle file explorer",
      },
      {
        "<leader>E",
        "<cmd>Neotree reveal<cr>",
        desc = "Reveal current file",
      },
    },
    opts = {
      close_if_last_window = true,
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
      },
      window = {
        width = 35,
      },
    },
  },
}
