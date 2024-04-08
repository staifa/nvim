(local {: autoload} (require :nfnl.module))
(local {: assoc : merge} (autoload :nfnl.core))

(fn assoc-opts [table options]
  (each [option value (pairs options)]
    (assoc table option value)))

(local favorite-langs [:clojure :fennel :lua])

(fn active-langs [...]
  "Returns merge of internal and provid langs"
  (if ...
    (merge favorite-langs ...)
    favorite-langs))

{: assoc-opts : active-langs}
