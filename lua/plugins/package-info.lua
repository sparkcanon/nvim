local map = require("utils/general").map
local opt = { silent = true, noremap = true }

require('package-info').setup()

-- Show package versions
map("n", "<space>ps", ":lua require('package-info').show()<CR>", opt)

-- Hide package versions
map("n", "<space>ph", ":lua require('package-info').hide()<CR>", opt)

-- Update package on line
map("n", "<space>pu", ":lua require('package-info').update()<CR>", opt)

-- Delete package on line
map("n", "<space>pd", ":lua require('package-info').delete()<CR>", opt)

-- Install a new package
map("n", "<space>pi", ":lua require('package-info').install()<CR>", opt)

-- Reinstall dependencies
map("n", "<space>pr", ":lua require('package-info').reinstall()<CR>", opt)

-- Install a different package version
map("n", "<space>pp", ":lua require('package-info').change_version()<CR>", opt)
