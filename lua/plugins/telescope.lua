-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local telescope = autoload("telescope")
local themes = autoload("telescope.themes")
local actions = autoload("telescope.actions")
local builtin = autoload("telescope.builtin")
local function setup()
  telescope.setup({defaults = {file_ignore_patterns = {"node_modules", ".undo"}, layout_config = {horizontal = {width = 0.8, preview_width = 0.5}}, mappings = {i = {["<esc>"] = actions.close}}, vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--iglob", "!.git", "--hidden"}}}, "extensions", {["ui-select"] = {themes.get_dropdown({})}, fzf = {fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case"}}, "pickers", {find_files = {find_command = {"rg", "--files", "--iglob", "!.git", "--hidden"}}})
  telescope.load_extension("fzf")
  telescope.load_extension("lazy")
  telescope.load_extension("ui-select")
  telescope.load_extension("session-lens")
  return telescope.load_extension("lazygit")
end
local function setup_keys()
  local mappings = {n = builtin.find_files, j = builtin.live_grep, b = builtin.buffers, h = builtin.help_tags, r = builtin.registers, c = builtin.resume}
  local from
  local function _2_(_241)
    return ("<M-" .. _241 .. ">")
  end
  from = _2_
  local tbl_21_auto = {}
  local i_22_auto = 0
  for key, cmd in pairs(mappings) do
    local val_23_auto = {from(key), cmd}
    if (nil ~= val_23_auto) then
      i_22_auto = (i_22_auto + 1)
      tbl_21_auto[i_22_auto] = val_23_auto
    else
    end
  end
  return tbl_21_auto
end
local function _4_(_, opts)
  telescope.setup(opts)
  return telescope.load_extension("undo")
end
local function _5_(_, opts)
  telescope.setup(opts)
  return telescope.load_extension("file_browser")
end
return {{"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim", "nvim-lua/popup.nvim", "tsakirist/telescope-lazy.nvim", "nvim-telescope/telescope-ui-select.nvim", "debugloop/telescope-undo.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}}, keys = setup_keys, config = setup}, {"debugloop/telescope-undo.nvim", dependencies = {{"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"}}}, keys = {{"<M-u>", "<cmd>Telescope undo<cr>", {desc = "undo history"}}}, config = _4_}, {"nvim-telescope/telescope-file-browser.nvim", dependencies = {{"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"}}}, keys = {{"<M-d>", ":Telescope file_browser<cr>", {desc = "file browser", noremap = true}}}, config = _5_}}
