-- [nfnl] fnl/plugins/gitsigns.fnl
local function _1_(_, opts)
  local gitsigns = require("gitsigns")
  local function _2_(bufnr)
    local gs = package.loaded.gitsigns
    local map
    local function _3_(mode, lhs, rhs, desc)
      return vim.keymap.set(mode, lhs, rhs, {desc = desc, noremap = true, silent = true, buffer = bufnr})
    end
    map = _3_
    local function _4_()
      if vim.wo.diff then
        return "]c"
      else
        return vim.schedule(gs.next_hunk)
      end
    end
    map("n", "]c", _4_, "Next hunk")
    local function _6_()
      if vim.wo.diff then
        return "[c"
      else
        return vim.schedule(gs.prev_hunk)
      end
    end
    map("n", "[c", _6_, "Previous hunk")
    map("n", "<localleader>gp", gs.preview_hunk, "Preview hunk")
    map("n", "<localleader>gs", gs.stage_hunk, "Stage hunk")
    map("n", "<localleader>gr", gs.reset_hunk, "Reset hunk")
    map("n", "<localleader>gu", gs.undo_stage_hunk, "Undo stage hunk")
    map("n", "<localleader>gb", gs.blame_line, "Blame line")
    map("n", "<localleader>gd", gs.diffthis, "Diff this")
    local function _8_()
      return gs.diffthis("~")
    end
    return map("n", "<localleader>gD", _8_, "Diff against previous")
  end
  return gitsigns.setup(vim.tbl_deep_extend("force", opts, {on_attach = _2_}))
end
return {"lewis6991/gitsigns.nvim", config = _1_, event = "VeryLazy", opts = {numhl = true, linehl = false, signcolumn = false}}
