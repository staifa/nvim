-- [nfnl] Compiled from fnl/settings.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local _local_2_ = autoload("utils.common")
local assoc_opts = _local_2_["assoc-opts"]
local options = {autowriteall = true, expandtab = true, tabstop = 2, shiftwidth = 2, softtabstop = 2, smarttab = true, ai = true, si = true, wrap = true, mouse = "", diffopt = "vertical", lazyredraw = true, synmaxcol = 128, undodir = (vim.fn.stdpath("config") .. "/.undo"), undofile = true, cmdheight = 0, scrolloff = 15, sidescrolloff = 35, ignorecase = true, hidden = true, smartcase = true, clipboard = "unnamedplus", number = true, ruler = true, showtabline = 0, signcolumn = "number", swapfile = false, backup = false}
assoc_opts(vim.o, options)
return {}
