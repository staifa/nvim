(local {: autoload} (require :nfnl.module))
(local conjure (autoload :conjure.main))
(local mapping (autoload :conjure.mapping))
(local {: assoc-opts} (autoload :utils.common))

(fn setup [_ _opts]
  (conjure.main)
  (mapping.on-filetype))

(local options
  {:conjure#log#jump_to_latest#enabled true
   :conjure#highlight#enabled true})

[{1 :Olical/conjure
  :ft [:clojure :fennel :lua]
  :config setup
  :init (assoc-opts vim.g options)}]
