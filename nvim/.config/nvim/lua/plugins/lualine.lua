return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        -- theme = "fluoromachine",
        -- theme = "everforest",
        theme = "base16",
      },
    })
  end,
}
