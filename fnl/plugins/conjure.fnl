(local {: autoload} (require :nfnl.module))
(local conjure (autoload :conjure.main))
(local mapping (autoload :conjure.mapping))
(local {: g} (autoload :nvim))

(fn setup [_ _opts]
  (conjure.main)
  (mapping.on-filetype))

(fn init []
  (set g.conjure#log#jump_to_latest#enabled true)
  (set g.conjure#highlight#enabled true))

[{1 :Olical/conjure
  :ft [:clojure :fennel :lua]  
  :config setup
  :init init}]
