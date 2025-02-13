(import-macros {: tx} :config.macros)

(tx "zbirenbaum/copilot.lua"
  {:event "VeryLazy"
   :cmd "Copilot"
   :main "copilot"
   :opts {:suggestion {:enabled true
                       :auto_trigger true
                       :keymap {:accept_word "<M-Right>"
				:accept "<C-Right>"
				:dismiss "<C-Left>"}}
          :panel {:enabled true}}})
