-- Handle diagnostic configuration
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    -- Enable underline
    underline = true,
    -- Enable virtual text
    virtual_text = true,
    -- Disable on insert
    update_in_insert = false,
    signs = true
  }
)

-- Snippet Support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits"
  }
}

-- Peek definition
local function preview_location_callback(_, method, result)
  if result == nil or vim.tbl_isempty(result) then
    vim.lsp.log.info(method, "No location found")
    return nil
  end
  if vim.tbl_islist(result) then
    vim.lsp.util.preview_location(result[1])
  else
    vim.lsp.util.preview_location(result)
  end
end

function Peek_definition()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, "textDocument/definition", params, preview_location_callback)
end

require "lsp/lua"
require "lsp/css"
require "lsp/ts"
require "lsp/html"
require "lsp/bash"
require "lsp/json"
require "lsp/vim"
require "lsp/dart"
require "lsp/vue"
require "lsp/stylelint"
require "lsp/diagnostics/init"
