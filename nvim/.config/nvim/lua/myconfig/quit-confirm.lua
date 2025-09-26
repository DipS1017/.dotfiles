local M = {}

local function confirm_quit_all()
  local buffers = vim.api.nvim_list_bufs()
  local unsaved = {}

  -- Collect all modified, listed buffers
  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_get_option(buf, "buflisted") and vim.api.nvim_buf_get_option(buf, "modified") then
      local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
      table.insert(unsaved, name)
    end
  end

  if #unsaved == 0 then
    vim.cmd("qa") -- no unsaved buffers, safe to quit
    return
  end

  -- Build prompt message
  local msg = "The following buffers have unsaved changes:\n"
  msg = msg .. table.concat(unsaved, "\n")
  msg = msg .. "\nWhat do you want to do?"

  -- Use vim.fn.confirm with hotkeys
  local choice = vim.fn.confirm(
    msg,
    "&Save All\n&Discard All\n&Cancel",
    3 -- default to Cancel
  )

  if choice == 1 then
    -- Save all modified buffers
    for _, buf in ipairs(buffers) do
      if vim.api.nvim_buf_get_option(buf, "buflisted") and vim.api.nvim_buf_get_option(buf, "modified") then
        vim.api.nvim_buf_call(buf, function()
          vim.cmd("write")
        end)
      end
    end
    vim.cmd("qa")
  elseif choice == 2 then
    -- Quit all ignoring changes
    vim.cmd("qa!")
  else
    -- Cancel or Esc, do nothing
    return
  end
end

vim.keymap.set("n", "<leader>q", confirm_quit_all, { desc = "Quit all with save/discard prompt" })

return M
