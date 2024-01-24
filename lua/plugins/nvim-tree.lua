-- [nfnl] Compiled from fnl/plugins/nvim-tree.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return vim.cmd("NvimTreeToggle")
end
return {{"nvim-tree/nvim-tree.lua", dependencies = {"nvim-web-devicons"}, opts = {update_focused_file = {enable = true, update_cwd = true}}, keys = {{"<F2>", _1_}}}}
