return {
  {
    "ngtuonghy/live-server-nvim",
    event = "VeryLazy",
    build = ":LiveServerInstall", -- Installs the necessary npm packages for the plugin
    config = function()
      require("live-server-nvim").setup({
      })
    end,
  },
}
