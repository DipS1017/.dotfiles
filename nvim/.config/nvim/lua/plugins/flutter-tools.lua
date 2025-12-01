return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim',       -- optional for vim.ui.select
  },
  config = function()
    require("flutter-tools").setup({
      -- Your desired configuration options
      -- e.g., enable color highlighting, autostart devtools
      lsp = {
        color = {
          enabled = true,
        },
      },
      dev_tools = {
        autostart = true,
        auto_open_browser = true,
      },
    })
  end,
}
