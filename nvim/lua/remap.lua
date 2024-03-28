vim.g.mapleader = " "
vim.g.mapleaderlocal = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader><leader>nc", ":edit " .. vim.fn.stdpath("config") .. "<CR>")
