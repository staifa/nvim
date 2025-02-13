(import-macros {: tx} :config.macros)

(fn setup []
  (let [theme (require :gruvbox)]
    (theme.setup {:undercurl true
                  :underline true
                  :bold true
                  :italic {:strings true
                           :operators true
                           :comments true}
                  ; invert background for search, diffs, statuslines and errors
                  :inverse false
                  :invert_selection false
                  :invert_signs false
                  :invert_tabline false
                  :invert_intend_guides false
                  :contrast "hard"
                  :overrides {}})
    (vim.cmd "colorscheme gruvbox")))

(tx "ellisonleao/gruvbox.nvim"
  {:priority 1000
   :config setup})
