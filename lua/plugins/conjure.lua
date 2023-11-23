-- [nfnl] Compiled from fnl/plugins/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local conjure = autoload("conjure.main")
local mapping = autoload("conjure.mapping")
local _local_2_ = autoload("utils.common")
local assoc_opts = _local_2_["assoc-opts"]
local function setup(_, _opts)
  conjure.main()
  return mapping["on-filetype"]()
end
local options = {["conjure#log#jump_to_latest#enabled"] = true, ["conjure#highlight#enabled"] = true}
return {{"Olical/conjure", ft = {"clojure", "fennel", "lua"}, config = setup, init = assoc_opts(vim.g, options)}}
