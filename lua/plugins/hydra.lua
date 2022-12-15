local Hydra = require 'hydra'
local cmd = require('hydra.keymap-util').cmd
local neotest = require 'neotest'
local dap = require 'dap'
local gitsigns = require 'gitsigns'

-- [[ Telescope hydra ]]
local search_hint = [[
  _f_: files        _m_: marks              _d_: grep in dir          _n_: npm scripts ^
  _o_: old files    _b_: buffers            _g_: live grep            _e_: diagnostics
  _/_: in file      _q_: quickfix           ^ ^                       _s_: document symbol
  ^ ^               _j_: jump list          ^ ^                       _G_: git branches
  ^ ^               
  _r_: resume       _k_: keymaps            _;_: commands history 
  _h_: vim help     _c_: execute command    _?_: search history
  _O_: options      

  _<Enter>_: Telescope           _<Esc>_: Cancel
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
    { 'e', cmd 'Telescope diagnostics', { desc = 'diagnostics' } },
    { 's', cmd 'Telescope lsp_document_symbols', { desc = 'document symbol' } },
    { 'G', cmd 'Telescope git_branches', { desc = 'git branches' } },
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
    { 'q', cmd 'Telescope quickfix', { desc = 'search quickfix list' } },
    { '<Enter>', cmd 'Telescope', { exit = true, desc = 'list all pickers' } },
    { '<Esc>', nil, { exit = true, nowait = true } },
  },
}

-- [[ Test hydra ]]
local test_hint = [[
  _r_: Run nearest       _d_: Debug nearest      _]_: next failed test   ^
  _R_: Run file          _D_: Debug file         _[_: prev failed test
  ^ ^
  ^
  _l_: Debug last        _s_: summary toggle
  _L_: Run last          _o_: Output long   
  ^ ^                    _O_: Output short
  ^
  ^
  _q_: Terminate test    _<Esc>_: Cancel
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
  body = ',t',
  heads = {
    {
      'r',
      function()
        neotest.run.run()
      end,
      { desc = 'Run nearest' },
    },
    {
      'R',
      function()
        neotest.run.run(vim.fn.expand '%')
      end,
      { desc = 'Run file' },
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
      { desc = 'Debug file' },
    },
    {
      'o',
      function()
        neotest.output.open { enter = true }
      end,
      { desc = 'Show long output' },
    },
    {
      'O',
      function()
        neotest.output.open { enter = true, short = true }
      end,
      { desc = 'Show short output' },
    },
    {
      's',
      function()
        neotest.summary.toggle()
      end,
      { desc = 'Summary toggle' },
    },
    {
      ']',
      function()
        neotest.jump.next { status = 'failed' }
      end,
      { desc = 'Next failed test' },
    },
    {
      '[',
      function()
        neotest.jump.prev { status = 'failed' }
      end,
      { desc = 'Prev failed test' },
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
  _c_: Continue          _b_: Toggle breakpoint         _f_: Frames              _C_: Configuration  ^
  _o_: Step over         _B_: Log point                 _v_: variables           _h_: Commands     
  _i_: step into         _D_: Delete all breakpoints    _s_: list breakpoints
  _O_: Step out          ^ ^                            
  ^ ^                    ^ ^                            
  _l_: Debug last        _q_: Terminate                 _r_: repl

  _<Esc>_
]]

Hydra {
  name = 'Dap',
  hint = dap_hint,
  config = {
    color = 'pink',
    invoke_on_body = true,
    hint = {
      border = 'rounded',
    },
  },
  mode = 'n',
  body = ',d',
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
    {
      'D',
      function()
        dap.clear_breakpoints()
      end,
      { desc = 'Delete all breakpoints' },
    },
    { 'f', cmd 'Telescope dap frames', { desc = 'list frames' } },
    { 'v', cmd 'Telescope dap variables', { desc = 'list variables' } },
    { 'h', cmd 'Telescope dap commands', { desc = 'list commands' } },
    { 's', cmd 'Telescope dap list_breakpoints', { desc = 'list breakpoints' } },
    { 'C', cmd 'Telescope dap configurations', { desc = 'list configurations' } },
    { '<Esc>', nil, { exit = true, nowait = true } },
  },
}

-- [[ gitsigns ]]
local git_hint = [[
 _J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
 _K_: prev hunk   _u_: undo last stage   _p_: preview hunk   _B_: blame show full 
 ^ ^              _S_: stage buffer      _r_: reset hunk     _/_: show base file
 ^
 ^ ^              _<Enter>_: Lazygit              _q_: exit
]]

Hydra {
  name = 'Git',
  hint = git_hint,
  config = {
    buffer = bufnr,
    color = 'pink',
    invoke_on_body = true,
    hint = {
      border = 'rounded',
    },
    on_enter = function()
      vim.cmd 'mkview'
      vim.cmd 'silent! %foldopen!'
      vim.bo.modifiable = false
      gitsigns.toggle_signs(true)
      gitsigns.toggle_linehl(true)
      gitsigns.toggle_numhl(false)
    end,
    on_exit = function()
      local cursor_pos = vim.api.nvim_win_get_cursor(0)
      vim.cmd 'loadview'
      vim.api.nvim_win_set_cursor(0, cursor_pos)
      vim.cmd 'normal zv'
      gitsigns.toggle_signs(false)
      gitsigns.toggle_linehl(false)
      gitsigns.toggle_numhl(true)
      gitsigns.toggle_deleted(false)
    end,
  },
  mode = { 'n', 'x' },
  body = ',g',
  heads = {
    {
      'J',
      function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gitsigns.next_hunk()
        end)
        return '<Ignore>'
      end,
      { expr = true, desc = 'next hunk' },
    },
    {
      'K',
      function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          gitsigns.prev_hunk()
        end)
        return '<Ignore>'
      end,
      { expr = true, desc = 'prev hunk' },
    },
    { 's', gitsigns.stage_hunk, { silent = true, desc = 'stage hunk' } },
    { 'u', gitsigns.undo_stage_hunk, { desc = 'undo last stage' } },
    { 'S', gitsigns.stage_buffer, { desc = 'stage buffer' } },
    { 'p', gitsigns.preview_hunk, { desc = 'preview hunk' } },
    { 'd', gitsigns.toggle_deleted, { nowait = true, desc = 'toggle deleted' } },
    { 'b', gitsigns.blame_line, { desc = 'blame' } },
    {
      'r',
      function()
        vim.bo.modifiable = true
        gitsigns.reset_hunk()
        vim.bo.modifiable = false
      end,
      { desc = 'reset hunk' },
    },
    {
      'B',
      function()
        gitsigns.blame_line { full = true }
      end,
      { desc = 'blame show full' },
    },
    { '/', gitsigns.show, { exit = true, desc = 'show base file' } }, -- show the base of the file
    { '<Enter>', '<Cmd>Spawn lazygit<CR>', { exit = true, desc = 'lazygit' } },
    { 'q', nil, { exit = true, nowait = true, desc = 'exit' } },
  },
}
