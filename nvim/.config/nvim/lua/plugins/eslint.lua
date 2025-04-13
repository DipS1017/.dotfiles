return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {
        cmd = { "vscode-eslint-language-server", "--stdio" },
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "vue",
          "svelte",
          "astro",
        },
        settings = {
          validate = "on",
          useESLintClass = true,
          experimental = {
            useFlatConfig = false,
          },
          codeAction = {
            disableRuleComment = {
              enable = true,
              location = "separateLine",
            },
            showDocumentation = {
              enable = true,
            },
          },
          codeActionOnSave = {
            mode = "all",
          },
          format = false,
          quiet = false,
          onIgnoredFiles = "off",
          options = {},
          rulesCustomizations = {},
          run = "onType",
          problems = {
            shortenToSingleLine = false,
          },
          workingDirectory = {
            mode = "location",
          },
        },
      },
    },
  },
}
