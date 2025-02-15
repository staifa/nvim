(import-macros {: tx} :config.macros)

(tx "lewis6991/gitsigns.nvim"
  {:event "VeryLazy"
   :opts {:signcolumn false
          :numhl true
          :linehl false}
   :config
   (fn [_ opts]
     (local gitsigns (require :gitsigns))
     (gitsigns.setup
      (vim.tbl_deep_extend "force" opts
        {:on_attach
         (fn [bufnr]
           (let [gs (. package.loaded :gitsigns)
                 map (fn [mode lhs rhs desc]
                       ((. vim.keymap :set) mode lhs rhs {:desc desc :noremap true :silent true :buffer bufnr}))]
             (map "n" "]c"
                  (fn [] (if vim.wo.diff
                          "]c"
                          (vim.schedule gs.next_hunk)))
                  "Next hunk")
             (map "n" "[c"
                  (fn [] (if vim.wo.diff
                          "[c"
                          (vim.schedule gs.prev_hunk)))
                  "Previous hunk")
             (map "n" "<localleader>gp" gs.preview_hunk "Preview hunk")
             (map "n" "<localleader>gs" gs.stage_hunk "Stage hunk")
             (map "n" "<localleader>gr" gs.reset_hunk "Reset hunk")
             (map "n" "<localleader>gu" gs.undo_stage_hunk "Undo stage hunk")
             (map "n" "<localleader>gb" gs.blame_line "Blame line")
             (map "n" "<localleader>gd" gs.diffthis "Diff this")
             (map "n" "<localleader>gD"
                  (fn [] (gs.diffthis "~"))
                  "Diff against previous")))})))})
