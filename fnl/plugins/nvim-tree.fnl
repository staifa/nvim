(import-macros {: tx} :config.macros)

(tx "nvim-tree/nvim-tree.lua"
  {:dependencies ["nvim-tree/nvim-web-devicons"]
   :opts {:update_focused_file {:enable true :update_cwd true}}
   :keys [[:<F2> #(vim.cmd "NvimTreeToggle")]]})
