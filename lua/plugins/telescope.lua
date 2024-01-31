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
  local mappings = {f = builtin.find_files, j = builtin.live_grep, ["."] = builtin.buffers, h = builtin.help_tags, l = builtin.registers, k = builtin.resume}
  local from
  local function _2_(_241)
    return ("<C-" .. _241 .. ">")
  end
  from = _2_
  local tbl_17_auto = {}
  local i_18_auto = #tbl_17_auto
  for key, cmd in pairs(mappings) do
    local val_19_auto = {from(key), cmd}
    if (nil ~= val_19_auto) then
      i_18_auto = (i_18_auto + 1)
      do end (tbl_17_auto)[i_18_auto] = val_19_auto
    else
    end
  end
  return tbl_17_auto
end
local function _4_(_, opts)
  telescope.setup(opts)
  return telescope.load_extension("undo")
end
local function _5_(_, opts)
  telescope.setup(opts)
  return telescope.load_extension("file_browser")
end
return {{"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim", "nvim-lua/popup.nvim", "tsakirist/telescope-lazy.nvim", "nvim-telescope/telescope-ui-select.nvim", "debugloop/telescope-undo.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}}, keys = setup_keys, config = setup}, {"debugloop/telescope-undo.nvim", dependencies = {{"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"}}}, keys = {{"<leader>u", "<cmd>Telescope undo<cr>", {desc = "undo history"}}}, config = _4_}, {"nvim-telescope/telescope-file-browser.nvim", dependencies = {{"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"}}}, keys = {{"<leader>f", "<cmd>Telescope file_browser<cr>", {desc = "file browser", noremap = true}}}, config = _5_}}
