(import-macros {: tx} :config.macros)

(tx "folke/which-key.nvim"
  {:event "VeryLazy"
   :config (fn []
             (let [wk (require :which-key)]
               (wk.add
                 [(tx "<localleader>a" {:group "AI"})
                  (tx "<localleader>b" {:group "Buffer"})
                  (tx "<localleader>f" {:group "Find"})
                  (tx "<localleader>l" {:group "LSP"})
                  (tx "<localleader>la" {:group "LSP actions"})
                  (tx "<localleader>g" {:group "Git"})
                  (tx "<localleader>s" {:group "Search"})
                  (tx "<localleader>n" {:group "Notifications"})
                  (tx "<localleader>t" {:group "Toggle"})])))})
