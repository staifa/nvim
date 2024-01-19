-- [nfnl] Compiled from fnl/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local treesitter = autoload("nvim-treesitter.configs")
local ensures = {"bash", "clojure", "dockerfile", "fennel", "html", "java", "groovy", "javascript", "json", "lua", "markdown", "yaml", "sql"}
local function setup()
  return treesitter.setup({highlight = {enable = true}, indent = {enable = true}, matchup = {enable = true}, endwise = {enable = true}, event = {"BufReadPre", "BufNewFile"}, ensure_installed = ensures})
end
return {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", dependencies = {"RRethy/nvim-treesitter-endwise"}, config = setup}}
