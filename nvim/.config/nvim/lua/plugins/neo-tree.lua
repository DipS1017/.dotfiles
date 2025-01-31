
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Key mappings
    vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", {})

    -- Diagnostic Signs Definition
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

    -- Setup NeoTree
    require("neo-tree").setup({
      close_if_last_window = true,  -- Close Neo-tree when the last instance is closed
      popup_border_style = "rounded",  -- Rounded borders for popups
      enable_git_status = true,  -- Enable Git status in the file tree
      enable_diagnostics = true,  -- Enable diagnostics in the file tree
      open_files_do_not_replace_types = { "terminal", "trouble", "qf" },  -- File opening behavior
      sort_case_insensitive = false,  -- Case-sensitive sorting

      default_component_configs = {
        container = {
          enable_character_fade = true,
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "󰜌",
          highlight = "NeoTreeFileIcon",
        },
        modified = {
          symbol = "[+]",
          highlight = "NeoTreeModified",
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
      },
      window = {
        position = "left",  -- Set the position to 'right' to open NeoTree from the right side
      },

      event_handlers = {
        {
          event = "file_opened",
          handler = function(file_path)
            -- Optionally close Neo-tree after opening a file
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },

      mappings = {
        ["A"] = "add_directory",
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["c"] = "copy",
        ["m"] = "move",
        ["q"] = "close_window",
        ["R"] = "refresh",
        ["?"] = "show_help",
        ["<"] = "prev_source",
        [">"] = "next_source",
        ["i"] = "show_file_details",
      },
    })
    
    -- Highlight settings for Neo-tree
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "none" })
  end,
}

