return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = {
        "ts_ls",
        "tailwindcss",
        "html",
        "lua_ls",
        "eslint",
        "pylsp",
        "gopls",
        "svelte",
        "clangd",
        "intelephense",
        "cssls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Configure servers using the new vim.lsp.config API
      vim.lsp.config.ts_ls = {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          -- Disable formatting from ts_ls (typescript-language-server)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      }

      vim.lsp.config.tailwindcss = {
        capabilities = capabilities,
        root_dir = function(fname)
          local util = require("lspconfig.util")
          return util.root_pattern("tailwind.config.js", "package.json", ".git")(fname)
        end,
      }

      vim.lsp.config.svelte = {
        capabilities = capabilities,
      }

      vim.lsp.config.html = {
        capabilities = capabilities,
      }

      vim.lsp.config.templ = {
        capabilities = capabilities,
      }

      vim.lsp.config.lua_ls = {
        capabilities = capabilities,
      }

      vim.lsp.config.jdtls = {
        capabilities = capabilities,
      }

      vim.lsp.config.intelephense = {
        capabilities = capabilities,
      }

      vim.lsp.config.eslint = {
        capabilities = capabilities,
      }

      vim.lsp.config.clangd = {
        capabilities = capabilities,
      }

      vim.lsp.config.pylsp = {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                enable = false,
                ignore = { 'E501', 'E231' },
                maxLineLength = 88,
              },
            },
          },
        },
      }

      vim.lsp.config.gopls = {
        capabilities = capabilities,
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            gofumpt = true,
            staticcheck = true,
            analyses = {
              unusedparams = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      }

      vim.lsp.config.cssls = {
        capabilities = capabilities,
        cmd = { "vscode-css-language-server", "--stdio" },
        filetypes = { "css", "scss", "less" },
        init_options = { provideFormatter = true },
        root_dir = function(fname)
          local util = require("lspconfig.util")
          return util.root_pattern("package.json", ".git")(fname)
        end,
        single_file_support = true,
        settings = {
          css = { validate = true },
          scss = { validate = true },
          less = { validate = true },
        },
      }

      -- Enable all configured servers
      local servers = { "ts_ls", "tailwindcss", "svelte", "html", "templ", "lua_ls", "jdtls", "intelephense", "eslint",
        "pylsp", "gopls", "cssls" }
      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end

      -- Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      -- Show diagnostics in a floating window
      vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float, { desc = "Show diagnostics" })
    end,
  },
}
