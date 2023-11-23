(local {: autoload} (require :nfnl.module))
(local alpha (autoload :alpha))
(local theme (autoload :alpha.themes.startify))

[{1 :goolord/alpha-nvim
  :dependencies [:nvim-tree/nvim-web-devicons]
  :lazy false
  :config #(alpha.setup theme.config)}]
