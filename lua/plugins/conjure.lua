-- [nfnl] Compiled from fnl/plugins/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  nvim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
  nvim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
  return nil
end
return {{"Olical/conjure", init = _2_}}
