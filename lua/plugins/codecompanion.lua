-- [nfnl] Compiled from fnl/plugins/codecompanion.fnl by https://github.com/Olical/nfnl, do not edit.
return {"olimorris/codecompanion.nvim", dependencies = {"nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter"}, event = "VeryLazy", keys = {{"<localleader>fa", "<CMD>Telescope codecompanion<CR>", desc = "Find AI actions"}, {"<localleader>a:", ":CodeCompanionCmd ", desc = "AI a Neovim command"}, {"<localleader>ao", "<CMD>CodeCompanionChat<CR>", desc = "Open AI chat"}, {"<localleader>ai", ":CodeCompanion ", desc = "AI buffer or selection", mode = {"n", "v"}}}, main = "codecompanion", opts = {}}
