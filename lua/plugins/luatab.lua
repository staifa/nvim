vim.keymap.set("n", "<LocalLeader>gn", ":tabnext<CR>")
vim.keymap.set("n", "<LocalLeader>gp", ":tabprev<CR>")
vim.keymap.set("n", "<LocalLeader>gc", ":tabclose<CR> | :tabprev<CR>")
require("luatab").setup({
	separator = function()
		return ""
	end,
})
