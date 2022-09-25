local Hydra = require 'hydra'
local cmd = require('hydra.keymap-util').cmd
local jester = require 'jester'
local dap = require 'dap'

local telescope_hint = [[

  Telescope

  _f_: files            _m_: marks               ^
  _o_: old files        _g_: live grep
  _/_: search in file   _n_: npm scripts
  _j_: jump list        _b_: buffers

  _r_: resume
  _h_: vim help         _c_: execute command
  _k_: keymaps          _;_: commands history 
  _O_: options          _?_: search history

  _<Enter>_: Telescope           _<Esc>_

]]

local hint_config = {
  position = 'middle',
  border = 'rounded',
}

Hydra {
  name = 'Telescope',
  hint = telescope_hint,
  config = {
    color = 'teal',
    invoke_on_body = true,
    hint = hint_config,
  },
  mode = 'n',
  body = '<Leader>f',
  heads = {
    { 'f', cmd 'Telescope find_files', { desc = 'find files' } },
    {
      'g',
      function()
        require('telescope').extensions.live_grep_args.live_grep_args()
      end,
      { desc = 'Live grep with args' },
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

local jester_hint = [[

  Jester

  _r_: Run file          _L_: Run last      ^
  _F_: Run file          _l_: Debug last
  _f_: Debug file        _d_: Debug

  _<Esc>_

]]

Hydra {
  name = 'Jester',
  hint = jester_hint,
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
        jester.run()
      end,
      { desc = 'Run file' },
    },
    {
      'L',
      function()
        jester.run_last()
      end,
      { desc = 'Run last' },
    },
    {
      'F',
      function()
        jester.run_file()
      end,
      { desc = 'Run file' },
    },
    {
      'l',
      function()
        jester.debug_last()
      end,
      { desc = 'Debug last' },
    },
    {
      'f',
      function()
        jester.debug_file()
      end,
      { desc = 'Debug file' },
    },
    {
      'd',
      function()
        jester.debug()
      end,
      { desc = 'Debug' },
    },
    { '<Esc>', nil, { exit = true, nowait = true } },
  },
}

local dap_hint = [[

  Dap

  _c_: Continue             _q_: Terminate      ^
  _b_: Toggle breakpoint    _B_: Log point
  _l_: Debug last

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
    { '<Esc>', nil, { exit = true, nowait = true } },
  },
}
