return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(buffer)
        local gitsigns = require("gitsigns")
        local map = function(keys, action, description)
          vim.keymap.set("n", keys, action, {
            buffer = buffer,
            desc = "Git: " .. description,
          })
        end

        map("]h", function()
          gitsigns.nav_hunk("next")
        end, "Next hunk")
        map("[h", function()
          gitsigns.nav_hunk("prev")
        end, "Previous hunk")
        map("<leader>hp", gitsigns.preview_hunk, "Preview hunk")
        map("<leader>hb", function()
          gitsigns.blame_line({ full = true })
        end, "Blame line")
      end,
    },
  },
}
