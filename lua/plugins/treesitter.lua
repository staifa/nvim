-- [nfnl] Compiled from fnl/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local treesitter = autoload("nvim-treesitter.configs")
local _local_2_ = autoload("utils.common")
local assoc_opts = _local_2_["assoc-opts"]
local options = {foldexpr = "nvim_treesitter#foldexpr()", foldmethod = "expr", foldenable = false}
local function setup()
  assoc_opts(vim.g, options)
  return treesitter.setup({highlight = {enable = true}, indent = {enable = true}, matchup = {enable = true}, endwise = {enable = true}, event = {"BufReadPre", "BufNewFile"}, ensure_installed = maintained, sync_install = false, additional_vim_regex_highlighting = false})
end
return {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", dependencies = {"RRethy/nvim-treesitter-endwise"}, config = setup}}
