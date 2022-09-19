-- [[ Configure Dap ]]
local dap = require 'dap'
-- Find and set node2 executable
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { os.getenv 'HOME' .. '/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
}
-- read .vscode/launch.json
require('dap.ext.vscode').load_launchjs(nil, { node = { 'javascript', 'javascriptreact', 'typescriptreact', 'typescript' } })

-- Dap load_extension
require('nvim-dap-virtual-text').setup {}
