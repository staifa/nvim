-- [nfnl] Compiled from fnl/mappings.fnl by https://github.com/Olical/nfnl, do not edit.
do
  local mappings = {{"<Space>", "i<Space><Esc>", "Space in normal mode"}, {"gn", "<cmd>bn<CR>", "Switch to next buffer"}, {"gp", "<cmd>bp<CR>", "Switch to previous buffer"}, {"gx", "<cmd>bd<CR>", "Close buffer"}, {"gX", "<cmd>%bd|e#|bd#<CR>", "Close all boffers except the current one"}, {"<Backspace>", "<cmd>noh<CR>", "Clear highlights"}, {"to", "<cmd>tabnew<CR>", "Open new tab"}, {"tn", "<cmd>tabnext<CR>", "Next tab"}, {"tp", "<cmd>tabprev<CR>", "Previous tab"}, {"tx", "<cmd>tabclose<CR>", "Close tab"}}
  for _, _1_ in ipairs(mappings) do
    local _each_2_ = _1_
    local from = _each_2_[1]
    local to = _each_2_[2]
    local desc = _each_2_[3]
    vim.api.nvim_set_keymap("n", from, to, {noremap = true, desc = desc})
  end
end
return {}
