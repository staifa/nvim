(local {: autoload} (require :nfnl.module))
(local treesitter (autoload :nvim-treesitter.configs))

(local ensures [:bash :clojure :dockerfile :fennel :html :java :groovy :javascript
                :json :lua :markdown :yaml :sql])

(fn setup []
  (treesitter.setup {:highlight {:enable true}
                     :indent {:enable true}
                     :matchup {:enable true}
                     :ensure_installed ensures}))

[{1 :nvim-treesitter/nvim-treesitter
  :build ":TSUpdate"
  :config setup}]
