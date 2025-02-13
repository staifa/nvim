(import-macros {: tx} :config.macros)

(tx "nvim-treesitter/nvim-treesitter"
  {:main :nvim-treesitter.configs
   :dependencies ["nvim-treesitter/nvim-treesitter-refactor"]
   :opts {:auto_install true
          :indent {:enable true}
          :highlight {:enable true}
          :refactor {:highlight_definitions {:enable true}
                     :highlight_current_scope {:enable false}}}})
