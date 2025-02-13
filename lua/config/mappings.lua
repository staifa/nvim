-- [nfnl] Compiled from fnl/config/mappings.fnl by https://github.com/Olical/nfnl, do not edit.
do
  local mappings
  local function _1_()
    return vim.cmd("bd")
  end
  local function _2_()
    return vim.cmd("%bd|e#|bd#")
  end
  local function _3_()
    return vim.cmd("noh")
  end
  local function _4_()
    return vim.cmd("tabnew")
  end
  local function _5_()
    return vim.cmd("tabnext")
  end
  local function _6_()
    return vim.cmd("tabprev")
  end
  local function _7_()
    return vim.cmd("tabclose")
  end
  local function _8_()
    return vim.cmd("wqa")
  end
  local function _9_()
    return vim.cmd("q")
  end
  local function _10_()
    return vim.cmd("qa")
  end
  mappings = {{"gx", _1_, "Close buffer"}, {"gX", _2_, "Close all buffers except the current one"}, {"<Backspace>", _3_, "Clear highlights"}, {"<space>", "a<space><Esc>", "Insert space in normal mode"}, {"to", _4_, "Open new tab"}, {"tn", _5_, "Next tab"}, {"tp", _6_, "Previous tab"}, {"tx", _7_, "Close tab"}, {"qw", _8_, "Save all buffers and exit"}, {"qe", _9_, "Close buffer"}, {"qq", _10_, "Exit"}}
  for _, _11_ in ipairs(mappings) do
    local from = _11_[1]
    local to = _11_[2]
    local desc = _11_[3]
    vim.keymap.set("n", from, to, {noremap = true, desc = desc})
  end
end
return vim.keymap.set({"n", "v"}, "<esc>", "<esc>:update<cr>", {noremap = true, silent = true, desc = ""})
