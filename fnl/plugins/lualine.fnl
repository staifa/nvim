(local {: autoload} (require :nfnl.module))
(local {: get-progress-message} (autoload :utils.lsp))
(local lualine (autoload :lualine))

(fn lsp_connection []
  (let [message (get-progress-message)]
    (if
      (or (= message.status :begin)
          (= message.status :report)) (.. message.msg " : " message.percent "%% ")
      (= message.status :end) ""
      "")))

(local sections
  {:lualine_a [:branch]
   :lualine_b [:diff
               {1 :diagnostics
                :sections [:error :warn :info :hint]
                :sources [:nvim_lsp]}]
   :lualine_c [{1 :filename
                :file_status true
                :path 1
                :shorting_target 40
                :symbols {:modified "  "
                          :readonly "[-]"
                          :unnamed "[No Name]"}}]
   :lualine_d []
   :lualine_w []
   :lualine_x [lsp_connection :filetype]
   :lualine_y [:progress]
   :lualine_z [:location]})

[{1 :nvim-lualine/lualine.nvim
  :lazy false
  :opts {:options {:component_separators {:right ""}
                   :section_separators {:left "" :right ""}
                   :theme :gruvbox}
         :sections sections
         :inactive_sections sections}}]
