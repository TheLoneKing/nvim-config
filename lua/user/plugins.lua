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
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

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
    'luisiacc/gruvbox-baby', tag = '0.1.8'
  }
  use {
    'nvim-lualine/lualine.nvim',-- Lualine (Bottom status line)
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {                         -- Bufferline (Tabline)
    'akinsho/bufferline.nvim',
    tag = "v2.12.0",
    requires = 'nvim-tree/nvim-web-devicons'
  }
  use {
    'nvim-tree/nvim-tree.lua', tag = 'compat-nvim-0.7', -- File tree plugin
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  -- Line indent guide
  use {
    'lukas-reineke/indent-blankline.nvim', tag = 'v2.20.2'
  }

  use {
    'nvim-treesitter/nvim-treesitter', commit = 'aebc6cf',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- To comment code
  use {
    'numToStr/Comment.nvim', tag = 'v0.7.0'
  }

  -- Gitsigns
  use {
    'lewis6991/gitsigns.nvim', tag = 'v0.5'
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

  -- LSP
  use {
    'neovim/nvim-lspconfig', tag = 'v0.1.3'
  }
  use 'williamboman/nvim-lsp-installer'   -- Provides automatic installs for several LSP. TODO: Replace with Mason
  use 'RRethy/vim-illuminate'             -- highlight references of the word under the cursor
  use 'mfussenegger/nvim-jdtls'           -- Java LSP Plugin

  -- Debug
  use {
    'mfussenegger/nvim-dap', tag = '0.4.0'
  }
  use 'theHamsta/nvim-dap-virtual-text'

  -- Snippets
  use 'L3MON4D3/LuaSnip'

  -- To speed up neovim startup
  use 'lewis6991/impatient.nvim'

  -- Startup page
  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }

	-- Automatically setup your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require('packer.util').sync()
	end
end)
