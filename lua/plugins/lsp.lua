-- [nfnl] Compiled from fnl/plugins/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local api = vim.api
local vfn = vim.fn
local lsp_format = autoload("lsp-format")
local lsp = autoload("lspconfig")
local cmplsp = autoload("cmp_nvim_lsp")
local function define_signs(prefix)
  local error = (prefix .. "SignError")
  local warn = (prefix .. "SignWarn")
  local info = (prefix .. "SignInfo")
  local hint = (prefix .. "SignHint")
  vfn.sign_define(error, {text = "\239\129\151", texthl = error})
  vfn.sign_define(warn, {text = "\239\129\177", texthl = warn})
  vfn.sign_define(info, {text = "\239\129\154", texthl = info})
  return vfn.sign_define(hint, {text = "\239\129\153", texthl = hint})
end
define_signs("Diagnostic")
local function on_attach_fn(client, bufnr)
  local tb = require("telescope.builtin")
  local mappings
  local function _2_()
    return vim.lsp.buf.code_action({range = {start = api.nvim_buf_get_mark(bufnr, "<"), ["end"] = api.nvim_buf_get_mark(bufnr, ">")}})
  end
  mappings = {{"n", "gd", vim.lsp.buf.definition}, {"n", "K", vim.lsp.buf.hover}, {"n", "<leader>ld", vim.lsp.buf.declaration}, {"n", "<leader>lt", vim.lsp.buf.type_definition}, {"n", "<leader>lh", vim.lsp.buf.signature_help}, {"n", "<leader>r", vim.lsp.buf.rename}, {"n", "<leader>lq", vim.diagnostic.setloclist}, {"n", "<leader>lf", vim.lsp.buf.format}, {"n", "<F3>", vim.diagnostic.goto_next}, {"n", "<F4>", vim.diagnostic.goto_prev}, {"n", "<leader>a", vim.lsp.buf.code_action}, {"v", "<leader>a", _2_}, {"n", "<leader>i", tb.lsp_implementations}, {"n", "<leader>r", tb.lsp_references}, {"n", "<leader>d", tb.diagnostics}}
  for _, _3_ in ipairs(mappings) do
    local mode = _3_[1]
    local from = _3_[2]
    local to = _3_[3]
    vim.keymap.set(mode, from, to, {noremap = true, buffer = bufnr})
  end
  return lsp_format.on_attach(client)
end
local handlers = {["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {severity_sort = true, update_in_insert = true, underline = true, virtual_text = false}), ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}), ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})}
local capabilities = cmplsp.default_capabilities()
local function clj_setup()
  local before_init
  local function _4_(params)
    params.workDoneToken = "1"
    return nil
  end
  before_init = _4_
  return lsp.clojure_lsp.setup({on_attach = on_attach_fn, handlers = handlers, before_init = before_init, capabilities = capabilities})
end
vim.diagnostic.config({virtual_text = true, severity_sort = true, float = {header = "", source = "always", border = "solid", focusable = true}, update_in_insert = false})
local function lua_setup()
  return lsp.lua_ls.setup({settings = {Lua = {diagnostics = {globals = {"vim"}}}}})
end
local function python_setup()
  return lsp.pyright.setup({capabilities = capabilities})
end
local function php_setup()
  return lsp.phpactor.setup({capabilities = capabilities, on_attach = on_attach_fn, handlers = handlers})
end
local function fennel_setup()
  return lsp.fennel_ls.setup({["on-attach"] = on_attach_fn, capabilities = capabilities, handlers = handlers})
end
local function _5_()
  clj_setup()
  lua_setup()
  fennel_setup()
  python_setup()
  return php_setup()
end
return {{"neovim/nvim-lspconfig", event = {"BufReadPost", "BufNewFile"}, cmd = {"LspInfo", "LspInstall", "LspUninstall"}, dependencies = {{"lukas-reineke/lsp-format.nvim", opts = {}}, {"williamboman/mason.nvim", opts = {}}, {"williamboman/mason-lspconfig.nvim", opts = {ensure_installed = {"clojure_lsp", "lua_ls"}}}}, config = _5_}}
