# Clojure neovim config written in fennel that bleeds awesomeness #

WIP, but very much usable.

## Prerequisities ##

* [neovim](https://github.com/neovim/neovim) - obviously
* [patched font](https://github.com/ryanoasis/nerd-fonts) - for icons
* [lazygit](https://github.com/jesseduffield/lazygit) - I love fugitive, but it took a lot of tweaking to get it into a shape that was actually pleasant to work with for me, so I opted for less extensibility, but better out-of-the-box experience

## Installation ##

Clone to `~/.config/`. Don't touch files in the `lua/` folder, they are autogenerated by `fnfl`. The only non-fennel file that's supposed to be modified is `init.lua`.

## LSP Config ##

For autoformatting to work, some cljfmt config must be loaded. The LSP formatter will look for it the project folder, but it's good to have a local one that's used as a default. The project config will be merged into it anyway, but if no cljfm config is loaded, the formatter doesn't start. It's good to have it alongside the `config.edn` in `~/.config/clojure-lsp/`.

There is a barebone cljfmt config in the root of this repo. To use it, add its path to the LSP config.

```edn
;; ~/.config/clojure-lsp/config.edn
{:cljfmt-config-path "~/.config/nvim/.cljfmt.edn"}
```

All this and much more can be found in the [clojure-lsp docs](https://clojure-lsp.io/settings/).

## Managing language servers ##

[Mason](https://github.com/williamboman/mason.nvim) is used as a tool of choice. To bring up th ui, execute `:Mason`. Clojure, Lua and Fennel LSs should be installed automatically.

## Snippets ##

Are currently broken because of some issues with `cmp`. Low priority currently since I almost don't use them wih Clojure.

## Key bindings ##

It's all configurable, this is how I like it. Defaults are used for everythng else and can be easily found by a help tag telescope search - `<C-h>`.

Check docs and default mappings online or via help tags for

* [surround](https://github.com/tpope/vim-surround)
* [comments](https://github.com/numToStr/Comment.nvim)
* [targets](https://github.com/wellle/targets.vim)
* [conjure](https://github.com/Olical/conjure)

if you're not familiar with them. These plugins are extremely handy.

`<leader>` is mapped to `z` and `<localleader>` to `c`. This can be changed in `init.lua`.

| Key binding  | Effect                                     |
|--------------|--------------------------------------------|
| `gn`         | Switch to next buffer                      |
| `gp`         | Switch to previous buffer                  |
| `gx`         | Close buffer                               |
| `gX`         | Close all boffers except the current one   |
| `<Bacspace>` | Clear highlights                           |
| `to`         | Open new tab                               |
| `tn`         | Next tab                                   |
| `tp`         | Previous tab                               |
| `tx`         | Close tab                                  |
| `<M-w>`      | Easy motion by words                       |
| `<C-f>`      | Telescope - fuzzy find files               |
| `<C-j>`      | Telescope - live grep                      |
| `<C-b>`      | Telescope - currently open buffers         |
| `<C-h>`      | Telescope - help tags                      |
| `<C-s>`      | Telescope - resume last search             |
| `<C-u>`      | Scroll down in buffers and float docs      |
| `<C-d>`      | Scroll up in buffers and float docs        |
| `F2`         | Toggle directory tree                      |
| `gd`         | LSP - go to definition                     |
| `K`          | LSP - doc                                  |
| `<leader>ld` | LSP - declaration                          |
| `<leader>lt` | LSP - type definition                      |
| `<leader>lh` | LSP - signature help                       |
| `<leader>r ` | LSP - mass rename                          |
| `<leader>lq` | LSP diagnostics - setloclist               |
| `<leader>lf` | LSP - run formatter                        |
| `<leader>w`  | LSP diagnostics - go to next               |
| `<leader>W`  | LSP diagnostics - go to previous           |
| `<C-a>`      | LSP - code action menu                     |
| `<C-i>`      | LSP/Telescope - search for implementations |
| `<M-r>`      | LSP/Telescope - search for references      |
| `<M-d>`      | LSP/Telescope - search for diagnostics     |
| `<leader>gg` | Bring up Lazygit                           |
| `<leader>gp` | Git - preview hunk in the buffer           |
| `<leader>gb` | Git - blame in the buffer                  |
| `<leader>gs` | Git - stage hunk in the buffer             |
| `<leader>gS` | Git - stage whole buffer                   |
| `<leader>gu` | Git - undo stage hunk in the buffer        |
| `<leader>gr` | Git - reset in the buffer                  |
| `<leader>gd` | Git - show diff in a new split             |
| `<leader>gR` | Git - reset whole buffer                   |
| `<TAB>`      | Next in float windows                      |
| `<S-TAB>`    | Previous in float windows                  |
