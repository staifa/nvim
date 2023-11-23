-- [nfnl] Compiled from fnl/utils/autocommands.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(args)
  if ("help" == args.data.filetype) then
    local key = vim.api.nvim_replace_termcodes("<C-f>", true, false, true)
    return vim.api.nvim_feedkeys(key, "t", false)
  else
    return nil
  end
end
return vim.api.nvim_create_autocmd("User", {pattern = "TelescopePreviewerLoaded", callback = _1_})
