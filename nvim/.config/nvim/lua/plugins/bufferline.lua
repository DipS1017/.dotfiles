return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- Required for file icons
		},
		keys = {
			{ "<S-L>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-H>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
			{ "<Leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", desc = "Go to tab 1" },
			{ "<Leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", desc = "Go to tab 2" },
			{ "<Leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", desc = "Go to tab 3" },
			{ "<Leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", desc = "Go to tab 4" },
			{ "<Leader>bn", "<Cmd>tabnew<CR>", desc = "Open new tab" }, -- Open new tab
{ "<Leader>bd", "<Cmd>bdelete<CR>", desc = "Close current buffer" },
		},
		opts = {
			options = {
				mode = "buffer", -- Use tabs mode
				show_buffer_close_icons = true, -- Hide buffer close icons
				show_close_icon = true, -- Hide the close icon
				always_show_bufferline = true, -- Always show the bufferline
			},
		},
	},
}
