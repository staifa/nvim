[{1 :ggandor/leap.nvim
  :dependencies [:tpope/vim-repeat]
  :keys [[:F "<Plug>(leap-backward)" {:desc "backward movement" :noremap true}]
         [:f "<Plug>(leap-forward)" {:desc "forward movement" :noremap true}]]}
 {1 :ggandor/leap-ast.nvim
  :dependencies [:nvim-treesitter/nvim-treesitter  :ggandor/leap.nvim]
  :keys [[:<M-f> ":lua require('leap-ast').leap()<CR>" {:desc "node movement" :noremap true}]]}]
