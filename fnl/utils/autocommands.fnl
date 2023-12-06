(local {: autoload} (require :nfnl.module))
(local api vim.api)
(local ls (autoload :luasnip))
(local parinfer (autoload :parinfer))
(local {: assoc-opts} (autoload :utils.common))

;; wrap lines in help previewer
(api.nvim_create_autocmd
  [:User]
  {:pattern :TelescopePreviewerLoaded
   :callback (fn [args]
               (when (= :help args.data.filetype)
                 (assoc-opts vim.wo {:wrap true})))})

;; disable diagnostics and parinfer in snippets
(api.nvim_create_autocmd
  [:ModeChanged]
  {:pattern "*:s"
   :callback (fn []
               (when (ls.in_snippet)
                 (parinfer.detach-current-buf!)
                 (vim.diagnostic.disable)))})

;; enable diagnostics and parinfer in snippets
(api.nvim_create_autocmd
  [:ModeChanged]
  {:pattern "[is]:n"
   :callback (fn []
               (when (ls.in_snippet)
                 (parinfer.attach-current-buf!)
                 (vim.diagnostic.enable)))})
