(fn setup []
  (let [{: leap} (require :leap)]
    (vim.keymap.set [:n :x :o] :F #(leap {:backward true}))
    (vim.keymap.set [:n :x :o] :f #(leap {}))))

[{1 :ggandor/leap.nvim
  :dependencies [:tpope/vim-repeat]
  :config setup}]
