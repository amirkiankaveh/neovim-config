return {
  "neovim/nvim-lspconfig",
  dependencies = {},
  opts = {
    servers = {
      -- pyright = {},
      pylsp = {
        mason = false,
        settings = {
          pylsp = {
            plugins = {
              rope_autoimport = {
                enabled = true,
              },
            },
          },
        },
      },
      -- ruff_lsp = {
      --   -- handlers = {
      --   --   ["textDocument/publishDiagnostics"] = function() end,
      --   -- },
      -- },
      jedi_language_server = {},
    },
    setup = {
      pylsp = function()
        LazyVim.lsp.on_attach(function(client, _)
          if client.name == "pylsp" then
            -- disable hover in favor of jedi-language-server
            client.server_capabilities.hoverProvider = false
          end
        end)
      end,
      -- ruff_lsp = function()
      --   require("lazyvim.util").lsp.on_attach(function(client, _)
      --     if client.name == "ruff_lsp" then
      --       -- Disable hover in favor of Pyright
      --       client.server_capabilities.hoverProvider = false
      --     end
      --   end)
      -- end,
      pyright = function()
        require("lazyvim.util").lsp.on_attach(function(client, _)
          if client.name == "pyright" then
            -- disable hover in favor of jedi-language-server
            client.server_capabilities.hoverProvider = false
          end
        end)
      end,
    },
  },
}
