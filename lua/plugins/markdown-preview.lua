-- [nfnl] Compiled from fnl/plugins/markdown-preview.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return vim.fn["mkdp#util#install"]()
end
return {"iamcco/markdown-preview.nvim", cmd = {"MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"}, build = _1_}
