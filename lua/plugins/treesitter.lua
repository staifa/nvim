-- [nfnl] Compiled from fnl/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local treesitter = autoload("nvim-treesitter.configs")
local _local_2_ = autoload("utils.common")
local assoc_opts = _local_2_["assoc-opts"]
local options = {foldexpr = "nvim_treesitter#foldexpr()", foldmethod = "expr", foldenable = false}
local function setup()
  assoc_opts(vim.g, options)
  return treesitter.setup({highlight = {enable = true}, indent = {enable = true}, matchup = {enable = true}, endwise = {enable = true}, event = {"BufReadPre", "BufNewFile"}, ensure_installed = "all", additional_vim_regex_highlighting = false, sync_install = false})
end
local function _3_()
  return assoc_opts(vim.g, options)
end
local function _4_()
  return treesitter.setup({highlight = {enable = true}, indent = {enable = true}, matchup = {enable = true}, endwise = {enable = true}, event = {"BufReadPre", "BufNewFile"}, ensure_installed = "all", additional_vim_regex_highlighting = false, sync_install = false})
end
return {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", dependencies = {"RRethy/nvim-treesitter-endwise"}, init = _3_, config = _4_}}
