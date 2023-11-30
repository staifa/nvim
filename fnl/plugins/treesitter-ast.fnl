(local {: autoload} (require :nfnl.module))
(local ast (autoload :leap-ast))

[{1 :ggandor/leap-ast.nvim
  :dependencies [:nvim-treesitter/nvim-treesitter :ggandor/leap.nvim]
  :config #(vim.keymap.set [:n :x :o] :<M-w> ast.leap {:noremap true})}]
