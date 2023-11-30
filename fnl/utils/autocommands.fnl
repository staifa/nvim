(local {: autoload} (require :nfnl.module))
(local api vim.api)
(local ls (autoload :luasnip))
(local parinfer (autoload :parinfer))

;; workaround for help preview aligning right on long lines
(api.nvim_create_autocmd
  [:User]
  {:pattern :TelescopePreviewerLoaded
   :callback (fn [args]
               (when (= :help args.data.filetype)
                 (let [key (api.nvim_replace_termcodes "<C-f>" true false true)]
                   (api.nvim_feedkeys key :t false))))})

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
