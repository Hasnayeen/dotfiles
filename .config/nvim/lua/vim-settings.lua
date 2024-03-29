vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set termguicolors")

vim.o.cursorline = true
vim.o.cursorlineopt = 'both'
vim.cmd("highlight CursorLine cterm=bold ctermfg=white")

vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    command = "set number norelativenumber"
})
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    command = "set relativenumber"
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "help" then
            vim.cmd("wincmd L")
        end
    end
})

vim.g.mapleader = " "

vim.opt.clipboard = "unnamed,unnamedplus"

