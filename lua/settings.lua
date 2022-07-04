-- set.leader to comma/space key
vim.g.mapleader = 'z'
vim.g.maplocalleader = 'c'

-- Create splits vertically by default
vim.opt.diffopt = 'vertical'
-- set no swap files
vim.opt.swapfile = false
vim.opt.backup = false
-- And use undodir instead
-- Allow undo-ing even after save file
vim.opt.undodir = vim.fn.stdpath('config') .. '/.undo'
vim.opt.undofile = true
-- Hide 'No write since last change' error on switching buffers Keeps buffer open in the background.
vim.opt.hidden = true
-- update time for plugins (speed when they act)
vim.opt.updatetime = 300
-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.opt.signcolumn = 'number'
-- share clipboard in Linux
vim.opt.clipboard = 'unnamedplus'
-- Start scrolling when you're 15 away from bottom (and side)
vim.opt.scrolloff = 15
vim.opt.sidescrolloff = 35
-- line numbers
vim.opt.number = true

-- Indenting
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.tabstop = 2
vim.opt.expandtab = true

-- Plugins
vim.g.Illuminate_ftblacklist = {'NvimTree'}
vim.g.closetag_filenames = '*.html,*.jsx,*.js,*.tsx,*.vue'
vim.g.matchup_matchparen_offscreen = { method = 'popup' }
