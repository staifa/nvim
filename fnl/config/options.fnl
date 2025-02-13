(set vim.g.mapleader :c)
(set vim.g.maplocalleader :z)
; disable mouse
(set vim.o.mouse "")
; create splits vertically by default
(set vim.o.diffopt :vertical)
; allow undo-ing even after save file
(set vim.o.undodir (.. (vim.fn.stdpath "config") "/.undo"))
(set vim.o.undofile true)
; hide cmd line
(set vim.o.cmdheight 0)
; start scrolling when you're 15 away from bottom (and side)
(set vim.o.scrolloff 15)
(set vim.o.sidescrolloff 35)
; case insensitive search
(set vim.o.ignorecase true)
(set vim.o.smartcase true)
; shared clipboard with linux
(set vim.o.clipboard :unnamedplus)
; show line numbers
(set vim.o.number true)
; tabs is space
(set vim.o.expandtab true)
