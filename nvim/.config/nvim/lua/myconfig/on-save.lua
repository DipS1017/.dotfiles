local M = {}

M.on_attach = function(args)
  local client = vim.lsp.get_client_by_id(args.data.client_id)
  if not client then
    return
  end

  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = args.buf,
    callback = function()
      local filetype = vim.bo.filetype
      if
      --[[ 	filetype == "typescript"
				or filetype == "typescriptreact"
				or filetype == "javascript"
				or filetype == "javascriptreact" ]]
          filetype == "sql"
      then
        return
      end
      if client.supports_method("textDocument/formatting") then
        vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
      end

      if client.supports_method("textDocument/codeAction") then
        local function apply_code_action(only)
          local actions = vim.lsp.buf.code_action({
            ---@diagnostic disable-next-line
            context = { only = only },
            apply = true,
            return_actions = true,
          })
          -- only apply if code action is available
          if actions and #actions > 0 then
            ---@diagnostic disable-next-line
            vim.lsp.buf.code_action({ context = { only = only }, apply = true })
          end
        end
        apply_code_action({ "source.fixAll" })
        apply_code_action({ "source.organizeImports" })
      end
    end,
  })
end

return M
