return {

  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup({
      toggler = {
        line = "gcc", -- Line-comment toggle keymap
        block = "gbc", -- Block-comment toggle keymap
      },
      opleader = {
        line = "gc", -- Line-comment keymap for visual mode
        block = "gb", -- Block-comment keymap for visual mode
      },
    })
    -- Key mappings
    vim.keymap.set("n", "gcc", "<Plug>(comment_toggle_linewise_current)", {})
    vim.keymap.set("n", "gbc", "<Plug>(comment_toggle_blockwise_current)", {})
    vim.keymap.set("x", "gc", "<Plug>(comment_toggle_linewise_visual)", {})
    vim.keymap.set("x", "gb", "<Plug>(comment_toggle_blockwise_visual)", {})
  end,
}
