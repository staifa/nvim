-- Luafile
vim.keymap.set('n', '<leader>lf', ':luafile %<CR>')

-- Enter crates new line
vim.keymap.set('n', '<S-Enter>', ' O<Esc>')
vim.keymap.set('n', '<CR>', ' o<Esc>')

-- Buffer navigation
vim.keymap.set('n', 'gn', ':bn<cr>')
vim.keymap.set('n', 'gp', ':bp<cr>')
vim.keymap.set('n', 'gx', ':BD<cr>')
vim.keymap.set('n', 'gX', ':bd<cr>')

-- New tab
vim.keymap.set('n', '<C-n>', ':tabnew<CR>')

-- Hop bindings
vim.keymap.set('n', 'hh', ':HopWord<cr>')
vim.keymap.set('n', 'hl', ':HopLineStart<cr>')
vim.keymap.set('n', 'hp', ':HopPattern<cr>')

-- Space works in normal mode
vim.keymap.set('n', '<space>', ':s!^! !<CR>')
vim.keymap.set('n', '<Space>', 'i<Space><Esc>')
