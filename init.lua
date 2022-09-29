-- Disable netrw at the very start. We will use nvim-tree instead. 
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- Load the plugins
require('impatient')
require('user.plugins')
require('user.keymaps')
require('user.options')
require('user.colorscheme')
require('user.lualine')
require('user.bufferline')
require('user.nvimtree')
require('user.treesitter')
require('user.comment')
require('user.gitsigns')
require('user.fugitive')
require('user.telescope')
require('user.completion')
require('user.lsp')
require('user.indent')
