(local {: autoload} (require :nfnl.module))
(local {: assoc-opts} (autoload :utils.common))

;; global nvim options
(local options
  {; autosave
   :autowriteall true
   ; tabs is space
   :expandtab true
   ; tab/indent size
   :tabstop 2
   :shiftwidth 2
   :softtabstop 2
   :smarttab true
   :ai true
   :si true
   :wrap true
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
   :cmdheight 0
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
   ; hide tabline
   :showtabline 0
   ; makes signcolumn always one column with signs and linenumber
   :signcolumn "number"})

(assoc-opts vim.o options)

{}
