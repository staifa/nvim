(local {: autoload} (require :nfnl.module))
(local api vim.api)
(local core (autoload :nfnl.core))

(fn assoc-opts [table options]
  (each [option value (pairs options)]
    (core.assoc table option value)))

(fn force-matchparen-refresh []
  ; HACK: :DoMatchParen turns matchparen on simply by triggering
  ; CursorMoved events (see matchparen.vim). We can do the same, which
  ; is cleaner for us than calling :DoMatchParen directly, since that
  ; would wrap this in a `windo`, and might visit another buffer,
  ; breaking our visual selection (and thus also dot-repeat,
  ; apparently). (See :h visual-start, and the discussion at #38.)
  ; Programming against the API would be more robust of course, but in
  ; the unlikely case that the implementation details would change, this
  ; still cannot do any damage on our side if called with pcall (the
  ; feature just ceases to work then).
  (pcall api.nvim_exec_autocmds "CursorMoved" {:group "matchparen"})
  ; If vim-matchup is installed, it can similarly be forced to refresh
  ; by triggering a CursorMoved event. (The same caveats apply.)
  (pcall api.nvim_exec_autocmds "CursorMoved" {:group "matchup_matchparen"}))

{: assoc-opts
 : force-matchparen-refresh}
