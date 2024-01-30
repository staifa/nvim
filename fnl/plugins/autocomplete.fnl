(local {: autoload} (require :nfnl.module))
(local {: first : merge : second} (autoload :nfnl.core))
(local ls (autoload :luasnip))
(local kind (autoload :lspkind))
(local cmp (autoload :cmp))

(local cmp-srcs
  [{:name :nvim_lsp :group_index 1}
   {:name :conjure :group_index 2}
   {:name :buffer
    :group_index 1
    :keyword_length 5
    :max_item_count 10
    :option {:get_bufnrs #(vim.api.nvim_list_bufs)}}
   {:name :luasnip :group_index 2}])

(fn has-words-before []
  (let [[line col] (vim.api.nvim_win_get_cursor 0)]
    (and (not= col 0)
         (= (: (: (. (vim.api.nvim_buf_get_lines 0 (- line 1) line true) 1) :sub col col) :match "%s") nil))))

(fn mapping [cmp ls]
  {:<C-p> (cmp.mapping.select_prev_item)
   :<C-n> (cmp.mapping.select_next_item)
   :<C-u> (cmp.mapping.scroll_docs (- 4))
   :<C-d> (cmp.mapping.scroll_docs 4)
   :<C-Space> (cmp.mapping.complete)
   :<C-e> (cmp.mapping.close)
   :<CR> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert
                               :select true})
   :<Tab> (cmp.mapping (fn [fallback]
                         (if
                           (cmp.visible) (cmp.select_next_item)
                           (ls.expand_or_jumpable) (ls.expand_or_jump)
                           (has-words-before) (cmp.complete)
                           :else (fallback)))
                       {1 :i 2 :s})
   :<S-Tab> (cmp.mapping (fn [fallback]
                           (if
                             (cmp.visible) (cmp.select_prev_item)
                             (ls.jumpable -1) (ls.jump -1)
                             :else (fallback)))
                         {1 :i 2 :s})})

(fn format-kind [entry vim_item]
  (let [format-fn (kind.cmp_format {:mode :symbol_text
                                    :maxwidth 50
                                    :ellipsis_char "..."
                                    :show_labelDetails true})
        fmt (format-fn entry vim_item)
        [k m] (vim.split fmt.kind "%s" {:trimempty true})]
    (merge fmt {:kind (.. " " (or k "") " ")
                :menu (.. "    (" (or m "") ")")})))

[{1 :hrsh7th/nvim-cmp
  :event [:InsertEnter :CmdlineEnter]
  :dependencies [:hrsh7th/cmp-buffer
                 :hrsh7th/cmp-nvim-lsp
                 :hrsh7th/cmp-cmdline
                 :PaterJason/cmp-conjure
                 :onsails/lspkind.nvim
                 :L3MON4D3/LuaSnip
                 :saadparwaiz1/cmp_luasnip]
  :config #(do
             (cmp.setup.cmdline ":" {:sources (cmp.config.sources [{:name :path}
                                                                   {:name :cmdline}])
                                     :mapping (cmp.mapping.preset.cmdline)
                                     :view {:entries {:name :wildmenu :separator "|"}}
                                     :formatting {:fields [:abbr]}})
             (cmp.setup.cmdline ["/" "?"] {:sources (cmp.config.sources [{:name :cmdline}])
                                           :mapping (cmp.mapping.preset.cmdline)
                                           :view {:entries {:name :wildmenu :separator "|"}}
                                           :formatting {:fields [:abbr]}})
             (cmp.setup {:formatting {:format format-kind
                                      :fields ["kind" "abbr" "menu"]}
                         :window {:completion {:winhighlight "Normal:Pmenu,FloatBorder:Pmenu,Search:None"
                                               :col_offset -3
                                               :side_padding 0}}
                         :view {:entries {:name :custom :selection_order :near_cursor}}
                         :mapping (mapping cmp ls)
                         :snippet {:expand (fn [args] (ls.lsp_expand args.body))}
                         :sources (cmp.config.sources cmp-srcs)}))}]
