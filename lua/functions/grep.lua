local G = {}
local loop = vim.loop
local results = {}

local function onread(err, data)
  if err then
    print("ERROR: ", err)
  end
  if data then
    local vals = vim.split(data, "\n")
    for _, d in pairs(vals) do
      if d == "" then
        goto continue
      end
      table.insert(results, d)
      ::continue::
    end
  end
end

local function setQF(searchTerm)
  vim.fn.setqflist({}, "r", {title = "Search Results for " .. searchTerm, lines = results})
  vim.api.nvim_command("cwindow")
  local count = #results
  for i = 0, count do
    results[i] = nil
  end -- clear the table for the next search
end

-- TODO: Exclude logic
-- TODO: Freezes somestimes
function G.Grep(searchTerm)
  local stdout = loop.new_pipe(false)
  local stderr = loop.new_pipe(false)
  handle =
    loop.spawn(
    vim.g.grepprg,
    {
      args = {searchTerm, "--vimgrep"},
      stdio = {stdout, stderr}
    },
    vim.schedule_wrap(
      function()
        stdout:read_stop()
        stderr:read_stop()
        stdout:close()
        stderr:close()
        handle:close()
        setQF(searchTerm)
      end
    )
  )
  loop.read_start(stdout, onread)
  loop.read_start(stderr, onread)
end

return G
