local A = require("utils/general")

-- General
A.SetupCommandAbbr("w", "update")
A.SetupCommandAbbr("nw", "noautocmd update")
A.SetupCommandAbbr("sr", "Grep")

-- Buffer list
A.SetupCommandAbbr("lv", "ls<space>t<CR>:vert<space>sb")
A.SetupCommandAbbr("lt", "ls<space>t<CR>:tab<space>sb")
A.SetupCommandAbbr("ld", "ls<space>t<CR>:bd")
A.SetupCommandAbbr("br", "bp<bar>bd#")

-- Git
A.SetupCommandAbbr("gm", "Git mergetool")
A.SetupCommandAbbr("gd", "Git difftool")
A.SetupCommandAbbr("gp", "Gitsigns preview_hunk")
