-- [nfnl] Compiled from fnl/plugins/theme.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local theme = autoload("gruvbox")
local function setup()
  return theme.setup({undercurl = true, underline = true, bold = true, italic = {strings = true, operators = true, comments = true}, inverse = true, contrast = "hard", overrides = {}, invert_signs = false, invert_intend_guides = false, invert_tabline = false, invert_selection = false}, vim.cmd("colorscheme gruvbox"))
end
return {{"ellisonleao/gruvbox.nvim", priority = 1000, config = setup, lazy = false}}
