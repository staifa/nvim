-- [nfnl] Compiled from fnl/plugins/theme.fnl by https://github.com/Olical/nfnl, do not edit.
local function setup()
  local theme = require("gruvbox")
  theme.setup({undercurl = true, underline = true, bold = true, italic = {strings = true, operators = true, comments = true}, inverse = true, contrast = "hard", overrides = {}, invert_tabline = false, invert_intend_guides = false, invert_selection = false, invert_signs = false})
  return vim.cmd("colorscheme gruvbox")
end
return {{"ellisonleao/gruvbox.nvim", priority = 1000, config = setup, lazy = false}}
