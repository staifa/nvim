-- [nfnl] Compiled from fnl/plugins/git.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return vim.cmd("LazyGit")
end
return {{"kdheepak/lazygit.nvim", dependencies = {"nvim-lua/plenary.nvim"}, keys = {{"<leader>gg", _1_}}}}
