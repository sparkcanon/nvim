local Hydra = require 'hydra'
local cmd = require('hydra.keymap-util').cmd
local neotest = require 'neotest'
local dap = require 'dap'

-- [[ Telescope hydra ]]
local search_hint = [[

  Search

  _f_: files            _m_: marks               ^
  _o_: old files        _g_: live grep
  _/_: in file          _n_: npm scripts
  _d_: grep in dir      _b_: buffers

  _r_: resume           _j_: jump list
  _h_: vim help         _c_: execute command
  _k_: keymaps          _;_: commands history 
  _O_: options          _?_: search history

  _<Enter>_: Telescope           _<Esc>_

]]

local hint_config = {
  position = 'middle',
  border = 'rounded',
}

local telescope_live_grep_in_path = function(path)
  local _path = path or vim.fn.input('Dir: ', '', 'dir')
  require('telescope.builtin').live_grep { search_dirs = { _path } }
end

Hydra {
  name = 'Search',
  hint = search_hint,
  config = {
    color = 'teal',
    invoke_on_body = true,
    hint = hint_config,
  },
  mode = 'n',
  body = '<Leader>s',
  heads = {
    { 'f', cmd 'Telescope find_files', { desc = 'find files' } },
    { 'g', cmd 'Telescope live_grep', { desc = 'Live grep' } },
    {
      'd',
      function()
        telescope_live_grep_in_path()
      end,
      { desc = 'Live grep in directory' },
    },
    { 'o', cmd 'Telescope oldfiles', { desc = 'recently opened files' } },
    { 'h', cmd 'Telescope help_tags', { desc = 'vim help' } },
    { 'm', cmd 'Telescope marks', { desc = 'marks' } },
    { 'k', cmd 'Telescope keymaps', { desc = 'kep mappings' } },
    { 'O', cmd 'Telescope vim_options', { desc = 'vim options' } },
    { 'r', cmd 'Telescope resume', { desc = 'Resume telescope' } },
    { 'b', cmd 'Telescope buffers', { desc = 'buffers' } },
    { 'j', cmd 'Telescope jumplist', { desc = 'jump list' } },
    {
      '/',
      function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,
      { desc = 'search in file' },
    },
    { '?', cmd 'Telescope search_history', { desc = 'search history' } },
    { ';', cmd 'Telescope command_history', { desc = 'command-line history' } },
    { 'c', cmd 'Telescope commands', { desc = 'execute command' } },
    { 'n', cmd 'Telescope npm scripts', { desc = 'npm scripts' } },
    { '<Enter>', cmd 'Telescope', { exit = true, desc = 'list all pickers' } },
    { '<Esc>', nil, { exit = true, nowait = true } },
  },
}

-- [[ Test hydra ]]
local test_hint = [[

  Test

  _r_: Run nearest       _f_: Current file          ^
  _d_: Debug nearest     _D_: Debug current file
  _l_: Debug last        _L_: Run last


  _q_: Quit test         _o_: Output

  _<Esc>_

]]

Hydra {
  name = 'Test',
  hint = test_hint,
  config = {
    color = 'teal',
    invoke_on_body = true,
    hint = hint_config,
  },
  mode = 'n',
  body = '<Leader>t',
  heads = {
    {
      'r',
      function()
        neotest.run.run()
      end,
      { desc = 'Run nearest' },
    },
    {
      'f',
      function()
        neotest.run.run(vim.fn.expand '%')
      end,
      { desc = 'Current file' },
    },
    {
      'd',
      function()
        neotest.run.run { strategy = 'dap' }
      end,
      { desc = 'Debug nearest' },
    },
    {
      'D',
      function()
        neotest.run.run { vim.fn.expand '%', strategy = 'dap' }
      end,
      { desc = 'Debug current file' },
    },
    {
      'o',
      function()
        neotest.output.open { enter = true }
      end,
      { desc = 'Show output' },
    },
    {
      'L',
      function()
        neotest.run.run_last()
      end,
      { desc = 'Run last' },
    },
    {
      'l',
      function()
        neotest.run.run_last { strategy = 'dap' }
      end,
      { desc = 'Debug last' },
    },
    {
      'q',
      function()
        neotest.run.stop()
      end,
      { desc = 'Quit test' },
    },
    { '<Esc>', nil, { exit = true, nowait = true } },
  },
}

-- [[ Dap hydra ]]
local dap_hint = [[

  Dap

  _c_: Continue             _q_: Terminate      ^
  _b_: Toggle breakpoint    _B_: Log point
  _l_: Debug last

  _f_: Frames               _v_: variables
  _h_: Commands             _s_: list breakpoints
  _C_: Configuration

  _o_: Step over            _O_: Step out
  _i_: step into            _r_: repl

  _<Esc>_

]]

Hydra {
  name = 'Dap',
  hint = dap_hint,
  config = {
    color = 'teal',
    invoke_on_body = true,
    hint = hint_config,
  },
  mode = 'n',
  body = '<Leader>d',
  heads = {
    {
      'c',
      function()
        dap.continue()
      end,
      { desc = 'Dap continue' },
    },
    {
      'b',
      function()
        dap.toggle_breakpoint()
      end,
      { desc = 'Toggle breakpoint' },
    },
    {
      'q',
      function()
        dap.terminate()
      end,
      { desc = 'Terminate' },
    },
    {
      'B',
      function()
        dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
      end,
      { desc = 'Log point' },
    },
    {
      'l',
      function()
        dap.run_last()
      end,
      { desc = 'Run last' },
    },
    {
      'o',
      function()
        dap.step_over()
      end,
      { desc = 'Step over' },
    },
    {
      'O',
      function()
        dap.step_out()
      end,
      { desc = 'Step out' },
    },
    {
      'i',
      function()
        dap.step_into()
      end,
      { desc = 'Step into' },
    },
    {
      'r',
      function()
        dap.repl.open()
      end,
      { desc = 'Step over' },
    },
    { 'f', cmd 'Telescope dap frames', { desc = 'list frames' } },
    { 'v', cmd 'Telescope dap variables', { desc = 'list variables' } },
    { 'h', cmd 'Telescope dap commands', { desc = 'list commands' } },
    { 's', cmd 'Telescope dap list_breakpoints', { desc = 'list breakpoints' } },
    { 'C', cmd 'Telescope dap configurations', { desc = 'list configurations' } },
    { '<Esc>', nil, { exit = true, nowait = true } },
  },
}

-- gitsigns
local git_hint = [[

  Git

  _g_: lazygit
  _s_: stage hunk        _S_: stage buffer      ^
  _r_: reset hunk        _R_: reset buffer
  _u_: Undo stage hunk   _p_: preview hunk

  _b_: blame full        _B_: toggle line blame
  _d_: toggle deleted

  _<Esc>_

]]

Hydra {
  name = 'GitSigns',
  hint = git_hint,
  config = {
    color = 'teal',
    invoke_on_body = true,
    hint = hint_config,
  },
  mode = { 'n', 'v' },
  body = '<Leader>g',
  heads = {
    { 'g', cmd 'Spawn lazygit', { desc = 'lazygit' } },
    { 's', cmd 'Gitsigns stage_hunk', { desc = 'Stage hunk' } },
    { 'S', cmd 'Gitsigns stage_buffer', { desc = 'Stage buffer' } },
    { 'r', cmd 'Gitsigns reset_hunk', { desc = 'Reset hunk' } },
    { 'R', cmd 'Gitsigns reset_buffer', { desc = 'Reset buffer' } },
    { 'u', cmd 'Gitsigns under_stage_hunk', { desc = 'Undo stage hunk' } },
    { 'p', cmd 'Gitsigns preview_hunk', { desc = 'Preview hunk' } },
    {
      'B',
      function()
        require('gitsigns').blame_line { full = true }
      end,
      { desc = 'Blame full' },
    },
    { 'b', cmd 'Gitsigns toggle_current_line_blame', { desc = 'Toggle line blame' } },
    { 'd', cmd 'Gitsigns toggle_deleted', { desc = 'Toggle deleted' } },
    { '<Esc>', nil, { exit = true, nowait = true } },
  },
}
