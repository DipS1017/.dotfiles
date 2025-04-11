local M={}

local function confirm_quit()
	if vim.bo.modified then
		local choice = vim.fn.confirm("you have unsaved changes. do you want to save them?", "&yes\n&no\n&cancel", 2)
		if choice == 1 then
			vim.cmd("wq") -- save and quit
		elseif choice == 2 then
			vim.cmd("q!") -- quit without saving
		end
	else
		vim.cmd("q") -- quit if no changes
	end
end

vim.keymap.set("n", "<leader>q", confirm_quit, { desc = "quit with save prompt" })
