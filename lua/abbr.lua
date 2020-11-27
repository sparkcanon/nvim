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
A.SetupCommandAbbr("br", "bp<bar>bd#")

-- Session
A.SetupCommandAbbr("sl", "SessionLoad")
A.SetupCommandAbbr("sa", "SessionSave")

-- Grep
A.SetupCommandAbbr("sr", "Grep")

-- Git
A.SetupCommandAbbr("gf", "Git fetch --all")
A.SetupCommandAbbr("gp", [[split \| term git push]])
A.SetupCommandAbbr("gl", "Git pull")
A.SetupCommandAbbr("gd", "Git difftool")
A.SetupCommandAbbr("gm", "Git mergetool")
