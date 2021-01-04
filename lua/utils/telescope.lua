local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local conf = require("telescope.config").values
local fn = vim.fn
local X = {}

function X.SessionPicker(opts)
  local results = fn.systemlist("fd --base-directory " .. fn.stdpath("config") .. "/tmp/dir_session/")
  pickers.new(
    opts,
    {
      prompt_title = "Session Picker",
      finder = finders.new_table(results),
      sorter = conf.file_sorter(opts),
      attach_mappings = function(prompt_bufnr)
        actions.goto_file_selection_edit:replace(
          function()
            local entry = actions.get_selected_entry()
            actions.close(prompt_bufnr)
            vim.cmd("so " .. fn.stdpath("config") .. "/tmp/dir_session/" .. entry.value)
          end
        )
        return true
      end
    }
  ):find()
end

function X.NpmPicker(opts)
  local results
  if fn.filereadable("./package.json") then
    local root_raw = fn.readfile("./package.json")
    local root_decoded = fn.json_decode(fn.join(root_raw, " "))
    if fn.has_key(root_decoded, "scripts") then
      results = fn.keys(root_decoded.scripts)
    end
  end
  pickers.new(
    opts,
    {
      prompt_title = "NPM Script Picker",
      finder = finders.new_table(results),
      sorter = conf.file_sorter(opts),
      attach_mappings = function(prompt_bufnr)
        actions.goto_file_selection_edit:replace(
          function()
            local entry = actions.get_selected_entry()
            actions.close(prompt_bufnr)
            vim.cmd("vsplit | term npm run " .. entry.value)
          end
        )
        return true
      end
    }
  ):find()
end

function X.JestPicker(opts)
  local handle = io.popen("git rev-parse --show-toplevel")
  local topLevel = handle:read("*a")
  handle:close()
  local isLego = topLevel:match("lego%-web") == "lego-web"
  local results
  if isLego then
    results =
      fn.systemlist(
      [[fd -g {"*.test.*,*-test.*"} -E "*.snap" --base-directory ~/Documents/work_projects/tesco/lego-web/web/]]
    )
  else
    results = fn.systemlist([[fd -g {"*.test.*,*-test.*"} -E "*.snap"]])
  end
  pickers.new(
    opts,
    {
      prompt_title = "Jest Picker",
      finder = finders.new_table(results),
      sorter = conf.file_sorter(opts),
      attach_mappings = function(prompt_bufnr)
        actions.goto_file_selection_edit:replace(
          function()
            local entry = actions.get_selected_entry()
            actions.close(prompt_bufnr)
            if isLego then
              vim.cmd("vsplit | ter cd web/ && npx jest --watch " .. entry.value)
            else
              vim.cmd("vsplit | ter npx jest --watch " .. entry.value)
            end
          end
        )
        return true
      end
    }
  ):find()
end

return X
