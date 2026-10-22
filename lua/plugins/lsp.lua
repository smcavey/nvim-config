return {
  {
    "neovim/nvim-lspconfig",
    ft = { "go" },
    config = function()
      vim.lsp.config("gopls", {
        filetypes = { "go" },
        settings = {
          gopls = {
            completeUnimported = true,
            gofumpt = true,
            staticcheck = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
              unusedwrite = true,
            },
          },
        },
      })

      vim.lsp.enable("gopls")

      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        virtual_text = true,
      })

      local group = vim.api.nvim_create_augroup("go_lsp", { clear = true })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = group,
        callback = function(event)
          local map = function(keys, action, description)
            vim.keymap.set("n", keys, action, {
              buffer = event.buf,
              desc = "LSP: " .. description,
            })
          end

          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("gr", vim.lsp.buf.references, "List references")
          map("K", vim.lsp.buf.hover, "Hover documentation")
          map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, "Format buffer")

          if vim.bo[event.buf].filetype == "go" then
            vim.api.nvim_clear_autocmds({ group = group, buffer = event.buf })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = group,
              buffer = event.buf,
              callback = function()
                vim.lsp.buf.format({
                  bufnr = event.buf,
                  timeout_ms = 2000,
                  filter = function(client)
                    return client.name == "gopls"
                  end,
                })
              end,
            })
          end
        end,
      })
    end,
  },
}
