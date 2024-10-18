{1 :folke/which-key.nvim
 :lazy false
 :init #(do (set vim.o.timeout true) (set vim.o.timeoutlen 300))
 :opts {}
 :keys [[:<leader><leader> ":lua require('which-key').show({ global = false })<CR>"
        {:desc "Buffer Local Keymaps (which-key)"}]]}
