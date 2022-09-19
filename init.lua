-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- stylua: ignore start
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'                                                    -- Package manager
  use 'tpope/vim-fugitive'                                                        -- Git commands in nvim
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }       -- Add git related info in the signs columns and popups
  use 'numToStr/Comment.nvim'                                                     -- "gc" to comment visual regions/lines
  use { 'nvim-treesitter/nvim-treesitter', requires = {
    'David-Kunz/markid',
    'nvim-treesitter/nvim-treesitter-context'
  } }                                                                             -- Highlight, edit, and navigate code
  use 'nvim-treesitter/nvim-treesitter-textobjects'                               -- Additional textobjects for treesitter
  use 'neovim/nvim-lspconfig'                                                     -- Collection of configurations for built-in LSP client
  use 'williamboman/mason.nvim'                                                   -- Manage external editor tooling i.e LSP servers
  use 'williamboman/mason-lspconfig.nvim'                                         -- Automatically install language servers to stdpath
  use { 'hrsh7th/nvim-cmp', requires = {
    'hrsh7th/cmp-nvim-lsp',
    'rcarriga/cmp-dap',
    'hrsh7th/cmp-cmdline'
  } }                                                                             -- Autocompletion
  use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }           -- Snippet Engine and Snippet Expansion
  use 'nvim-lualine/lualine.nvim'                                                 -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim'                                       -- Add indentation guides even on blank lines
  use 'tpope/vim-sleuth'                                                          -- Detect tabstop and shiftwidth automatically
  use 'bluz71/vim-moonfly-colors'
  use { 'mfussenegger/nvim-dap', requires = {
    'theHamsta/nvim-dap-virtual-text',
  } }                                                                             -- Debugging
  use 'David-Kunz/jester'                                                         -- Jest (Needs Dap for debugging)
  use 'windwp/nvim-autopairs'                                                     -- Adds matching pair
  use 'windwp/nvim-ts-autotag'                                                    -- Adds closing tags
  use 'tpope/vim-surround'                                                        -- Manipulate surroundings
  use 'tpope/vim-repeat'                                                          -- Repeat things
  use 'christoomey/vim-tmux-navigator'                                            -- Ability to navigate tmux panes
  use { 'ThePrimeagen/harpoon', requires = { 'nvim-lua/plenary.nvim' }}           -- Quick file navigation with marks
  use 'NvChad/nvim-colorizer.lua'                                                 -- Display colours
  use {'kevinhwang91/nvim-bqf',
    requires = {
      { 'junegunn/fzf', run = function()
        vim.fn['fzf#install']()
      end }
    }}                                                                            -- Enhanced quickfix window (Needs FZF for filtering)
  use 'voldikss/vim-floaterm'                                                     -- Create floating terminals
  use { 'jose-elias-alvarez/null-ls.nvim', requires = {                           -- Lsp addon
    'nvim-lua/plenary.nvim'
  }}

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-dap.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'elianiva/telescope-npm.nvim'
    } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }

  if is_bootstrap then
    require('packer').sync()
  end
end)
-- stylua: ignore end

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- [[ Colorscheme ]]
vim.o.termguicolors = true

-- [[ Configure moonfly ]]
vim.g.moonflyCursorColor = true
-- configure moonfly floats for lsp
vim.g.moonflyNormalFloat = true
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'single',
})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
  border = 'single',
})
vim.diagnostic.config { float = { border = 'single' } }

-- window decorations
vim.g.moonflyWinSeparator = 2
vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋' }
vim.cmd [[colorscheme moonfly]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- Command mode mapping
vim.keymap.set({ 'n', 'x' }, ';', ':')

-- Exit terminal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

-- Tabs
vim.keymap.set('n', '<Tab>', 'gt', { desc = 'Tab next' })
vim.keymap.set('n', '<S-Tab>', 'gT', { desc = 'Tab prev' })

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Colorizer ]]
require('colorizer').setup()

-- [[ Configure bqf]]
require('bqf').setup {
  auto_resize_height = true,
}

-- [[ Configure lualine as statusline ]]
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'moonfly',
    component_separators = '│',
    section_separators = '',
  },
}

-- [[ Comment.nvim ]]
require('Comment').setup()

-- [[ Configure autopairs ]]
require('nvim-autopairs').setup()

-- [[ Configure autotag]]
require('nvim-ts-autotag').setup()

-- [[ Configure indent-blankline.nvim ]]
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '│',
  show_trailing_blankline_indent = false,
}

-- [[ Configure Gitsigns ]]
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

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

-- Dap mappings
vim.keymap.set('n', '<leader>C', function()
  require('dap').continue()
end, { silent = true, desc = 'Dap [C]ontinue' })
vim.keymap.set('n', '<leader>so', function()
  require('dap').step_over()
end, { silent = true, desc = 'Dap [S]tep [O]ver' })
vim.keymap.set('n', '<leader>si', function()
  require('dap').step_into()
end, { silent = true, desc = 'Dap [S]tep [I]nto' })
vim.keymap.set('n', '<leader>sO', function()
  require('dap').step_out()
end, { silent = true, desc = 'Dap [S]tep [O]ut' })
vim.keymap.set('n', '<leader>tb', function()
  require('dap').toggle_breakpoint()
end, { silent = true, desc = 'Dap [T]oggle [B]reakpoint' })
vim.keymap.set('n', '<leader>tsb', function()
  require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { silent = true, desc = 'Dap [S]et [C]onditional [B]reakindent' })
vim.keymap.set('n', '<leader>lp', function()
  require('dap').set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
end, { silent = true, desc = 'Dap set [L]og [P]oint' })
vim.keymap.set('n', '<leader>or', function()
  require('dap').repl.open()
end, { silent = true, desc = 'Dap [O]pen [R]epl' })
vim.keymap.set('n', '<leader>rl', function()
  require('dap').run_last()
end, { silent = true, desc = 'Dap [R]un [L]ast' })

-- Dap load_extension
require('nvim-dap-virtual-text').setup {}

-- [[ Jester ]]
vim.keymap.set('n', '<leader>jr', function()
  require('jester').run()
end, { desc = '[J]ester [R]un' })
vim.keymap.set('n', '<leader>jrl', function()
  require('jester').run_last()
end, { desc = '[J]ester [R]un [L]ast' })
vim.keymap.set('n', '<leader>jrf', function()
  require('jester').run_file()
end, { desc = '[J]ester [R]un [F]ile' })
vim.keymap.set('n', '<leader>jdl', function()
  require('jester').debug_last()
end, { desc = '[J]ester [D]ebug [L]ast' })
vim.keymap.set('n', '<leader>jdf', function()
  require('jester').debug_file()
end, { desc = '[J]ester [D]ebug [F]ile' })
vim.keymap.set('n', '<leader>jt', function()
  require('jester').terminate()
end, { desc = '[J]ester [T]erminate' })
vim.keymap.set('n', '<leader>jd', function()
  require('jester').debug()
end, { desc = '[J]ester [D]ebug' })

-- [[ Configure harpoon ]]
require('harpoon').setup()
-- add marks
vim.keymap.set('n', '<leader>mf', function()
  require('harpoon.mark').add_file()
end, { desc = '[M]ark [F]ile' })

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = require('telescope.themes').get_ivy {
    layout_config = {
      height = 0.5,
    },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    prompt_prefix = '◍ ',
    selection_caret = '▶▶',
  },
  extensions = {
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          -- your custom insert mode mappings
        },
        ['n'] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
  pickers = {
    buffers = {
      initial_mode = 'normal',
      sort_mru = true,
      sort_lastused = true,
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'dap')
pcall(require('telescope').load_extension, 'file_browser')
pcall(require('telescope').load_extension, 'harpoon')
pcall(require('telescope').load_extension, 'npm')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sF', ':Telescope file_browser grouped=true path=%:p:h<CR>', { desc = '[S]earch for [F]iles' })
vim.keymap.set('n', '<leader>sm', ':Telescope harpoon marks<CR>', { desc = '[S]earch [M]arks' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'lua', 'typescript', 'css', 'scss', 'javascript', 'tsx', 'json', 'svelte' },

  highlight = { enable = true },
  indent = { enable = true },
  markid = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      -- TODO: I'm not sure for this one.
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to prev error' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next error' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Quick show line error' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open errors in list' })

-- [[ LSP settings ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })
end

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- [[ Configure mason ]]
-- Setup mason so it can manage external tooling
require('mason').setup()

-- [[ Configure LSP servers ]]
-- Enable the following language servers
local servers = { 'tsserver', 'sumneko_lua', 'svelte', 'tailwindcss', 'html', 'cssls', 'cssmodules_ls', 'jsonls' }

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
}

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

-- [[ Configure sumneko_lua lsp]]
require('lspconfig').sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
}

local null_ls = require 'null-ls'
null_ls.setup {
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.code_actions.gitsigns,
  },
}

-- [[ Configure nvim-cmp ]]
local cmp = require 'cmp'
local luasnip = require 'luasnip'

-- Moonfly
local winhighlight = {
  winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel',
}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  enabled = function()
    return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt' or require('cmp_dap').is_dap_buffer()
  end,
  window = { -- Moonfly
    completion = cmp.config.window.bordered(winhighlight),
    documentation = cmp.config.window.bordered(winhighlight),
  },
}

cmp.setup.filetype({ 'dap-repl', 'dapui_watches' }, {
  sources = {
    { name = 'dap' },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
