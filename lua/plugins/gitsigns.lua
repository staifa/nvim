-- [nfnl] Compiled from fnl/plugins/gitsigns.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function on_attach_fn(bufnr)
  local gs = require("gitsigns")
  local mappings = {{"n", "p", "preview_hunk()"}, {"n", "b", "blame_line{full=true}"}, {"n", "s", "stage_hunk()"}, {"v", "s", "stage_hunk()"}, {"n", "S", "stage_buffer()"}, {"n", "u", "undo_stage_hunk()"}, {"n", "r", "reset_hunk()"}, {"v", "r", "reset_hunk()"}, {"n", "d", "diffthis('~')"}, {"n", "R", "reset_buffer()"}}
  local cmd
  local function _2_(_241)
    return ("<cmd>lua require'gitsigns'." .. _241 .. "<CR>")
  end
  cmd = _2_
  local from
  local function _3_(_241)
    return ("<leader>g" .. _241)
  end
  from = _3_
  for _, _4_ in ipairs(mappings) do
    local _each_5_ = _4_
    local mode = _each_5_[1]
    local key = _each_5_[2]
    local to = _each_5_[3]
    nvim.buf_set_keymap(bufnr, mode, from(key), cmd(to), {noremap = true})
  end
  return nil
end
return {{"lewis6991/gitsigns.nvim", opts = {on_attach = on_attach_fn}}}
