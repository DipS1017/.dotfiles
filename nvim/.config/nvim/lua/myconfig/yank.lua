local M = {}
-- Highlight on yank
function M.setup_highlight_yank()
	vim.api.nvim_create_autocmd("textyankpost", {
		callback = function()
			vim.highlight.on_yank({
				higroup = "incsearch", -- see `:highlight` for more options
				timeout = 200,
			})
		end,
	})
end

return M
