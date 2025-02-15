-- [nfnl] fnl/plugins/telescope.fnl
local function _1_(_, opts)
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local function _2_(prompt_bufnr)
    local entry = action_state.get_selected_entry()
    local bufnr = tonumber((entry.bufnr or 0))
    if (bufnr > 0) then
      vim.api.nvim_buf_delete(bufnr, {force = true})
    else
    end
    actions._close(prompt_bufnr)
    return require("telescope.builtin").buffers()
  end
  telescope.setup(vim.tbl_deep_extend("force", opts, {defaults = {mappings = {i = {["<C-x>"] = _2_}}}}))
  telescope.load_extension("fzf")
  return telescope.load_extension("undo")
end
return {"nvim-telescope/telescope.nvim", cmd = "Telescope", config = _1_, dependencies = {"nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}}, keys = {{"<localleader>ff", "<CMD>Telescope git_files<CR>", desc = "Find files"}, {"<localleader>fF", "<CMD>Telescope find_files hidden=true<CR>", desc = "Find all files"}, {"<localleader>fg", "<CMD>Telescope live_grep<CR>", desc = "Find grep"}, {"<localleader>fw", "<CMD>Telescope grep_string<CR>", desc = "Grep string under cursor"}, {"<localleader>fb", "<CMD>Telescope buffers<CR>", desc = "Find buffers"}, {"<localleader>fh", "<CMD>Telescope help_tags<CR>", desc = "Find help tags"}, {"<localleader>fc", "<CMD>Telescope commands<CR>", desc = "Find commands"}, {"<localleader>fo", "<CMD>Telescope oldfiles<CR>", desc = "Find recent files"}, {"<localleader>fk", "<CMD>Telescope keymaps<CR>", desc = "Find keymaps"}, {"<localleader>fu", "<CMD>Telescope undo<CR>", desc = "Find undo"}}, opts = {extensions = {undo = {}}, defaults = {vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--hidden", "--glob=!.git/"}, layout_strategy = "horizontal", layout_config = {horizontal = {preview_width = 0.6}}}}, tag = "0.1.8"}
