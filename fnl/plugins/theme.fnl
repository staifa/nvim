(local {: autoload} (require :nfnl.module))
(local theme (autoload :gruvbox))

(fn setup []
  (theme.setup {:undercurl true
                :underline true
                :bold true
                :italic {:strings true
                         :operators true
                         :comments true}
                ; invert background for search, diffs, statuslines and errors
                :inverse true
                :invert_selection false
                :invert_signs false
                :invert_tabline false
                :invert_intend_guides false
                :contrast "hard"
                :overrides {}}
    (vim.cmd "colorscheme gruvbox")))

[{1 :ellisonleao/gruvbox.nvim
  :lazy false
  :priority 1000
  :config setup}]
