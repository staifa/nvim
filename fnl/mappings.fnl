;; global key mappings
(let [mappings [[:<Space> :i<Space><Esc> "Space in normal mode"]
                [:gn :<cmd>bn<CR> "Switch to next buffer"]
                [:gp :<cmd>bp<CR> "Switch to previous buffer"]
                [:gx :<cmd>bd<CR> "Close buffer"]
                [:gX :<cmd>%bd|e#|bd#<CR> "Close all boffers except the current one"]
                [:<Backspace> :<cmd>noh<CR> "Clear highlights"]
                [:to :<cmd>tabnew<CR> "Open new tab"]
                [:tn :<cmd>tabnext<CR> "Next tab"]
                [:tp :<cmd>tabprev<CR> "Previous tab"]
                [:tx :<cmd>tabclose<CR> "Close tab"]]]
  (each [_ [from to desc] (ipairs mappings)]
    (vim.api.nvim_set_keymap :n from to {:noremap true :desc desc})))

{}
