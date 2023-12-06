-- [nfnl] Compiled from fnl/utils/autocommands.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local api = vim.api
local ls = autoload("luasnip")
local parinfer = autoload("parinfer")
local _local_2_ = autoload("utils.common")
local assoc_opts = _local_2_["assoc-opts"]
local function _3_(args)
  if ("help" == args.data.filetype) then
    return assoc_opts(vim.wo, {wrap = true})
  else
    return nil
  end
end
api.nvim_create_autocmd({"User"}, {pattern = "TelescopePreviewerLoaded", callback = _3_})
local function _5_()
  if ls.in_snippet() then
    parinfer["detach-current-buf!"]()
    return vim.diagnostic.disable()
  else
    return nil
  end
end
api.nvim_create_autocmd({"ModeChanged"}, {pattern = "*:s", callback = _5_})
local function _7_()
  if ls.in_snippet() then
    parinfer["attach-current-buf!"]()
    return vim.diagnostic.enable()
  else
    return nil
  end
end
return api.nvim_create_autocmd({"ModeChanged"}, {pattern = "[is]:n", callback = _7_})
