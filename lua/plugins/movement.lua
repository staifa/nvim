-- [nfnl] Compiled from fnl/plugins/movement.fnl by https://github.com/Olical/nfnl, do not edit.
local function setup()
  local l = require("leap")
  l.add_default_mappings()
  vim.keymap.del({"x", "o"}, "x")
  return vim.keymap.del({"x", "o"}, "X")
end
return {{"ggandor/leap.nvim", dependencies = {"tpope/vim-repeat"}, config = setup}}
