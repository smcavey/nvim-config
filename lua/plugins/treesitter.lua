return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- Automatically updates parsers when Treesitter updates
    config = function()
      -- The new method to register core language parsers to install automatically
      require("nvim-treesitter").install({ 
        "go", "gomod", "gowork", "gosum", "lua", "vim" 
      })
      
      -- Enable the advanced syntax highlighting engine globally via an autocommand
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "go", "gomod", "gowork", "gosum", "lua", "vim" },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}

