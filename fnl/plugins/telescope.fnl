(local {: autoload} (require :nfnl.module))
(local telescope (autoload :telescope))
(local themes (autoload :telescope.themes))
(local actions (autoload :telescope.actions))
(local builtin (autoload :telescope.builtin))

(fn setup []
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
                                                          :--hidden]}}}
    (telescope.load_extension :ui-select)
    (telescope.load_extension :lazygit)))

(fn setup-keys []
  (let [mappings {:f builtin.find_files
                  :j builtin.live_grep
                  :b builtin.buffers
                  :h builtin.help_tags
                  :s builtin.resume}
        from #(.. :<C- $1 :>)]
    (icollect [key cmd (pairs mappings)]
      [(from key) cmd])))

[{1 :nvim-telescope/telescope.nvim
  :dependencies [:nvim-telescope/telescope-ui-select.nvim
                 :nvim-lua/popup.nvim
                 :nvim-lua/plenary.nvim]
  :keys setup-keys
  :config setup}]
