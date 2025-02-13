-- [nfnl] Compiled from fnl/plugins/gruvbox.fnl by https://github.com/Olical/nfnl, do not edit.
local function setup()
  local theme = require("gruvbox")
  theme.setup({undercurl = true, underline = true, bold = true, italic = {strings = true, operators = true, comments = true}, contrast = "hard", overrides = {}, inverse = false, invert_intend_guides = false, invert_selection = false, invert_signs = false, invert_tabline = false})
  return vim.cmd("colorscheme gruvbox")
end
return {"ellisonleao/gruvbox.nvim", config = setup, priority = 1000}
