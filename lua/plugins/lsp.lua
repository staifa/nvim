-- [nfnl] Compiled from fnl/plugins/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
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
  local _let_2_ = require("lsp-format")
  local on_attach = _let_2_["on_attach"]
  local mappings = {{"n", "gd", "vim.lsp.buf.definition"}, {"n", "K", "vim.lsp.buf.hover"}, {"n", "<leader>ld", "vim.lsp.buf.declaration"}, {"n", "<leader>lt", "vim.lsp.buf.type_definition"}, {"n", "<leader>lh", "vim.lsp.buf.signature_help"}, {"n", "<leader>r", "vim.lsp.buf.rename"}, {"n", "<leader>lq", "vim.diagnostic.setloclist"}, {"n", "<leader>lf", "vim.lsp.buf.format"}, {"n", "<leader>w", "vim.diagnostic.goto_next"}, {"n", "<leader>W", "vim.diagnostic.goto_prev"}, {"n", "<C-a>", "vim.lsp.buf.code_action"}, {"v", "<C-a>", "vim.lsp.buf.range_code_action"}, {"n", "<C-i>", "require'telescope.builtin'.lsp_implementations"}, {"n", "<M-r>", "require'telescope.builtin'.lsp_references"}, {"n", "<M-d>", "require'telescope.builtin'.diagnostics"}}
  on_attach(client, bufnr)
  for _, _3_ in ipairs(mappings) do
    local _each_4_ = _3_
    local mode = _each_4_[1]
    local from = _each_4_[2]
    local to = _each_4_[3]
    nvim.buf_set_keymap(bufnr, mode, from, ("<cmd>lua " .. to .. "()<CR>"), {noremap = true})
  end
  return nil
end
local function setup()
  local lsp = require("lspconfig")
  local cmplsp = require("cmp_nvim_lsp")
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
return {{"neovim/nvim-lspconfig", dependencies = {"lukas-reineke/lsp-format.nvim", {"williamboman/mason.nvim", opts = {}}, {"williamboman/mason-lspconfig.nvim", opts = {ensure_installed = {"clojure_lsp", "lua_ls", "fennel_language_server"}}}}, config = setup}}
