(require :config/telescope)

(fn setup []
  (let [telescope (require :telescope)
        themes (require :telescope.themes)
        actions (require :telescope.actions)]
    (telescope.setup {:defaults {:file_ignore_patterns [:node_modules :.undo]
                                 :mappings {:i {:<esc> actions.close}}
                                 :vimgrep_arguments [:rg
                                                     :--color=never
                                                     :--no-heading
                                                     :--with-filename
                                                     :--line-number
                                                     :--column
                                                     :--smart-case
                                                     :--iglob
                                                     :!.git
                                                     :--hidden]}
                      :extensions {:ui-select {1 (themes.get_dropdown {})}}
                      :pickers {:find_files {:find_command [:rg
                                                            :--files
                                                            :--iglob
                                                            :!.git
                                                            :--hidden]}}})
    (telescope.load_extension :ui-select)
    (telescope.load_extension :lazygit)))

(fn setup-keys []
  (let [mappings {:f :find_files
                  :j :live_grep
                  :b :buffers
                  :h :help_tags
                  :s :resume}
        from #(.. :<C- $1 :>)
        to #(.. "<cmd>lua require'telescope.builtin'." $1 "()<CR>")]
    (icollect [key cmd (pairs mappings)]
      [(from key) (to cmd)])))

[{1 :nvim-telescope/telescope.nvim
  :dependencies [:nvim-telescope/telescope-ui-select.nvim
                 :nvim-lua/popup.nvim
                 :nvim-lua/plenary.nvim]
  :keys setup-keys
  :config setup}]
