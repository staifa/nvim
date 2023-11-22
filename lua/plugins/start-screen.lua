-- [nfnl] Compiled from fnl/plugins/start-screen.fnl by https://github.com/Olical/nfnl, do not edit.
local function setup()
  local alpha = require("alpha")
  local theme = require("alpha.themes.startify")
  return alpha.setup(theme.config)
end
return {{"goolord/alpha-nvim", dependencies = {"nvim-tree/nvim-web-devicons"}, config = setup, lazy = false}}
