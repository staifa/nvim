-- [nfnl] Compiled from fnl/utils/common.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local core = autoload("nfnl.core")
local function assoc_opts(table, options)
  for option, value in pairs(options) do
    core.assoc(table, option, value)
  end
  return nil
end
return {["assoc-opts"] = assoc_opts}
