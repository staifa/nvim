(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

(fn assoc-opts [table options]
  (each [option value (pairs options)]
    (core.assoc table option value)))

{: assoc-opts}
