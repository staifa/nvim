(import-macros {: tx} :config.macros)

(tx "lewis6991/gitsigns.nvim"
  {:event "VeryLazy"
   :opts {:signcolumn false
          :numhl true
	  :linehl false}})
