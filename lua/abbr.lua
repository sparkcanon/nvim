local A = require "utils/general"

-- General
A.SetupCommandAbbr("w", "update")
A.SetupCommandAbbr("sov", "source $MYVIMRC")
A.SetupCommandAbbr("nw", "noautocmd update")
A.SetupCommandAbbr("ngw", "noautocmd Gw")

-- Buffer list
A.SetupCommandAbbr("lv", "ls<space>t<CR>:vert<space>sb")
A.SetupCommandAbbr("lt", "ls<space>t<CR>:tab<space>sb")
A.SetupCommandAbbr("ld", "ls<space>t<CR>:bd")
A.SetupCommandAbbr("bD", "bp<bar>bd#")

-- Session
A.SetupCommandAbbr("so", "so " .. vim.fn.expand("$HOME") .. "/.config/nvim/tmp/dir_session/")
A.SetupCommandAbbr("sa", "SessionSave")

-- Grep
A.SetupCommandAbbr("sr", "Grep")
A.SetupCommandAbbr("sb", "GrepBuffer")
A.SetupCommandAbbr("se", "GrepExact")
A.SetupCommandAbbr("st", "GrepExclude")
A.SetupCommandAbbr("fd", "FdFiles")

-- Git
A.SetupCommandAbbr("gf", "Git fetch --all")
A.SetupCommandAbbr("gp", "split term://git push")
A.SetupCommandAbbr("gl", "Git pull")
A.SetupCommandAbbr("gd", "Git difftool")
A.SetupCommandAbbr("gm", "Git mergetool")
