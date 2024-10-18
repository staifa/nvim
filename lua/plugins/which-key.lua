-- [nfnl] Compiled from fnl/plugins/which-key.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.o.timeout = true
  vim.o.timeoutlen = 300
  return nil
end
return {"folke/which-key.nvim", init = _1_, opts = {}, keys = {{"<leader><leader>", ":lua require('which-key').show({ global = false })<CR>", {desc = "Buffer Local Keymaps (which-key)"}}}, lazy = false}
