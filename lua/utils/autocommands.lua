-- [nfnl] Compiled from fnl/utils/autocommands.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local api = vim.api
local ls = autoload("luasnip")
local parinfer = autoload("parinfer")
local function _2_(args)
  if ("help" == args.data.filetype) then
    local key = api.nvim_replace_termcodes("<C-f>", true, false, true)
    return api.nvim_feedkeys(key, "t", false)
  else
    return nil
  end
end
api.nvim_create_autocmd({"User"}, {pattern = "TelescopePreviewerLoaded", callback = _2_})
local function _4_()
  if ls.in_snippet() then
    parinfer["detach-current-buf!"]()
    return vim.diagnostic.disable()
  else
    return nil
  end
end
api.nvim_create_autocmd({"ModeChanged"}, {pattern = "*:s", callback = _4_})
local function _6_()
  if ls.in_snippet() then
    parinfer["attach-current-buf!"]()
    return vim.diagnostic.enable()
  else
    return nil
  end
end
return api.nvim_create_autocmd({"ModeChanged"}, {pattern = "[is]:n", callback = _6_})
