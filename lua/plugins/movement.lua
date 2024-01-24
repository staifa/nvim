-- [nfnl] Compiled from fnl/plugins/movement.fnl by https://github.com/Olical/nfnl, do not edit.
local function setup()
  local _let_1_ = require("leap")
  local leap = _let_1_["leap"]
  local function _2_()
    return leap({backward = true})
  end
  vim.keymap.set({"n", "x", "o"}, "F", _2_)
  local function _3_()
    return leap({})
  end
  return vim.keymap.set({"n", "x", "o"}, "f", _3_)
end
return {{"ggandor/leap.nvim", dependencies = {"tpope/vim-repeat"}, config = setup}}
