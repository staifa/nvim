-- [nfnl] Compiled from fnl/plugins/matchup.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.g.matchup_matchparen_offscreen = {method = "popup"}
  return nil
end
return {{"andymass/vim-matchup", event = "VeryLazy", init = _1_}}
