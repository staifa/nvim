(fn setup []
  (let [l (require :leap)]
    (l.add_default_mappings)
    (vim.keymap.del [:x :o] "x")
    (vim.keymap.del [:x :o] "X")))

[{1 :ggandor/leap.nvim
  :dependencies [:tpope/vim-repeat]
  :config setup}]
