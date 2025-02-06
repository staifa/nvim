-- [nfnl] Compiled from fnl/plugins/autocomplete.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local _local_2_ = autoload("nfnl.core")
local first = _local_2_["first"]
local merge = _local_2_["merge"]
local second = _local_2_["second"]
local ls = autoload("luasnip")
local kind = autoload("lspkind")
local cmp = autoload("cmp")
local cmp_srcs
local function _3_()
  return vim.api.nvim_list_bufs()
end
cmp_srcs = {{name = "luasnip_choice"}, {name = "nvim_lsp", group_index = 1}, {name = "conjure", group_index = 2}, {name = "buffer", group_index = 1, keyword_length = 5, max_item_count = 10, option = {get_bufnrs = _3_}}, {name = "luasnip", group_index = 2}}
local function has_words_before()
  local _let_4_ = vim.api.nvim_win_get_cursor(0)
  local line = _let_4_[1]
  local col = _let_4_[2]
  return ((col ~= 0) and (vim.api.nvim_buf_get_lines(0, (line - 1), line, true)[1]:sub(col, col):match("%s") == nil))
end
local function mapping(cmp0, ls0)
  local function _5_(fallback)
    if cmp0.visible() then
      return cmp0.select_next_item()
    elseif ls0.expand_or_jumpable() then
      return ls0.expand_or_jump()
    elseif has_words_before() then
      return cmp0.complete()
    elseif "else" then
      return fallback()
    else
      return nil
    end
  end
  local function _7_(fallback)
    if cmp0.visible() then
      return cmp0.select_prev_item()
    elseif ls0.jumpable(-1) then
      return ls0.jump(-1)
    elseif "else" then
      return fallback()
    else
      return nil
    end
  end
  return {["<C-p>"] = cmp0.mapping.select_prev_item(), ["<C-n>"] = cmp0.mapping.select_next_item(), ["<C-u>"] = cmp0.mapping.scroll_docs(( - 4)), ["<C-d>"] = cmp0.mapping.scroll_docs(4), ["<C-Space>"] = cmp0.mapping.complete(), ["<C-e>"] = cmp0.mapping.close(), ["<CR>"] = cmp0.mapping.confirm({behavior = cmp0.ConfirmBehavior.Insert, select = true}), ["<C-Tab>"] = cmp0.mapping(_5_, {"i", "s"}), ["<S-Tab>"] = cmp0.mapping(_7_, {"i", "s"})}
end
local function format_kind(entry, vim_item)
  local format_fn = kind.cmp_format({mode = "symbol_text", maxwidth = 50, ellipsis_char = "...", show_labelDetails = true})
  local fmt = format_fn(entry, vim_item)
  local _let_9_ = vim.split(fmt.kind, "%s", {trimempty = true})
  local k = _let_9_[1]
  local m = _let_9_[2]
  return merge(fmt, {kind = (" " .. (k or "") .. " "), menu = ("    (" .. (m or "") .. ")")})
end
local function _10_()
  cmp.setup.cmdline(":", {sources = cmp.config.sources({{name = "path"}, {name = "cmdline"}}), mapping = cmp.mapping.preset.cmdline(), view = {entries = {name = "wildmenu", separator = "|"}}, formatting = {fields = {"abbr"}}})
  cmp.setup.cmdline({"/", "?"}, {sources = cmp.config.sources({{name = "cmdline"}}), mapping = cmp.mapping.preset.cmdline(), view = {entries = {name = "wildmenu", separator = "|"}}, formatting = {fields = {"abbr"}}})
  local function _11_(args)
    return ls.lsp_expand(args.body)
  end
  return cmp.setup({formatting = {format = format_kind, fields = {"kind", "abbr", "menu"}}, window = {completion = {winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None", col_offset = -3, side_padding = 0}}, view = {entries = {name = "custom", selection_order = "near_cursor"}}, mapping = mapping(cmp, ls), snippet = {expand = _11_}, sources = cmp.config.sources(cmp_srcs)})
end
return {{"hrsh7th/nvim-cmp", event = {"InsertEnter", "CmdlineEnter"}, dependencies = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-cmdline", "onsails/lspkind.nvim", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", {"PaterJason/cmp-conjure", ft = {"clojure", "fennel", "lua"}}}, config = _10_}, {"L3MON4D3/cmp-luasnip-choice", dependencies = {"L3MON4D3/LuaSnip"}, opts = {auto_open = true}}}
