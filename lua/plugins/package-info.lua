-- Show package versions
vim.api.nvim_set_keymap("n", "<space>ns", ":lua require('package-info').show()<CR>", { silent = true, noremap = true })

-- Hide package versions
vim.api.nvim_set_keymap("n", "<space>nc", ":lua require('package-info').hide()<CR>", { silent = true, noremap = true })

-- Update package on line
vim.api.nvim_set_keymap("n", "<space>nu", ":lua require('package-info').update()<CR>", { silent = true, noremap = true })

-- Delete package on line
vim.api.nvim_set_keymap("n", "<space>nd", ":lua require('package-info').delete()<CR>", { silent = true, noremap = true })

-- Install a new package
vim.api.nvim_set_keymap("n", "<space>ni", ":lua require('package-info').install()<CR>", { silent = true, noremap = true })

-- Reinstall dependencies
vim.api.nvim_set_keymap("n", "<space>nr", ":lua require('package-info').reinstall()<CR>", { silent = true, noremap = true })

-- Install a different package version
vim.api.nvim_set_keymap("n", "<space>np", ":lua require('package-info').change_version()<CR>", { silent = true, noremap = true })
