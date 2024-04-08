[{1 :nvim-neorg/neorg
  :dependencies [:nvim-lua/plenary.nvim]
  :build ":Neorg sync-parsers"
  :ft :norg
  :cmd :Neorg
  :opts {:load {["core.defaults"] {} ;; Loads default behaviour
                ["core.concealer"] {} ;; Adds pretty icons to your documents
                ["core.dirman"] {:config {:workspaces {:notes "~/notes"}}}}}}]
