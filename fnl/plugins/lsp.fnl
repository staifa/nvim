(local {: autoload} (require :nfnl.module))
(local api vim.api)
(local vfn vim.fn)
(local lsp-format (autoload :lsp-format))
(local lsp (autoload :lspconfig))
(local cmplsp (autoload :cmp_nvim_lsp))

(fn define-signs [prefix]
  ; "Symbols to show for lsp diagnostics."
  (let [error (.. prefix :SignError)
        warn  (.. prefix :SignWarn)
        info  (.. prefix :SignInfo)
        hint  (.. prefix :SignHint)]
    (vfn.sign_define error {:text "" :texthl error})
    (vfn.sign_define warn  {:text "" :texthl warn})
    (vfn.sign_define info  {:text "" :texthl info})
    (vfn.sign_define hint  {:text "" :texthl hint})))

(define-signs :Diagnostic)

(fn on-attach-fn [client bufnr]
  (let [tb (require :telescope.builtin)
        mappings [[:n :gd vim.lsp.buf.definition]
                  [:n :K vim.lsp.buf.hover]
                  [:n :<leader>ld vim.lsp.buf.declaration]
                  [:n :<leader>lt vim.lsp.buf.type_definition]
                  [:n :<leader>lh vim.lsp.buf.signature_help]
                  [:n :<leader>r vim.lsp.buf.rename]
                  [:n :<leader>lq vim.diagnostic.setloclist]
                  [:n :<leader>lf vim.lsp.buf.format]
                  [:n :<F3> vim.diagnostic.goto_next]
                  [:n :<F4> vim.diagnostic.goto_prev]
                  [:n :<leader>a vim.lsp.buf.code_action]
                  [:v :<leader>a #(vim.lsp.buf.code_action
                                    {:range {:start (api.nvim_buf_get_mark bufnr "<")
                                             :end (api.nvim_buf_get_mark bufnr ">")}})]
                  [:n :<leader>i tb.lsp_implementations]
                  [:n :<leader>r tb.lsp_references]
                  [:n :<leader>d tb.diagnostics]]]
    (each [_ [mode from to] (ipairs mappings)]
      (vim.keymap.set mode from to {:noremap true :buffer bufnr}))
    (lsp-format.on_attach client)))

(local handlers {:textDocument/publishDiagnostics
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
                   {:border :single})})

(local capabilities (cmplsp.default_capabilities))

(fn clj-setup []
  (let [before_init (fn [params]
                      (set params.workDoneToken :1))]
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

(fn lua-setup []
  (lsp.lua_ls.setup {:settings {:Lua {:diagnostics {:globals [:vim]}}}}))

(fn python-setup []
  (lsp.pyright.setup {:capabilities capabilities}))

(fn php-setup []
  (lsp.phpactor.setup {:capabilities capabilities
                       :on_attach on-attach-fn
                       :handlers handlers}))

(fn fennel-setup []
  (lsp.fennel_ls.setup {:on-attach on-attach-fn
                        :capabilities capabilities
                        :handlers handlers}))

[{1 :neovim/nvim-lspconfig
  :event [:BufReadPost :BufNewFile]
  :cmd [:LspInfo :LspInstall :LspUninstall]
  :dependencies [{1 :lukas-reineke/lsp-format.nvim
                  :opts {}}
                 {1 :williamboman/mason.nvim
                  :opts {}}
                 {1 :williamboman/mason-lspconfig.nvim
                  :opts {:ensure_installed [:clojure_lsp
                                            :lua_ls]}}]
  :config #(do (clj-setup) (lua-setup) (fennel-setup) (python-setup) (php-setup))}]
