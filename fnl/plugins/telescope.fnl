(import-macros {: tx} :config.macros)

(tx "nvim-telescope/telescope.nvim"
  {:tag "0.1.8"
   :dependencies ["nvim-lua/plenary.nvim"
                  "debugloop/telescope-undo.nvim"
                  (tx "nvim-telescope/telescope-fzf-native.nvim" {:build "make"})]
   :opts {:extensions {:undo {}}
          :defaults
           {:vimgrep_arguments
            ["rg" "--color=never" "--no-heading"
             "--with-filename" "--line-number" "--column"
             "--smart-case" "--hidden" "--glob=!.git/"]
            :layout_strategy "horizontal"
            :layout_config {:horizontal {:preview_width 0.5}}}}
   :config (fn [_ opts]
             (let [telescope (require :telescope)]
               (telescope.setup opts)
               (telescope.load_extension :fzf)
               (telescope.load_extension :undo)))
   :cmd "Telescope"
   :keys [(tx "<localleader>ff" "<CMD>Telescope git_files<CR>"
            {:desc "Find files"})
          (tx "<localleader>fF" "<CMD>Telescope find_files hidden=true<CR>"
            {:desc "Find all files"})
          (tx "<localleader>fg" "<CMD>Telescope live_grep<CR>"
            {:desc "Find grep"})
          (tx "<localleader>fw" "<CMD>Telescope grep_string<CR>"
            {:desc "Grep string under cursor"})
          (tx "<localleader>fb" "<CMD>Telescope buffers<CR>"
            {:desc "Find buffers"})
          (tx "<localleader>fh" "<CMD>Telescope help_tags<CR>"
            {:desc "Find help tags"})
          (tx "<localleader>fc" "<CMD>Telescope commands<CR>"
            {:desc "Find commands"})
          (tx "<localleader>fo" "<CMD>Telescope oldfiles<CR>"
            {:desc "Find recent files"})
          (tx "<localleader>fk" "<CMD>Telescope keymaps<CR>"
            {:desc "Find keymaps"})
          (tx "<localleader>fu" "<CMD>Telescope undo<CR>"
            {:desc "Find undo"})]})
