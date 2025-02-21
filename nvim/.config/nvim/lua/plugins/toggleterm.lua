return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 30,            -- size of the terminal
        open_mapping = [[<c-\>]], -- key to toggle the terminal
        direction = "float",  -- open terminal in floating window
        float_opts = {
          border = "rounded", -- border style for the floating window
        },
      })
    end,
  },
}
