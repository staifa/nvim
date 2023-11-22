-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
require("config/telescope")
local function setup()
  local telescope = require("telescope")
  local themes = require("telescope.themes")
  local actions = require("telescope.actions")
  telescope.setup({defaults = {file_ignore_patterns = {"node_modules", ".undo"}, mappings = {i = {["<esc>"] = actions.close}}, vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--iglob", "!.git", "--hidden"}}, extensions = {["ui-select"] = {themes.get_dropdown({})}}, pickers = {find_files = {find_command = {"rg", "--files", "--iglob", "!.git", "--hidden"}}}})
  telescope.load_extension("ui-select")
  return telescope.load_extension("lazygit")
end
local function setup_keys()
  local mappings = {f = "find_files", j = "live_grep", b = "buffers", h = "help_tags", s = "resume"}
  local from
  local function _1_(_241)
    return ("<C-" .. _241 .. ">")
  end
  from = _1_
  local to
  local function _2_(_241)
    return ("<cmd>lua require'telescope.builtin'." .. _241 .. "()<CR>")
  end
  to = _2_
  local tbl_17_auto = {}
  local i_18_auto = #tbl_17_auto
  for key, cmd in pairs(mappings) do
    local val_19_auto = {from(key), to(cmd)}
    if (nil ~= val_19_auto) then
      i_18_auto = (i_18_auto + 1)
      do end (tbl_17_auto)[i_18_auto] = val_19_auto
    else
    end
  end
  return tbl_17_auto
end
return {{"nvim-telescope/telescope.nvim", dependencies = {"nvim-telescope/telescope-ui-select.nvim", "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}, keys = setup_keys, config = setup}}
