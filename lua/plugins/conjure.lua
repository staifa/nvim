-- [nfnl] Compiled from fnl/plugins/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local conjure = autoload("conjure.main")
local mapping = autoload("conjure.mapping")
local _local_2_ = autoload("nvim")
local g = _local_2_["g"]
local function setup(_, _opts)
  conjure.main()
  return mapping["on-filetype"]()
end
local function init()
  g["conjure#log#jump_to_latest#enabled"] = true
  g["conjure#highlight#enabled"] = true
  return nil
end
return {{"Olical/conjure", ft = {"clojure", "fennel", "lua"}, config = setup, init = init}}
