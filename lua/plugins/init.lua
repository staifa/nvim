-- Utility settings loader
local setup = function(mod, remote)
	if remote == nil then
		-- If plugin does not need "require" setup, then just set it up.
		require(mod)
	else
		local status = pcall(require, remote)
		if not status then
			print(remote .. " is not downloaded.")
			return
		else
			local local_config = require(mod)
			if type(local_config) == "table" then
				local_config.setup()
			end
		end
	end
end

local no_setup = function(mod)
	local status = pcall(require, mod)
	if not status then
		print(mod .. " is not downloaded.")
		return
	else
		require(mod).setup({})
	end
end

local use = require('packer').use
require('packer').startup(function()
  -- it is recommened to put impatient.nvim before any other plugins
  use { 'lewis6991/impatient.nvim', config = [[require('impatient')]] }
  use 'wbthomason/packer.nvim'
  use 'qpkorr/vim-bufkill'
  use { 'ellisonleao/gruvbox.nvim', config = setup('plugins/gruvbox') }
  use 'stephpy/vim-yaml'
  use { 'Olical/conjure', config = setup('plugins.conjure') }
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-sleuth'
  use {
         'nvim-lualine/lualine.nvim',
         requires = {'kyazdani42/nvim-web-devicons', opt = true},
         config = setup('plugins.lualine', 'lualine'),
  }
  use {
         'alvarosevilla95/luatab.nvim',
	 config = setup('plugins/luatab', 'luatab'),
	 requires = 'kyazdani42/nvim-web-devicons',
  }
  use { 'tpope/vim-fugitive', config = setup('plugins.fugitive') }
  use { 'numToStr/FTerm.nvim', config = setup('plugins.fterm', 'FTerm') }
  use { 'kyazdani42/nvim-web-devicons', no_setup('nvim-web-devicons') }
  use { 'kyazdani42/nvim-tree.lua', config = setup('plugins.nvim_tree', 'nvim-tree') }
  use { 'karb94/neoscroll.nvim', config = setup('plugins.neoscroll', 'neoscroll') }
  use {
         'nvim-treesitter/nvim-treesitter',
         run = ':TSUpdate',
         config = setup('plugins.treesitter', 'nvim-treesitter'),
  }
  use { 'nvim-treesitter/playground', requires = 'nvim-treesitter/nvim-treesitter' }
  use { 'p00f/nvim-ts-rainbow', requires = 'nvim-treesitter/nvim-treesitter' }
  use 'ncm2/float-preview.nvim'
  use 'bakpakin/fennel.vim'
  use 'bfontaine/zprint.vim'
  use 'chase/vim-ansible-yaml'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
         'nvim-telescope/telescope.nvim',
         requires = 'nvim-lua/plenary.nvim',
         config = setup('plugins.telescope', 'telescope'),
  }
  use { 'eraserhd/parinfer-rust', run = 'cargo build --release'}
  use 'djoshea/vim-autoread'
  use { 'windwp/nvim-autopairs', config = setup('plugins.autopairs', 'nvim-autopairs') }
  use { 'gelguy/wilder.nvim', config = setup('plugins.wilder', 'wilder') }
  use 'AndrewRadev/tagalong.vim'
  use 'alvan/vim-closetag'
  use 'RRethy/vim-illuminate'
  use { 'numToStr/Comment.nvim', config = no_setup('Comment') }
  use { 'phaazon/hop.nvim', config = no_setup('hop') }
  use { 'kevinhwang91/nvim-bqf', ft = { 'qf' } }
  use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
  use { 'posva/vim-vue', ft = { 'vue' } }
  use 'andymass/vim-matchup'
  use 'ThePrimeagen/vim-be-good'
  use 'SirVer/ultisnips'
  use {
	'quangnguyen30192/cmp-nvim-ultisnips',
	config = setup('plugins.ultisnips'),
  }
  -- cmp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'onsails/lspkind-nvim'
  use { 'hrsh7th/cmp-nvim-lua', ft = { 'lua' } }
  use 'hrsh7th/cmp-nvim-lsp'
  use { 'jose-elias-alvarez/null-ls.nvim', config = setup('plugins.null', 'null-ls') }
end)
