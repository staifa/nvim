(local {: autoload} (require :nfnl.module))
(local api vim.api)
(local lsp-format (autoload :lsp-format))
(local lsp (autoload :lspconfig))
(local cmplsp (autoload :cmp_nvim_lsp))

(fn define-signs [prefix]
  ; "Symbols to show for lsp diagnostics."
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
  (let [tb (require :telescope.builtin)
        mappings [[:n :gd vim.lsp.buf.definition]
                  [:n :K vim.lsp.buf.hover]
                  [:n :<leader>ld vim.lsp.buf.declaration]
                  [:n :<leader>lt vim.lsp.buf.type_definition]
                  [:n :<leader>lh vim.lsp.buf.signature_help]
                  [:n :<leader>r vim.lsp.buf.rename]
                  [:n :<leader>lq vim.diagnostic.setloclist]
                  [:n :<leader>lf vim.lsp.buf.format]
                  [:n :<leader>w vim.diagnostic.goto_next]
                  [:n :<leader>W vim.diagnostic.goto_prev]
                  [:n :<C-a> vim.lsp.buf.code_action]
                  [:v :<C-a> #(vim.lsp.buf.code_action
                                {:range {:start (api.nvim_buf_get_mark bufnr "<")
                                         :end (api.nvim_buf_get_mark bufnr ">")}})]
                  [:n :<C-i> tb.lsp_implementations]
                  [:n :<M-r> tb.lsp_references]
                  [:n :<M-d> tb.diagnostics]]]
    (each [_ [mode from to] (ipairs mappings)]
      (vim.keymap.set mode from to {:noremap true :buffer bufnr}))
    (lsp-format.on_attach client)))

(fn clj-setup []
  (let [handlers {:textDocument/publishDiagnostics
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

(fn fennel-setup []
  (lsp.fennel_language_server.setup
    {:filetypes [:fennel]
     :root_dir (lsp.util.root_pattern :fnl :lua)
     :single_file_support true
     :settings {:fennel {:diagnostics {:globals [:vim :jit :comment]}
                         :workspace {:library (api.nvim_list_runtime_paths)}}}}))

(fn lua-setup []
  (lsp.lua_ls.setup {:settings {:Lua {:diagnostics {:globals [:vim]}}}}))

[{1 :neovim/nvim-lspconfig
  :dependencies [{1 :lukas-reineke/lsp-format.nvim
                  :opts {}}
                 {1 :williamboman/mason.nvim
                  :opts {}}
                 {1 :williamboman/mason-lspconfig.nvim
                  :opts {:ensure_installed [:clojure_lsp
                                            :lua_ls
                                            :fennel_language_server]}}]
  :config #(do (clj-setup) (fennel-setup) (lua-setup))}]
