return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        -- JS/TS/React
        null_ls.builtins.formatting.prettier.with({
          condition = function(utils)
            return utils.root_has_file({
              ".prettierrc",
              ".prettierrc.json",
              "prettier.config.js",
              "package.json",
            })
          end,
        }),
        null_ls.builtins.diagnostics.erb_lint,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.pint,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.google_java_format,
        null_ls.builtins.formatting.sql_formatter.with({ command = { "sleek" } }),
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
