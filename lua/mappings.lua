-- [nfnl] Compiled from fnl/mappings.fnl by https://github.com/Olical/nfnl, do not edit.
do
  local mappings
  local function _1_()
    return vim.cmd("bn")
  end
  local function _2_()
    return vim.cmd("bp")
  end
  local function _3_()
    return vim.cmd("bd")
  end
  local function _4_()
    return vim.cmd("%bd|e#|bd#")
  end
  local function _5_()
    return vim.cmd("noh")
  end
  local function _6_()
    return vim.cmd("tabnew")
  end
  local function _7_()
    return vim.cmd("tabnext")
  end
  local function _8_()
    return vim.cmd("tabprev")
  end
  local function _9_()
    return vim.cmd("tabclose")
  end
  local function _10_()
    return vim.cmd("wqa")
  end
  local function _11_()
    return vim.cmd("q")
  end
  local function _12_()
    return vim.cmd("qa")
  end
  mappings = {{"gn", _1_, "Switch to next buffer"}, {"gp", _2_, "Switch to previous buffer"}, {"gx", _3_, "Close buffer"}, {"gX", _4_, "Close all buffers except the current one"}, {"<Backspace>", _5_, "Clear highlights"}, {"<space>", "a<space><Esc>", "Insert space in normal mode"}, {"to", _6_, "Open new tab"}, {"tn", _7_, "Next tab"}, {"tp", _8_, "Previous tab"}, {"tx", _9_, "Close tab"}, {"qw", _10_, "Save all buffers and exit"}, {"qe", _11_, "Close buffer"}, {"qq", _12_, "Exit"}}
  for _, _13_ in ipairs(mappings) do
    local _each_14_ = _13_
    local from = _each_14_[1]
    local to = _each_14_[2]
    local desc = _each_14_[3]
    vim.keymap.set("n", from, to, {noremap = true, desc = desc})
  end
end
vim.keymap.set({"n", "v", "i"}, "<esc>", "<esc>:update<cr>", {noremap = true, silent = true, desc = ""})
return {}
