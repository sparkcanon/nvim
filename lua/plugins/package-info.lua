local opt = { silent = true, noremap = true }
-- Show package versions
vim.api.nvim_set_keymap("n", "<space>ns", ":lua require('package-info').show()<CR>", opt)

-- Hide package versions
vim.api.nvim_set_keymap("n", "<space>nc", ":lua require('package-info').hide()<CR>", opt)

-- Update package on line
vim.api.nvim_set_keymap("n", "<space>nu", ":lua require('package-info').update()<CR>", opt)

-- Delete package on line
vim.api.nvim_set_keymap("n", "<space>nd", ":lua require('package-info').delete()<CR>", opt)

-- Install a new package
vim.api.nvim_set_keymap("n", "<space>ni", ":lua require('package-info').install()<CR>", opt)

-- Reinstall dependencies
vim.api.nvim_set_keymap("n", "<space>nr", ":lua require('package-info').reinstall()<CR>", opt)

-- Install a different package version
vim.api.nvim_set_keymap("n", "<space>np", ":lua require('package-info').change_version()<CR>", opt)
