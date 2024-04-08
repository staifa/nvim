(local {: autoload} (require :nfnl.module))
(local telescope (autoload :telescope))
(local themes (autoload :telescope.themes))
(local actions (autoload :telescope.actions))
(local builtin (autoload :telescope.builtin))

(fn setup []
  (telescope.setup {:defaults {:file_ignore_patterns [:node_modules :.undo]
                               :layout_config {:horizontal {:width 0.8
                                                            :preview_width 0.5}}
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
                                                   :--hidden]}}
                  :extensions {:ui-select {1 (themes.get_dropdown {})}
                               :fzf {:fuzzy true
                                     :override_generic_sorter true
                                     :override_file_sorter true
                                     :case_mode :smart_case}}
                  :pickers {:find_files {:find_command [:rg
                                                        :--files
                                                        :--iglob
                                                        :!.git
                                                        :--hidden]}})
  (telescope.load_extension :fzf)
  (telescope.load_extension :lazy)
  (telescope.load_extension :ui-select)
  (telescope.load_extension :session-lens)
  (telescope.load_extension :lazygit))

(fn setup-keys []
  (let [mappings {:n builtin.find_files
                  :j builtin.live_grep
                  :b builtin.buffers
                  :h builtin.help_tags
                  :r builtin.registers
                  :c builtin.resume}
        from #(.. :<M- $1 :>)]
    (icollect [key cmd (pairs mappings)]
      [(from key) cmd])))

[{1 :nvim-telescope/telescope.nvim
  :dependencies [:nvim-lua/plenary.nvim
                 :nvim-lua/popup.nvim
                 :tsakirist/telescope-lazy.nvim
                 :nvim-telescope/telescope-ui-select.nvim
                 :debugloop/telescope-undo.nvim
                 {1 :nvim-telescope/telescope-fzf-native.nvim
                  :build :make}]
  :keys setup-keys
  :config setup}
 {1 :debugloop/telescope-undo.nvim
  :dependencies [{1 "nvim-telescope/telescope.nvim"
                  :dependencies [:nvim-lua/plenary.nvim]}]
  :keys [[:<M-u> "<cmd>Telescope undo<cr>" {:desc "undo history"}]]
  :config (fn [_ opts] (telescope.setup opts) (telescope.load_extension :undo))}
 {1 :nvim-telescope/telescope-file-browser.nvim
  :dependencies [{1 :nvim-telescope/telescope.nvim
                  :dependencies [:nvim-lua/plenary.nvim]}]
  :keys [[:<M-d> ":Telescope file_browser<cr>" {:desc "file browser"
                                                :noremap true}]]
  :config (fn [_ opts] (telescope.setup opts) (telescope.load_extension :file_browser))}]
