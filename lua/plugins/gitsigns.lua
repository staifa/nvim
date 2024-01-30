-- [nfnl] Compiled from fnl/plugins/gitsigns.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local gs = autoload("gitsigns")
local function on_attach_fn(bufnr)
  local mappings
  local function _2_()
    return gs.blame_line({full = true})
  end
  local function _3_()
    return gs.diffthis("~")
  end
  mappings = {{"n", "p", gs.preview_hunk}, {"n", "b", _2_}, {"n", "s", gs.stage_hunk}, {"v", "s", gs.stage_hunk}, {"n", "S", gs.stage_buffer}, {"n", "u", gs.undo_stage_hunk}, {"n", "r", gs.reset_hunk}, {"v", "r", gs.reset_hunk}, {"n", "d", _3_}, {"n", "R", gs.reset_buffer}}
  local from
  local function _4_(_241)
    return ("<leader>g" .. _241)
  end
  from = _4_
  for _, _5_ in ipairs(mappings) do
    local _each_6_ = _5_
    local mode = _each_6_[1]
    local key = _each_6_[2]
    local to = _each_6_[3]
    vim.keymap.set(mode, from(key), to, {noremap = true, buffer = bufnr})
  end
  return nil
end
return {{"lewis6991/gitsigns.nvim", event = {"BufReadPre", "BufNewFile"}, opts = {on_attach = on_attach_fn}}}
