(import-macros {: tx} :config.macros)

(tx "olimorris/codecompanion.nvim"
  {:event "VeryLazy"
   :main "codecompanion"
   :dependencies ["nvim-lua/plenary.nvim" "nvim-treesitter/nvim-treesitter"]
   :keys [(tx "<localleader>fa" "<CMD>Telescope codecompanion<CR>" {:desc "Find AI actions"})
          (tx "<localleader>a:" ":CodeCompanionCmd " {:desc "AI a Neovim command"})
          (tx "<localleader>ao" "<CMD>CodeCompanionChat<CR>" {:desc "Open AI chat"})
          (tx "<localleader>ai" ":CodeCompanion " {:desc "AI buffer or selection" :mode ["n" "v"]})]
   :opts {}})
