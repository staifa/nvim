-- [nfnl] Compiled from fnl/plugins/start-screen.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local alpha = autoload("alpha")
local theme = autoload("alpha.themes.startify")
local function _2_()
  return alpha.setup(theme.config)
end
return {{"goolord/alpha-nvim", dependencies = {"nvim-tree/nvim-web-devicons"}, config = _2_, lazy = false}}
