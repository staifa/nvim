-- [nfnl] fnl/plugins/conjure.fnl
vim.g["conjure#filetype#fennel"] = "conjure.client.fennel.nfnl"
vim.g["conjure#filetype#clojurescript"] = "conjure.client.clojure.nrepl"
vim.g["conjure#filetype#clojure"] = "conjure.client.clojure.nrepl"
vim.g["conjure#filetype#clojurex"] = "conjure.client.clojure.nrepl"
vim.g["conjure#filetype#clojurec"] = "conjure.client.clojure.nrepl"
vim.g["conjure#mapping#doc_word"] = "K"
return {"Olical/conjure", ft = {"clojure", "clojurescript", "fennel", "scheme", "lisp"}}
