local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local conf = require("telescope.config").values
local X = {}

function X.SessionPicker(opts)
  local results = vim.fn.systemlist("fd --base-directory " .. vim.fn.stdpath("config") .. "/tmp/dir_session/")
  pickers.new(
    opts,
    {
      prompt_title = "Custom Picker",
      finder = finders.new_table(results),
      sorter = conf.file_sorter(opts),
      attach_mappings = function(prompt_bufnr)
        actions.goto_file_selection_edit:replace(
          function()
            local entry = actions.get_selected_entry()
            actions.close(prompt_bufnr)
            vim.cmd("so " .. vim.fn.stdpath("config") .. "/tmp/dir_session/" .. entry.value)
          end
        )
        return true
      end
    }
  ):find()
end

return X
