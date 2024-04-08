(local {: autoload} (require :nfnl.module))
(local lens (autoload :auto-session.session-lens))
(vim.keymap.set :n :<C-s> #(lens.search_session))

[{1 :rmagatti/auto-session
  :lazy false
  :priority 1
  :opts {:log_level :error
         :auto_session_suppress_dirs ["~/" "~/Projects" "~/Downloads" "/"]
         :auto_session_use_git_branch false
         :auto_session_enable_last_session false
         :session_lens {:buftypes_to_ignore ["nofile" "terminal" "help"]
                        :load_on_setup true
                        :theme_conf {:border true}
                        :previewer false}}}]
