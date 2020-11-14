-- LSP

local K = require "utils/general"

-- Load plugins
vim.cmd("packadd! nvim-lspconfig")

-- Desc: only applies to buffers with lsp on.
local custom_attach = function(_, bufnr)
  -- Set omnifunc
  vim.api.nvim_buf_set_option(bufnr or 0, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings
  K.Key_mapper("n", ",j", "<cmd>lua vim.lsp.buf.definition()<CR>", true)
  K.Key_mapper("n", ",vj", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", true)
  K.Key_mapper("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", true)
  K.Key_mapper("n", ",i", "<cmd>lua vim.lsp.buf.implementation()<CR>", true)
  K.Key_mapper("i", "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", true)
  K.Key_mapper("n", ",t", "<cmd>lua vim.lsp.buf.type_definition()<CR>", true)
  K.Key_mapper("n", ",r", "<cmd>lua vim.lsp.buf.references()<CR>", true)
  K.Key_mapper("n", ",w", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", true)
  K.Key_mapper("n", ",W", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", true)
  K.Key_mapper("n", ",d", "<cmd>lua vim.lsp.buf.declaration()<CR>", true)

  K.Key_mapper("n", ",f", "<cmd>Format<CR>", true)
  K.Key_mapper("n", ",a", "<cmd>lua vim.lsp.buf.code_action()<CR>", true)
  K.Key_mapper("n", ",R", "<cmd>lua vim.lsp.buf.rename()<CR>", true)
  K.Key_mapper("n", ",e", "<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>", true)

  K.Key_mapper("n", ",s", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", true)
end

local nvim_lsp = require "nvim_lsp"

nvim_lsp.sumneko_lua.setup {
  on_attach = custom_attach,
  settings = {
    Lua = {
      runtime = {version = "LuaJIT", path = vim.split(package.path, ";")},
      completion = {keywordSnippet = "Disable"},
      diagnostics = {
        enable = true,
        globals = {
          "vim",
          "describe",
          "it",
          "before_each",
          "after_each"
        }
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
        }
      }
    }
  }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,

    -- Enable virtual text, override spacing to 4
    -- virtual_text = {
    --   spacing = 4,
    --   prefix = '~',
    -- },

    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    signs = function(bufnr, client_id)
      local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
      -- No buffer local variable set, so just enable by default
      if not ok then
        return true
      end

      return result
    end,

    -- Disable a feature
    update_in_insert = false,
  }
)

local servers = {"cssls", "bashls", "html", "tsserver", "jsonls", "vimls", "dartls"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = custom_attach
  }
end
