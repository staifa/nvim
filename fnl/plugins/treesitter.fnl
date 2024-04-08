(local {: autoload} (require :nfnl.module))
(local treesitter (autoload :nvim-treesitter.configs))
(local {: assoc-opts} (autoload :utils.common))

(local options
  {:foldexpr "nvim_treesitter#foldexpr()"
   :foldmethod "expr"
   :foldenable false})

[{1 :nvim-treesitter/nvim-treesitter
  :build ":TSUpdate"
  :dependencies [:RRethy/nvim-treesitter-endwise]
  :init #(assoc-opts vim.g options)
  :config #(treesitter.setup
             {:highlight {:enable true}
              :indent {:enable true}
              :matchup {:enable true}
              :endwise {:enable true}
              ;; lazy loading
              :event [:BufReadPre :BufNewFile]
              :ensure_installed :all
              :sync_install false
              :additional_vim_regex_highlighting false})}]
