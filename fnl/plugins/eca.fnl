(import-macros {: tx} :config.macros)

(tx "editor-code-assistant/eca-nvim"
  {:dependencies ["MunifTanjim/nui.nvim"
                  "nvim-lua/plenary.nvim"]
   :keys [["<leader>cc" "<cmd>EcaChat<cr>" :desc "Open ECA chat"]
          ["<leader>ce" "<cmd>EcaAddFile<cr>" :desc "Add current file as ECA context"]
          ["<leader>cf" "<cmd>EcaFocus<cr>" :desc "Focus ECA sidebar"]
          ["<leader>ct" "<cmd>EcaToggle<cr>" :desc "Toggle ECA sidebar"]]
   :opts {:debug false
          :server_path ""
          :behavior {:auto_set_keymaps true
                     :auto_focus_sidebar true}}})
