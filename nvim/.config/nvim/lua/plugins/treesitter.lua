return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      _G.treesitter_foldtext = function()
        local start_line = vim.fn.getline(vim.v.foldstart)
        local count = vim.v.foldend - vim.v.foldstart + 1
        return string.format("%s  (%d lines)", start_line, count)
      end

      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.opt.foldtext = "v:lua.treesitter_foldtext()"
      vim.opt.foldlevel = 99
      vim.opt.foldcolumn = "0"
    end
  }
}
