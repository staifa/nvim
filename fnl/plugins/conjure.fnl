(import-macros {: tx} :config.macros)

(set vim.g.conjure#filetype#fennel "conjure.client.fennel.nfnl")
(set vim.g.conjure#filetype#clojurescript "conjure.client.clojure.nrepl")
(set vim.g.conjure#filetype#clojure "conjure.client.clojure.nrepl")
(set vim.g.conjure#filetype#clojurex "conjure.client.clojure.nrepl")
(set vim.g.conjure#filetype#clojurec "conjure.client.clojure.nrepl")
(set vim.g.conjure#mapping#doc_word "K")

(tx :Olical/conjure
  {:ft ["clojure" "clojurescript" "fennel" "scheme" "lisp"]})
