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
          filetype == "typescript"
          or filetype == "typescriptreact"
          or filetype == "javascript"
          or filetype == "javascriptreact"
          or filetype == "sql"
          or filetype == "html"
      then
        return
      end
      if client.supports_method("textDocument/formatting") then
        vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
      end
      if client.supports_method("textDocument/codeAction") then
        local function apply_code_action(only)
          vim.lsp.buf.code_action({
            context = {
              only = only,
              diagnostics = vim.diagnostic.get(args.buf) -- Include diagnostics for missing imports
            },
            apply = true,
          })
        end

        -- Add small delays to handle async operations
        vim.defer_fn(function()
          apply_code_action({ "source.fixAll" })
          -- For TypeScript/React, also try adding missing imports
          if filetype:match("typescript") or filetype:match("javascript") then
            apply_code_action({ "source.addMissingImports" })
          end
          vim.defer_fn(function()
            apply_code_action({ "source.organizeImports" })
          end, 100)
        end, 100)
      end
    end,
  })
end
return M
