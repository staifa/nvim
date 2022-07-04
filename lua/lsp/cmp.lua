local cmp_status_ok, cmp = pcall(require, "cmp")
local lspkind_status_ok, lspkind = pcall(require, "lspkind")

if not (cmp_status_ok and lspkind_status_ok) then
	print("CMP dependencies not yet installed!")
	return
end

-- Setup completion engine
if cmp_status_ok then
	cmp.setup({
		snippet = {
			expand = function(args)
				vim.fn["UltiSnips#Anon"](args.body)
			end,
		},
		formatting = {
			format = lspkind.cmp_format({
				mode = 'symbol',
			}),
		},
		mapping = {
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			['<C-k>'] = cmp.mapping.scroll_docs(-4),
      ['<C-j>'] = cmp.mapping.scroll_docs(4),
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp"},
			-- { name = "nvim_lua", max_item_count = 5 },
			{ name = "ultisnips", max_item_count = 5 },
			{ name = "buffer"},
		}),
	})
end
