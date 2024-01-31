-- [nfnl] Compiled from fnl/plugins/sessions.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local lens = autoload("auto-session.session-lens")
local function _2_()
  return lens.search_session()
end
vim.keymap.set("n", "<C-s>", _2_)
return {{"rmagatti/auto-session", opts = {log_level = "error", auto_session_suppress_dirs = {"~/", "~/Projects", "~/Downloads", "/"}, session_lens = {buftypes_to_ignore = {"nofile", "terminal", "help"}, load_on_setup = true, theme_conf = {border = true}, previewer = false}, auto_session_use_git_branch = false, auto_session_enable_last_session = false}, lazy = false}}
