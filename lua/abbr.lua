local A = require "utils/general"

-- General
A.SetupCommandAbbr("w", "update")
A.SetupCommandAbbr("nw", "noautocmd update")

-- Buffer list
A.SetupCommandAbbr("lv", "ls<space>t<CR>:vert<space>sb")
A.SetupCommandAbbr("lt", "ls<space>t<CR>:tab<space>sb")
A.SetupCommandAbbr("ld", "ls<space>t<CR>:bd")
A.SetupCommandAbbr("br", "bp<bar>bd#")

-- Git
A.SetupCommandAbbr("gf", "Git fetch --all")
A.SetupCommandAbbr("gp", [[split \| term git push]])
A.SetupCommandAbbr("gl", "Git pull")
A.SetupCommandAbbr("gm", "Git mergetool")

-- Diff
A.SetupCommandAbbr("do", "DiffviewOpen")
A.SetupCommandAbbr("df", "DiffviewFocusFiles")
A.SetupCommandAbbr("dc", "DiffviewClose")
