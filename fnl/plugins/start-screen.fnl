(fn setup
  []
  (let [alpha (require :alpha)
        theme (require :alpha.themes.startify)]
    (alpha.setup theme.config)))

[{1 :goolord/alpha-nvim
  :dependencies [:nvim-tree/nvim-web-devicons]
  :config setup}]
