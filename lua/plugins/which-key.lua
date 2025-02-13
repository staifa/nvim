-- [nfnl] Compiled from fnl/plugins/which-key.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local wk = require("which-key")
  return wk.add({{"<localleader>a", group = "AI"}, {"<localleader>b", group = "Buffer"}, {"<localleader>f", group = "Find"}, {"<localleader>l", group = "LSP"}, {"<localleader>la", group = "LSP actions"}, {"<localleader>g", group = "Git"}, {"<localleader>s", group = "Search"}, {"<localleader>n", group = "Notifications"}, {"<localleader>t", group = "Toggle"}})
end
return {"folke/which-key.nvim", config = _1_, event = "VeryLazy"}
