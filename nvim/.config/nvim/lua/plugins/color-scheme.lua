--[[ return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "dark",     -- you can keep your preferred style

        transparent = true, -- disable transparency
        terminal_colors = true, -- ensure terminal colors are used
        styles = {
          sidebars = "dark", -- adjust other styles as needed
          floats = "dark",
        },
      })
      vim.cmd("colorscheme tokyonight-night")
    end,
  },
} ]]

return {
  "EdenEast/nightfox.nvim",
  config = function()
    require("nightfox").setup({
      options = {
        transparent = true, -- Disable background color
        terminal_colors = true, -- Enable terminal colors
      },
    })
    vim.cmd("colorscheme duskfox") -- Set the colorscheme
  end,
}

--[[ return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("solarized-osaka").setup({})
      vim.cmd("colorscheme solarized-osaka")
    end,
  },
} ]]

--[[ return {
  "rebelot/kanagawa.nvim",
  config = function()
    require("kanagawa").setup({
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentstyle = { italic = true },
        functionstyle = {},
        keywordstyle = { italic = true },
        statementstyle = { bold = true },
        typestyle = {},
        transparent = true, -- do not set background color
        diminactive = false, -- dim inactive window `:h hl-normalnc`
        terminalcolors = true, -- define vim.g.terminal_color_{0,17}
        colors = {         -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = { ui = { bg_gutter = "none" } } },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "dragon", -- load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus",
        },
      }),
    })
    -- setup must be called before loading
    vim.cmd("colorscheme kanagawa")
  end,
} ]]

--[[ return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				-- term_colors = true,
				integrations = {
					-- add integrations for plugins if needed
				},
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
--]]
--[[ return {
  "navarasu/onedark.nvim",
  config = function()
    -- lua
    require("onedark").setup({
      -- main options --
      style = "cool",            -- default theme style. choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      transparent = true,        -- show/hide background
      term_colors = true,        -- change terminal color as per the selected theme style
      ending_tildes = false,     -- show the end-of-buffer tildes. by default they are hidden
      cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

      -- toggle theme style ---
      toggle_style_key = nil,                                                           -- keybind to toggle theme style. leave it nil to disable it, or set it to a string, for example "<leader>ts"
      toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- list of styles to toggle between

      -- change code style ---
      -- options are italic, bold, underline, none
      -- you can configure multiple style with comma separated, for e.g., keywords = 'italic,bold'
      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },

      -- lualine options --
      lualine = {
        transparent = false, -- lualine center bar transparency
      },

      -- custom highlights --
      colors = {},  -- override default colors
      highlights = {}, -- override highlight groups

      -- plugins config --
      diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    })
    vim.cmd.colorscheme("onedark")
  end,
} ]]
--[[ return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      -- optionally configure the colorscheme with italics enabled for certain syntax groups
      require("rose-pine").setup({
        variant = "main", -- options: 'main', 'moon', 'dawn'
        dark_variant = "main",
        disable_background = true,
        disable_float_background = true,
        highlight_groups = {
          comment = { italic = true },
          string = { italic = true },
          keyword = { italic = true },
          function = { italic = true },
        },
      })
      -- apply the colorscheme
      vim.cmd.colorscheme("rose-pine")
    end,
  },
} ]]
--[[ return {
  {
    "maxmx03/fluoromachine.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local fm = require("fluoromachine")

      fm.setup({
        glow = false,
        theme = "fluoromachine",
        transparent = true,
      })

      vim.cmd.colorscheme("fluoromachine")
    end,
  },
} ]]
