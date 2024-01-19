-- [nfnl] Compiled from fnl/plugins/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local api = vim.api
local lsp_format = autoload("lsp-format")
local lsp = autoload("lspconfig")
local cmplsp = autoload("cmp_nvim_lsp")
local function define_signs(prefix)
  local error = (prefix .. "SignError")
  local warn = (prefix .. "SignWarn")
  local info = (prefix .. "SignInfo")
  local hint = (prefix .. "SignHint")
  vim.fn.sign_define(error, {text = "\239\129\151", texthl = error})
  vim.fn.sign_define(warn, {text = "\239\129\177", texthl = warn})
  vim.fn.sign_define(info, {text = "\239\129\154", texthl = info})
  return vim.fn.sign_define(hint, {text = "\239\129\153", texthl = hint})
end
define_signs("Diagnostic")
local function on_attach_fn(client, bufnr)
  local tb = require("telescope.builtin")
  local mappings
  local function _2_()
    return vim.lsp.buf.code_action({range = {start = api.nvim_buf_get_mark(bufnr, "<"), ["end"] = api.nvim_buf_get_mark(bufnr, ">")}})
  end
  mappings = {{"n", "gd", vim.lsp.buf.definition}, {"n", "K", vim.lsp.buf.hover}, {"n", "<leader>ld", vim.lsp.buf.declaration}, {"n", "<leader>lt", vim.lsp.buf.type_definition}, {"n", "<leader>lh", vim.lsp.buf.signature_help}, {"n", "<leader>r", vim.lsp.buf.rename}, {"n", "<leader>lq", vim.diagnostic.setloclist}, {"n", "<leader>lf", vim.lsp.buf.format}, {"n", "<leader>w", vim.diagnostic.goto_next}, {"n", "<leader>W", vim.diagnostic.goto_prev}, {"n", "<C-a>", vim.lsp.buf.code_action}, {"v", "<C-a>", _2_}, {"n", "<C-i>", tb.lsp_implementations}, {"n", "<M-r>", tb.lsp_references}, {"n", "<M-d>", tb.diagnostics}}
  for _, _3_ in ipairs(mappings) do
    local _each_4_ = _3_
    local mode = _each_4_[1]
    local from = _each_4_[2]
    local to = _each_4_[3]
    vim.keymap.set(mode, from, to, {noremap = true, buffer = bufnr})
  end
  return lsp_format.on_attach(client)
end
local function clj_setup()
  local handlers = {["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {severity_sort = true, update_in_insert = true, underline = true, virtual_text = false}), ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}), ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})}
  local capabilities = cmplsp.default_capabilities()
  local before_init
  local function _5_(params)
    params.workDoneToken = "1"
    return nil
  end
  before_init = _5_
  return lsp.clojure_lsp.setup({on_attach = on_attach_fn, handlers = handlers, before_init = before_init, capabilities = capabilities})
end
vim.diagnostic.config({virtual_text = true, severity_sort = true, float = {header = "", source = "always", border = "solid", focusable = true}, update_in_insert = false})
local function lua_setup()
  return lsp.lua_ls.setup({settings = {Lua = {diagnostics = {globals = {"vim"}}}}})
end
local function _6_()
  clj_setup()
  lua_setup()
  return lsp.fennel_ls.setup({})
end
return {{"neovim/nvim-lspconfig", dependencies = {{"lukas-reineke/lsp-format.nvim", opts = {}}, {"williamboman/mason.nvim", opts = {}}, {"williamboman/mason-lspconfig.nvim", opts = {ensure_installed = {"clojure_lsp", "lua_ls"}}}}, config = _6_}}
