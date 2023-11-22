(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

(fn on-attach-fn [bufnr]
  (let [gs (require :gitsigns)
        mappings [[:n :p "preview_hunk()"]
                  [:n :b "blame_line{full=true}"]
                  [:n :s "stage_hunk()"]
                  [:v :s "stage_hunk()"]
                  [:n :S "stage_buffer()"]
                  [:n :u "undo_stage_hunk()"]
                  [:n :r "reset_hunk()"]
                  [:v :r "reset_hunk()"]
                  [:n :d "diffthis('~')"]
                  [:n :R "reset_buffer()"]]
        cmd #(.. "<cmd>lua require'gitsigns'." $1 :<CR>)
        from #(.. :<leader>g $1)]
    (each [_ [mode key to] (ipairs mappings)]
      (nvim.buf_set_keymap bufnr mode (from key) (cmd to) {:noremap true}))))

[{1 :lewis6991/gitsigns.nvim
  :opts {:on_attach on-attach-fn}}]
