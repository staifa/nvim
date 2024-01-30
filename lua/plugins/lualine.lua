-- [nfnl] Compiled from fnl/plugins/lualine.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local _local_2_ = autoload("utils.lsp")
local get_progress_message = _local_2_["get-progress-message"]
local lualine = autoload("lualine")
local function lsp_connection()
  local message = get_progress_message()
  if ((message.status == "begin") or (message.status == "report")) then
    return (message.msg .. " : " .. message.percent .. "%% \239\130\150")
  elseif (message.status == "end") then
    return "\239\131\136"
  else
    return "\239\130\150"
  end
end
local sections = {lualine_a = {"branch"}, lualine_b = {"diff", {"diagnostics", sections = {"error", "warn", "info", "hint"}, sources = {"nvim_lsp"}}}, lualine_c = {{"filename", file_status = true, path = 1, shorting_target = 40, symbols = {modified = " \239\129\177 ", readonly = "[-]", unnamed = "[No Name]"}}}, lualine_d = {}, lualine_w = {}, lualine_x = {lsp_connection, "filetype"}, lualine_y = {"progress"}, lualine_z = {"location"}}
return {{"nvim-lualine/lualine.nvim", opts = {options = {component_separators = {right = "\238\130\178"}, section_separators = {left = "\238\130\176", right = "\238\130\178"}, theme = "gruvbox"}, sections = sections, inactive_sections = sections}, lazy = false}}
