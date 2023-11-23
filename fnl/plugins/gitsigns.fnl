(local {: autoload} (require :nfnl.module))
(local gs (autoload :gitsigns))

(fn on-attach-fn [bufnr]
  (let [mappings [[:n :p gs.preview_hunk]
                  [:n :b #(gs.blame_line {:full true})]
                  [:n :s gs.stage_hunk]
                  [:v :s gs.stage_hunk]
                  [:n :S gs.stage_buffer]
                  [:n :u gs.undo_stage_hunk]
                  [:n :r gs.reset_hunk]
                  [:v :r gs.reset_hunk]
                  [:n :d #(gs.diffthis "~")]
                  [:n :R gs.reset_buffer]]
        from #(.. :<leader>g $1)]
    (each [_ [mode key to] (ipairs mappings)]
      (vim.keymap.set mode (from key) to {:noremap true :buffer bufnr}))))

[{1 :lewis6991/gitsigns.nvim
  :opts {:on_attach on-attach-fn}}]
