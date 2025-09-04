-- [nfnl] fnl/plugins/lsp.fnl
local lsps = {"clojure_lsp", "fennel_language_server", "lua_ls", "jsonls", "yamlls", "marksman", "html", "basedpyright", "ts_ls", "terraformls", "dockerls", "docker_compose_language_service", "bashls", "taplo", "sqlls"}
local filetype__3eformatters = {lua = {"stylua"}, sh = {"shfmt"}, python = {"ruff_organize_imports", "ruff_format"}, rust = {"rustfmt"}, clojure = {"cljfmt"}, javascript = {"prettierd"}, typescript = {"prettierd"}, jsx = {"prettierd"}, html = {"prettierd"}, css = {"prettierd"}, yaml = {"prettierd"}, markdown = {"prettierd"}, fennel = {"fnlfmt"}, sql = {"sqlfmt"}}
local formatter__3epackage = {ruff_organize_imports = "ruff", ruff_format = "ruff"}
local disable_formatter_on_save = {fennel = true, sql = true}
local disable_formatter_auto_install = {fnlfmt = true, rustfmt = true}
local function _1_(_, opts)
  local conform = require("conform")
  local registry = require("mason-registry")
  local formatters_for_mason = {}
  local function _2_()
    for _ft, formatters in pairs(filetype__3eformatters) do
      for _idx, formatter in ipairs(formatters) do
        if not disable_formatter_auto_install[formatter] then
          formatters_for_mason[(formatter__3epackage[formatter] or formatter)] = true
        else
        end
      end
    end
    for formatter, _true in pairs(formatters_for_mason) do
      local pkg = registry.get_package(formatter)
      if not pkg:is_installed() then
        vim.notify(("Automatically installing " .. formatter .. " with Mason."))
        pkg:install()
      else
      end
    end
    return nil
  end
  vim.schedule(_2_)
  vim.g.dotfiles_format_on_save = true
  conform.setup(opts)
  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  return nil
end
local function _5_()
  if (nil == vim.b.dotfiles_format_on_save) then
    vim.b.dotfiles_format_on_save = false
  else
    vim.b.dotfiles_format_on_save = not vim.b.dotfiles_format_on_save
  end
  return vim.notify(("Set vim.b.dotfiles_format_on_save to " .. tostring(vim.b.dotfiles_format_on_save)))
end
local function _7_()
  vim.g.dotfiles_format_on_save = not vim.g.dotfiles_format_on_save
  return vim.notify(("Set vim.g.dotfiles_format_on_save to " .. tostring(vim.g.dotfiles_format_on_save)))
end
local function _8_(_buf)
  if (vim.g.dotfiles_format_on_save and ((nil == vim.b.dotfiles_format_on_save) or vim.b.dotfiles_format_on_save) and not disable_formatter_on_save[vim.bo.filetype]) then
    return {timeout_ms = 500, lsp_format = "fallback"}
  else
    return nil
  end
end
local function _10_()
  local lspconfig = require("lspconfig")
  local configs = require("lspconfig.configs")
  local caps = require("cmp_nvim_lsp").default_capabilities()
  local mlsp = require("mason-lspconfig")
  mlsp.setup({ensure_installed = lsps, automatic_installation = true})
  if not configs.fennel_language_server then
    configs.fennel_language_server = {default_config = {cmd = {"fennel-ls"}, filetypes = {"fennel"}, root_dir = lspconfig.util.root_pattern("fnl"), single_file_support = true}}
  else
  end
  return lspconfig.fennel_language_server.setup({capabilities = caps, root_dir = lspconfig.util.root_pattern("fnl"), single_file_support = true, settings = {fennel = {workspace = {library = vim.api.nvim_list_runtime_paths()}, diagnostics = {globals = {"vim", "tx"}}}}})
end
local function _12_()
  return require("conform").format()
end
local function _13_()
  return vim.diagnostic.goto_next({severity = {min = vim.diagnostic.severity.WARN}})
end
local function _14_()
  return vim.diagnostic.goto_prev({severity = {min = vim.diagnostic.severity.WARN}})
end
return {{"williamboman/mason.nvim", opts = {}}, {"stevearc/conform.nvim", config = _1_, dependencies = {"rcarriga/nvim-notify"}, keys = {{"<leader>tf", _5_, desc = "Toggle buffer formatting"}, {"<leader>tF", _7_, desc = "Toggle global formatting"}}, opts = {formatters_by_ft = filetype__3eformatters, format_on_save = _8_}}, {"williamboman/mason-lspconfig.nvim", dependencies = {"williamboman/mason.nvim"}, opts = {ensure_installed = lsps, automatic_installation = true}, version = "*"}, {"neovim/nvim-lspconfig", config = _10_, dependencies = {"williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp", "stevearc/conform.nvim"}, keys = {{"<localleader>ld", "<CMD>Telescope lsp_definitions<CR>", desc = "LSP definition"}, {"<localleader>lu", "<CMD>Telescope lsp_implementations<CR>", desc = "LSP implementations"}, {"<localleader>lt", "<CMD>Telescope lsp_type_definitions<CR>", desc = "LSP type definitions"}, {"<localleader>lr", "<CMD>Telescope lsp_references<CR>", desc = "LSP references"}, {"<localleader>li", "<CMD>Telescope lsp_incoming_calls<CR>", desc = "LSP incoming calls"}, {"<localleader>lo", "<CMD>Telescope lsp_outgoing_calls<CR>", desc = "LSP outgoing calls"}, {"<localleader>ls", "<CMD>Telescope lsp_document_symbols<CR>", desc = "LSP document symbols"}, {"<localleader>lS", "<CMD>Telescope lsp_workspace_symbols<CR>", desc = "LSP workspace symbols"}, {"<localleader>lx", "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "LSP dynamic workspace symbols (all workspaces)"}, {"<localleader>laf", _12_, desc = "LSP format"}, {"<localleader>lar", vim.lsp.buf.rename, desc = "LSP rename"}, {"<localleader>w", _13_, desc = "Go to next warning/error"}, {"<localleader>q", _14_, desc = "Go to previous warning/error"}, {"<C-a>", vim.lsp.buf.code_action, desc = "LSP code actions"}, {"<C-a>", vim.lsp.buf.code_action, desc = "LSP code actions", mode = {"n", "v"}}}, lazy = false}, {"RubixDev/mason-update-all", cmd = "MasonUpdateAll", dependencies = {"williamboman/mason.nvim"}, main = "mason-update-all", opts = {}}}
