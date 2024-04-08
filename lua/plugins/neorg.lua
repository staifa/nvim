-- [nfnl] Compiled from fnl/plugins/neorg.fnl by https://github.com/Olical/nfnl, do not edit.
return {{"nvim-neorg/neorg", dependencies = {"nvim-lua/plenary.nvim"}, build = ":Neorg sync-parsers", ft = "norg", cmd = "Neorg", opts = {load = {[{"core.defaults"}] = {}, [{"core.concealer"}] = {}, [{"core.dirman"}] = {config = {workspaces = {notes = "~/notes"}}}}}}}
