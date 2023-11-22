-- [nfnl] Compiled from fnl/settings.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local core = autoload("nfnl.core")
do
  local options = {expandtab = true, tabstop = 2, shiftwidth = 2, softtabstop = 2, mouse = "", diffopt = "vertical", lazyredraw = true, synmaxcol = 128, undodir = (vim.fn.stdpath("config") .. "/.undo"), undofile = true, cmdheight = 0, scrolloff = 15, sidescrolloff = 35, ignorecase = true, hidden = true, smartcase = true, clipboard = "unnamedplus", number = true, ruler = true, signcolumn = "number", swapfile = false, backup = false}
  for option, value in pairs(options) do
    core.assoc(nvim.o, option, value)
  end
end
return {}
