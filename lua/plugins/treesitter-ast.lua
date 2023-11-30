-- [nfnl] Compiled from fnl/plugins/treesitter-ast.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local ast = autoload("leap-ast")
local function _2_()
  return vim.keymap.set({"n", "x", "o"}, "<M-w>", ast.leap, {noremap = true})
end
return {{"ggandor/leap-ast.nvim", dependencies = {"nvim-treesitter/nvim-treesitter", "ggandor/leap.nvim"}, config = _2_}}
