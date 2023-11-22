(vim.api.nvim_create_autocmd
  "User"
  {:pattern :TelescopePreviewerLoaded
   :callback (fn [args]
               (when (= :help args.data.filetype)
                 ;; workaround for help preview aligning right on long lines
                 (let [key (vim.api.nvim_replace_termcodes :<C-f> false false true)]
                   (vim.api.nvim_feedkeys key :t {}))))})
