--[[ return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "dark", -- You can keep your preferred style

				transparent = true, -- Disable transparency
				terminal_colors = true, -- Ensure terminal colors are used
				styles = {
					sidebars = "dark", -- Adjust other styles as needed
					floats = "dark",
				},
			})
			vim.cmd("colorscheme tokyonight-night")
		end,
	},
} ]]

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

return {
  "rebelot/kanagawa.nvim",
  config = function()
    require("kanagawa").setup({
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {         -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = { ui = { bg_gutter = "none" } } },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus",
        },
      }),
    })
    -- setup must be called before loading
    vim.cmd("colorscheme kanagawa")
  end,
}

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
} ]]
--[[    return {
	"navarasu/onedark.nvim",
	config = function()
		-- Lua
		require("onedark").setup({
			-- Main options --
			style = "cool", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
			transparent = true, -- Show/hide background
			term_colors = true, -- Change terminal color as per the selected theme style
			ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
			cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

			-- toggle theme style ---
			toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
			toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

			-- Change code style ---
			-- Options are italic, bold, underline, none
			-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
			code_style = {
				comments = "italic",
				keywords = "none",
				functions = "none",
				strings = "none",
				variables = "none",
			},

			-- Lualine options --
			lualine = {
				transparent = false, -- lualine center bar transparency
			},

			-- Custom Highlights --
			colors = {}, -- Override default colors
			highlights = {}, -- Override highlight groups

			-- Plugins Config --
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
      -- Optionally configure the colorscheme with italics enabled for certain syntax groups
      require("rose-pine").setup({
        variant = "moon", -- Options: 'main', 'moon', 'dawn'
        dark_variant = "main",
        disable_background = true,
        disable_float_background = true,
        highlight_groups = {
          Comment = { italic = true },
          String = { italic = true },
          Keyword = { italic = true },
          Function = { italic = true },
        },
      })
      -- Apply the colorscheme
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
