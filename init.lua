-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = 'z'
vim.g.maplocalleader = 'c'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath
  })
end

vim.opt.rtp:prepend(lazypath)
vim.loader.enable()

require("lazy").setup({
  { "Olical/nfnl",
    ft = "fennel",
    dependencies = { "norcalli/nvim.lua" } },
  { import = "plugins" }
})

require("settings")
require("mappings")
require("utils.autocommands")
