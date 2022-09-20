local keymap = vim.keymap.set

keymap('n', '<leader>gs', '<cmd>Git status<CR>', { noremap = true })
keymap('n', '<leader>gc', '<cmd>Git commit<CR>', { noremap = true })
keymap('n', '<leader>gp', '<cmd>Git push<CR>', { noremap = true })
keymap('n', '<leader>gl', '<cmd>winc S<CR><cmd>Gclog<CR><C-w>j<cmd>resize -6<CR>', { noremap = true })
