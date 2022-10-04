-- [[ Configure Dap ]]
local dap_vscode_js_status_ok, dap_vscode_js = pcall(require, 'dap-vscode-js')
if not dap_vscode_js_status_ok then
  return
end

dap_vscode_js.setup {
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  debugger_path = '(runtimedir)/mason/packages/js-debug-adapter', -- Path to vscode-js-debug installation.
  debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node' }, -- which adapters to register in nvim-dap
}

-- Dap load_extension
require('nvim-dap-virtual-text').setup {}
