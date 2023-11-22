(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

;symbols to show for lsp diagnostics
(fn define-signs [prefix]
  (let [error (.. prefix :SignError)
        warn  (.. prefix :SignWarn)
        info  (.. prefix :SignInfo)
        hint  (.. prefix :SignHint)]
    (vim.fn.sign_define error {:text "" :texthl error})
    (vim.fn.sign_define warn  {:text "" :texthl warn})
    (vim.fn.sign_define info  {:text "" :texthl info})
    (vim.fn.sign_define hint  {:text "" :texthl hint})))

(define-signs :Diagnostic)

(fn on-attach-fn [client bufnr]
  (let [{: on_attach} (require :lsp-format)
        mappings [[:n :gd :vim.lsp.buf.definition]
                  [:n :K :vim.lsp.buf.hover]
                  [:n :<leader>ld :vim.lsp.buf.declaration]
                  [:n :<leader>lt :vim.lsp.buf.type_definition]
                  [:n :<leader>lh :vim.lsp.buf.signature_help]
                  [:n :<leader>r :vim.lsp.buf.rename]
                  [:n :<leader>lq :vim.diagnostic.setloclist]
                  [:n :<leader>lf :vim.lsp.buf.format]
                  [:n :<leader>w :vim.diagnostic.goto_next]
                  [:n :<leader>W :vim.diagnostic.goto_prev]
                  [:n :<C-a> :vim.lsp.buf.code_action]
                  [:v :<C-a> :vim.lsp.buf.range_code_action]
                  [:n :<C-i> "require'telescope.builtin'.lsp_implementations"]
                  [:n :<M-r> "require'telescope.builtin'.lsp_references"]
                  [:n :<M-d> "require'telescope.builtin'.diagnostics"]]]
    (on_attach client bufnr)
    (each [_ [mode from to] (ipairs mappings)]
      (nvim.buf_set_keymap bufnr mode from (.. "<cmd>lua " to "()<CR>") {:noremap true}))))

(fn setup []
  (let [lsp (require :lspconfig)
        cmplsp (require :cmp_nvim_lsp)
        handlers {:textDocument/publishDiagnostics
                  (vim.lsp.with
                    vim.lsp.diagnostic.on_publish_diagnostics
                    {:severity_sort true
                     :update_in_insert true
                     :underline true
                     :virtual_text false})
                  :textDocument/hover
                  (vim.lsp.with
                    vim.lsp.handlers.hover
                    {:border :single})
                  :textDocument/signatureHelp
                  (vim.lsp.with
                    vim.lsp.handlers.signature_help
                    {:border :single})}
        capabilities (cmplsp.default_capabilities)
        before_init (fn [params]
                      (set params.workDoneToken :1))]
    ;; Lua
    (lsp.lua_ls.setup {:settings {:Lua {:diagnostics {:globals [:vim]}}}})
    ;; Fennel
    (lsp.fennel_language_server.setup
      {:filetypes [:fennel]
       :root_dir (lsp.util.root_pattern :fnl :lua)
       :single_file_support true
       :settings {:fennel {:diagnostics {:globals [:vim :jit :comment]}
                           :workspace {:library (vim.api.nvim_list_runtime_paths)}}}})
    ;; Clojure
    (lsp.clojure_lsp.setup {:on_attach on-attach-fn
                            :handlers handlers
                            :before_init before_init
                            :capabilities capabilities})))

;; global diagnostics setting
(vim.diagnostic.config {:virtual_text true
                        :severity_sort true
                        :update_in_insert false
                        :float {:header ""
                                :source :always
                                :border :solid
                                :focusable true}})

[{1 :neovim/nvim-lspconfig
  :dependencies [:lukas-reineke/lsp-format.nvim
                 {1 :williamboman/mason.nvim
                  :opts {}}
                 {1 :williamboman/mason-lspconfig.nvim
                  :opts {:ensure_installed [:clojure_lsp
                                            :lua_ls
                                            :fennel_language_server]}}]
  :config setup}]
