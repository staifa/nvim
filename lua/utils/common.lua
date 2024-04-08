-- [nfnl] Compiled from fnl/utils/common.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local _local_2_ = autoload("nfnl.core")
local assoc = _local_2_["assoc"]
local merge = _local_2_["merge"]
local function assoc_opts(table, options)
  for option, value in pairs(options) do
    assoc(table, option, value)
  end
  return nil
end
local favorite_langs = {"clojure", "fennel", "lua"}
local function active_langs(...)
  if ... then
    return merge(favorite_langs, ...)
  else
    return favorite_langs
  end
end
return {["assoc-opts"] = assoc_opts, ["active-langs"] = active_langs}
