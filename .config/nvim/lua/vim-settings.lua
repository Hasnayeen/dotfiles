vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")
vim.cmd("set cursorline")
vim.cmd("set relativenumber")

vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    command = "set number norelativenumber"
})
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    command = "set relativenumber"
})

vim.g.mapleader = " "

