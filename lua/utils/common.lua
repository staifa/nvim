-- [nfnl] Compiled from fnl/utils/common.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local api = vim.api
local core = autoload("nfnl.core")
local function assoc_opts(table, options)
  for option, value in pairs(options) do
    core.assoc(table, option, value)
  end
  return nil
end
local function force_matchparen_refresh()
  pcall(api.nvim_exec_autocmds, "CursorMoved", {group = "matchparen"})
  return pcall(api.nvim_exec_autocmds, "CursorMoved", {group = "matchup_matchparen"})
end
return {["assoc-opts"] = assoc_opts, ["force-matchparen-refresh"] = force_matchparen_refresh}
