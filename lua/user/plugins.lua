local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
	print('Installing packer close and reopen Neovim...')
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'rounded' })
		end,
	},
	ensure_dependencies = true,
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	
	use 'wbthomason/packer.nvim'	-- Have packer manage itself
	use 'nvim-lua/plenary.nvim'	  -- Useful Lua functions used by a lot of plugins
	use 'nvim-lua/popup.nvim'	    -- An implementation of the Popup API from vim in Neovim.
  use 'morhetz/gruvbox'         -- Gruvbox colorscheme
  use {                         -- Gruvbox-baby colorscheme
    'luisiacc/gruvbox-baby', branch = 'main'
  }
  use {
    'nvim-lualine/lualine.nvim',-- Lualine (Bottom status line)
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {                         -- Bufferline (Tabline)
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'kyazdani42/nvim-tree.lua', -- File tree plugin
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- To comment code
  use 'numToStr/Comment.nvim'
  
  -- Gitsigns
  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release'
  }

  -- vim-fugitive - to commit and push
  use 'tpope/vim-fugitive'

  -- Telescope
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'

  -- For use with nvim-cmp
  use 'onsails/lspkind.nvim'

	-- Automatically setup your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require('packer.util').sync()
	end
end)
