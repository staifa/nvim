(import-macros {: tx} :config.macros)

(tx "eraserhd/parinfer-rust"
    {:build "cargo build --release"
     :config (fn [] true)})
