-- [nfnl] Compiled from fnl/plugins/autocomplete.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local ls = autoload("luasnip")
local lspkind = autoload("lspkind")
local cmp = autoload("cmp")
local cmp_srcs = {{name = "nvim_lsp"}, {name = "conjure"}, {name = "buffer"}, {name = "luasnip"}}
local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return ((col ~= 0) and (((vim.api.nvim_buf_get_lines(0, (line - 1), line, true))[1]):sub(col, col):match("%s") == nil))
end
local function mappings(cmp0)
  local function _2_(fallback)
    if (cmp0.visible() and ls.in_snippet()) then
      return cmp0.abort()
    else
      return fallback()
    end
  end
  local function _4_(fallback)
    if cmp0.visible() then
      return cmp0.select_next_item()
    elseif ls.expand_or_jumpable() then
      return ls.expand_or_jump()
    elseif has_words_before() then
      return cmp0.complete()
    else
      return fallback()
    end
  end
  local function _6_(fallback)
    if cmp0.visible() then
      return cmp0.select_prev_item()
    elseif ls.jumpable(-1) then
      return ls.jump(-1)
    else
      return fallback()
    end
  end
  return {["<C-p>"] = cmp0.mapping.select_prev_item(), ["<C-n>"] = cmp0.mapping.select_next_item(), ["<C-u>"] = cmp0.mapping.scroll_docs(( - 4)), ["<C-d>"] = cmp0.mapping.scroll_docs(4), ["<C-Space>"] = cmp0.mapping.complete(), ["<C-x>"] = cmp0.mapping.close(), ["<CR>"] = cmp0.mapping.confirm({behavior = cmp0.ConfirmBehavior.Insert, select = true}), ["<Esc>"] = cmp0.mapping(_2_), ["<Tab>"] = cmp0.mapping(_4_, {"i", "s"}), ["<S-Tab>"] = cmp0.mapping(_6_, {"i", "s"})}
end
local function setup()
  local function _8_(args)
    vim.cmd("ParinferOff")
    return ls.lsp_expand(args.body)
  end
  return cmp.setup({formatting = {format = lspkind.cmp_format({mode = "symbol"})}, mapping = mappings(cmp), snippet = {expand = _8_}, sources = cmp_srcs})
end
return {{"hrsh7th/nvim-cmp", dependencies = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", "PaterJason/cmp-conjure", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "onsails/lspkind.nvim"}, config = setup}}
