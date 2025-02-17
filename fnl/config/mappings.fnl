;; global key mappings
(let [mappings [[:gx #(vim.cmd :bd) "Close buffer"]
                [:gX #(vim.cmd :%bd|e#|bd#) "Close all buffers except the current one"]
                [:<Backspace> #(vim.cmd :noh) "Clear highlights"]
                [:<space> "a<space><Esc>" "Insert space in normal mode"]
                [:to #(vim.cmd :tabnew) "Open new tab"]
                [:tn #(vim.cmd :tabnext) "Next tab"]
                [:tp #(vim.cmd :tabprev) "Previous tab"]
                [:tx #(vim.cmd :tabclose) "Close tab"]
                [:qw #(vim.cmd :wqa) "Save all buffers and exit"]
                [:qe #(vim.cmd :q) "Close buffer"]
                [:qq #(vim.cmd :qa) "Exit"]]]
  (each [_ [from to desc] (ipairs mappings)]
    (vim.keymap.set :n from to {:noremap true :desc desc})))

(vim.keymap.set [:n :v] :<esc> "<esc>:update<cr>" {:noremap true :silent true :desc ""})
