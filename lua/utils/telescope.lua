local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local action_set = require("telescope.actions.set")
local fn = vim.fn
local X = {}

function X.SessionPicker(opts)
  local results = fn.systemlist("fd --base-directory " .. fn.stdpath("config") .. "/tmp/dir_session/")
  pickers.new(
    opts,
    {
      prompt_title = "Custom Picker",
      finder = finders.new_table(results),
      sorter = sorters.fuzzy_with_index_bias(),
      attach_mappings = function(prompt_bufnr)
        action_set.select:replace(
          function(prompt_bufnr, type)
            local entry = actions.get_selected_entry()
            actions.close(prompt_bufnr)
            vim.cmd("so " .. fn.stdpath("config") .. "/tmp/dir_session/" .. entry.value)
            -- Code here
          end
        )
        return true
      end
    }
  ):find()
end

return X
