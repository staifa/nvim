(local {: autoload} (require :nfnl.module))
(local api vim.api)
(local ls (autoload :luasnip))
(local lspkind (autoload :lspkind))
(local cmp (autoload :cmp))

(local cmp-srcs
  [{:name :nvim_lsp :group_index 1}
   {:name :conjure :group_index 2}
   {:name :buffer :group_index 1}
   {:name :luasnip :group_index 2}])

(fn has-words-before []
  (let [(line col) (unpack (api.nvim_win_get_cursor 0))]
    (and (not= col 0)
         (= (: (: (. (api.nvim_buf_get_lines 0 (- line 1) line true) 1) :sub col col) :match "%s") nil))))

(fn mappings [cmp]
  {:<C-p> (cmp.mapping.select_prev_item)
   :<C-n> (cmp.mapping.select_next_item)
   :<C-u> (cmp.mapping.scroll_docs (- 4))
   :<C-d> (cmp.mapping.scroll_docs 4)
   :<C-Space> (cmp.mapping.complete)
   :<C-x> (cmp.mapping.close)
   :<CR> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Replace
                               :select true})
   :<Esc> (cmp.mapping (fn [fallback]
                         (if (and (cmp.visible) (ls.in_snippet))
                           (cmp.abort)
                           (fallback))))
   :<Tab> (cmp.mapping (fn [fallback]
                         (if
                           (cmp.visible) (cmp.select_next_item)
                           (ls.expand_or_jumpable) (ls.expand_or_jump)
                           (has-words-before) (cmp.complete)
                           (fallback)))
                       [:i :s])
   :<S-Tab> (cmp.mapping (fn [fallback]
                           (if
                             (cmp.visible) (cmp.select_prev_item)
                             (ls.jumpable -1) (ls.jump -1)
                             (fallback)))
                         [:i :s])})

(fn setup []
  (cmp.setup {:formatting {:format (lspkind.cmp_format {:mode :symbol})}
              :mapping (mappings cmp)
              :snippet {:expand (fn [args]
                                  (ls.lsp_expand args.body))}
              :sources cmp-srcs}))

[{1 :hrsh7th/nvim-cmp
  :dependencies [:hrsh7th/cmp-buffer
                 :hrsh7th/cmp-nvim-lsp
                 :PaterJason/cmp-conjure
                 :L3MON4D3/LuaSnip
                 :saadparwaiz1/cmp_luasnip
                 :onsails/lspkind.nvim]
  :config setup}]
