(import-macros {: tx} :config.macros)

(tx "nvim-lualine/lualine.nvim"
  {:dependencies ["kyazdani42/nvim-web-devicons"]
   :opts {:options {:ignore_focus ["NvimTree"]}}})
