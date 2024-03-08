local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-settings")
require("lazy").setup("plugins")
require("keymaps")

require("user.dump_server")

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.dump = {
  install_info = {
    url = "~/projects/tree-sitter-dump", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    -- branch = "main", -- default branch in case of git repo if different from master
    -- generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    -- requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "dump", -- if filetype does not match the parser name
}
vim.cmd('au BufRead,BufNewFile *.dump set filetype=dump')
