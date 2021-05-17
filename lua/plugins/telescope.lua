local actions = require "telescope.actions"
local tele = require "telescope"
-- TODO: How to apply themes globally
tele.setup {
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    prompt_prefix = " - ",
    color_devicons = true,
    file_previewer = require "telescope.previewers".vim_buffer_cat.new,
    grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist
      }
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true
    }
  }
}

tele.load_extension "fzy_native"

local M = {}
M.search_dotfiles = function()
  require "telescope.builtin".find_files(
    {
      prompt_title = "< VimRC >",
      cwd = "$HOME/.config/nvim/"
    }
  )
end

-- map(mode, key, lua function to call)
--
-- good place to look: telescope.actions (init.lua)
-- lua function to call:  (gets bufnr, not necessarily needed)
--   require('telescope.actions.state').get_selected_entry(bufnr)
--   Actions just take the bufnr and give out information
--   require('telescope.actions').close(bufnr)
--
--   check out telescope.actions for _all the available_ supported
--   actions.
--
--   :h telescope.setup ->
--   :h telescope.builtin ->
--   :h telescope.layout ->
--   :h telescope.actions
--

return M
