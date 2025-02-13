(import-macros {: tx} :config.macros)

(tx "hrsh7th/nvim-cmp"
  {:event "VeryLazy"
   :main "cmp"
   :dependencies ["hrsh7th/cmp-nvim-lsp"
                  "hrsh7th/cmp-buffer"
                  "hrsh7th/cmp-path"
                  "hrsh7th/cmp-cmdline"
                  "PaterJason/cmp-conjure"
                  "Olical/conjure"
                  "olimorris/codecompanion.nvim"
                  "zbirenbaum/copilot.lua"
                  "onsails/lspkind.nvim"]
   :config
   (fn []
     (let [cmp (require :cmp)
           lspkind (require :lspkind)]
       (cmp.setup
         {:sources (cmp.config.sources
                     [{:name "copilot" :group_index 2}
                      {:name "nvim_lsp" :group_index 2}
                      {:name "conjure" :group_index 2}
                      {:name "buffer" :group_index 2}
                      {:name "luasnip" :group_index 2}])
          :sorting {:priority_weight 2
                    :comparators [;; Below is the default comparator list and order for nvim-cmp
                                  cmp.config.compare.offset
                                  cmp.config.compare.scopes
                                  cmp.config.compare.exact
                                  cmp.config.compare.score
                                  cmp.config.compare.recently_used
                                  cmp.config.compare.locality
                                  cmp.config.compare.kind
                                  cmp.config.compare.sort_text
                                  cmp.config.compare.length
                                  cmp.config.compare.order]}
          :formatting {:format (lspkind.cmp_format {:mode "symbol"
                                                    :ellipsis_char "..."
                                                    :show_labelDetails true
                                                    :maxwidth {:menu 50
                                                                           :abbr 50}})}
          :mapping (cmp.mapping.preset.insert
                     {"<C-b>" (cmp.mapping.scroll_docs -4)
                      "<C-f>" (cmp.mapping.scroll_docs 4)
                      "<C-Space>" (cmp.mapping.complete)
                      "<C-e>" (cmp.mapping.abort)
                      "<CR>" (cmp.mapping.confirm {:select false})})})

       (cmp.setup.cmdline
         ":"
         {:mapping (cmp.mapping.preset.cmdline)
          :sources (cmp.config.sources [{:name "path"} {:name "cmdline"}])
          :matching {:disallow_symbol_nonprefix_matching false}})))})
