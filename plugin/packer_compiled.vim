" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/Users/praborde/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/praborde/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/praborde/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/praborde/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/praborde/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["CommandlineComplete.vim"] = {
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/CommandlineComplete.vim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/diffview.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/editorconfig-vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/friendly-snippets"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nó\1\0\0\3\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0Llet g:indent_blankline_filetype_exclude = ['TelescopePrompt', 'packer']\bcmd\b‚îÇ\26indent_blankline_char\6g\bvim\0" },
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp-trouble.nvim"] = {
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/lsp-trouble.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nè\3\0\0\a\0\23\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\16\0005\5\r\0005\6\14\0=\6\15\5>\5\1\4=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\3=\3\22\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\0\rfiletype\fsources\1\2\0\0\rnvim_lsp\1\2\0\0\16diagnostics\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\3\ntheme\17iceberg_dark\25component_separators\5\23section_separators\5\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/lualine.nvim"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "\27LJ\2\n]\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\17integrations\1\0\0\1\0\1\rdiffview\2\nsetup\vneogit\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/praborde/.config/nvim/pack/packer/opt/neogit"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/nvim-bqf"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n˚\1\0\0\4\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\ats\1\0\1\vrgb_fn\2\btsx\1\0\1\vrgb_fn\2\bjsx\1\0\1\vrgb_fn\2\ajs\1\0\1\vrgb_fn\2\tjson\1\0\1\vrgb_fn\2\tscss\1\0\1\vrgb_fn\2\tsass\1\0\1\vrgb_fn\2\tless\1\0\1\vrgb_fn\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\nØ\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\6\vbuffer\2\rnvim_lua\2\nvsnip\2\tpath\2\rnvim_lsp\2\tcalc\2\1\0\f\15min_length\3\1\17autocomplete\2\fenabled\2\19max_abbr_width\3d\18documentation\2\19max_menu_width\3d\19max_kind_width\3d\ndebug\1\21incomplete_delay\3ê\3\19source_timeout\3»\1\18throttle_time\3P\14preselect\venable\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/nvim-web-devicons"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/popup.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/vim-commentary"
  },
  ["vim-dirvish"] = {
    config = { "\27LJ\2\n`\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0K\0\1\0\19:sort ,^.*[/],\17dirvish_mode\23loaded_netrwPlugin\6g\bvim\0" },
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/vim-dirvish"
  },
  ["vim-eunuch"] = {
    commands = { "Move", "Rename", "Delete", "Remove" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/praborde/.config/nvim/pack/packer/opt/vim-eunuch"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\n§\1\0\0\4\0\t\1\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0006\1\0\0009\1\5\0019\1\6\1'\3\a\0B\1\2\2=\1\4\0006\0\0\0009\0\1\0*\1\0\0=\1\b\0K\0\1\0\20floaterm_height\r&columns\teval\afn\19floaterm_width\vbottom\22floaterm_position\6g\bvimÁÃô≥\6≥ÊÃ˛\3\0" },
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\n.\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0\17fugitive_pty\6g\bvim\0" },
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/vim-fugitive"
  },
  ["vim-jsdoc"] = {
    commands = { "JsDoc" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/praborde/.config/nvim/pack/packer/opt/vim-jsdoc"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/vim-repeat"
  },
  ["vim-substrata"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/praborde/.config/nvim/pack/packer/opt/vim-substrata"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/praborde/.config/nvim/pack/packer/start/vim-vsnip"
  }
}

time("Defining packer_plugins", false)
-- Config for: vim-floaterm
time("Config for vim-floaterm", true)
try_loadstring("\27LJ\2\n§\1\0\0\4\0\t\1\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0006\1\0\0009\1\5\0019\1\6\1'\3\a\0B\1\2\2=\1\4\0006\0\0\0009\0\1\0*\1\0\0=\1\b\0K\0\1\0\20floaterm_height\r&columns\teval\afn\19floaterm_width\vbottom\22floaterm_position\6g\bvimÁÃô≥\6≥ÊÃ˛\3\0", "config", "vim-floaterm")
time("Config for vim-floaterm", false)
-- Config for: lualine.nvim
time("Config for lualine.nvim", true)
try_loadstring("\27LJ\2\nè\3\0\0\a\0\23\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\16\0005\5\r\0005\6\14\0=\6\15\5>\5\1\4=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\3=\3\22\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\0\rfiletype\fsources\1\2\0\0\rnvim_lsp\1\2\0\0\16diagnostics\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\3\ntheme\17iceberg_dark\25component_separators\5\23section_separators\5\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time("Config for lualine.nvim", false)
-- Config for: indent-blankline.nvim
time("Config for indent-blankline.nvim", true)
try_loadstring("\27LJ\2\nó\1\0\0\3\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0Llet g:indent_blankline_filetype_exclude = ['TelescopePrompt', 'packer']\bcmd\b‚îÇ\26indent_blankline_char\6g\bvim\0", "config", "indent-blankline.nvim")
time("Config for indent-blankline.nvim", false)
-- Config for: nvim-colorizer.lua
time("Config for nvim-colorizer.lua", true)
try_loadstring("\27LJ\2\n˚\1\0\0\4\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\ats\1\0\1\vrgb_fn\2\btsx\1\0\1\vrgb_fn\2\bjsx\1\0\1\vrgb_fn\2\ajs\1\0\1\vrgb_fn\2\tjson\1\0\1\vrgb_fn\2\tscss\1\0\1\vrgb_fn\2\tsass\1\0\1\vrgb_fn\2\tless\1\0\1\vrgb_fn\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time("Config for nvim-colorizer.lua", false)
-- Config for: vim-dirvish
time("Config for vim-dirvish", true)
try_loadstring("\27LJ\2\n`\0\0\2\0\5\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0K\0\1\0\19:sort ,^.*[/],\17dirvish_mode\23loaded_netrwPlugin\6g\bvim\0", "config", "vim-dirvish")
time("Config for vim-dirvish", false)
-- Config for: vim-fugitive
time("Config for vim-fugitive", true)
try_loadstring("\27LJ\2\n.\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0\17fugitive_pty\6g\bvim\0", "config", "vim-fugitive")
time("Config for vim-fugitive", false)
-- Config for: nvim-compe
time("Config for nvim-compe", true)
try_loadstring("\27LJ\2\nØ\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\6\vbuffer\2\rnvim_lua\2\nvsnip\2\tpath\2\rnvim_lsp\2\tcalc\2\1\0\f\15min_length\3\1\17autocomplete\2\fenabled\2\19max_abbr_width\3d\18documentation\2\19max_menu_width\3d\19max_kind_width\3d\ndebug\1\21incomplete_delay\3ê\3\19source_timeout\3»\1\18throttle_time\3P\14preselect\venable\nsetup\ncompe\frequire\0", "config", "nvim-compe")
time("Config for nvim-compe", false)

-- Command lazy-loads
time("Defining lazy-load commands", true)
vim.cmd [[command! -nargs=* -range -bang -complete=file Rename lua require("packer.load")({'vim-eunuch'}, { cmd = "Rename", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Delete lua require("packer.load")({'vim-eunuch'}, { cmd = "Delete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Remove lua require("packer.load")({'vim-eunuch'}, { cmd = "Remove", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file JsDoc lua require("packer.load")({'vim-jsdoc'}, { cmd = "JsDoc", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Move lua require("packer.load")({'vim-eunuch'}, { cmd = "Move", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time("Defining lazy-load commands", false)

if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
