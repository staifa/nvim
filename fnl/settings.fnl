(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local core (autoload :nfnl.core))

;; global nvim options
(let [options
      {; tabs is space
       :expandtab true
       ; tab/indent size
       :tabstop 2
       :shiftwidth 2
       :softtabstop 2
       ; disable mouse
       :mouse ""
       ; create splits vertically by default
       :diffopt "vertical"
       ; don't redraw everytime
       :lazyredraw true
       ; avoid slow rendering for long lines
       :synmaxcol 128
       ; allow undo-ing even after save file
       :undodir (.. (vim.fn.stdpath "config") "/.undo")
       :undofile true
       ; hide cmd line
       ; :cmdheight 0
       ; settings needed for compe autocompletion
       :completeopt "menuone,noselect"
       ; start scrolling when you're 15 away from bottom (and side)
       :scrolloff 15
       :sidescrolloff 35
       ; set no swap files
       :swapfile false
       :backup false
       ; case insensitive search
       :ignorecase true
       ; hide 'No write since last change' error on switching buffers
       ; keeps buffer open in the background
       :hidden true
       ; smart search case
       :smartcase true
       ; shared clipboard with linux
       :clipboard "unnamedplus"
       ; show line numbers
       :number true
       ; show line and column number
       :ruler true
       ; makes signcolumn always one column with signs and linenumber
       :signcolumn "number"}]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

{}
