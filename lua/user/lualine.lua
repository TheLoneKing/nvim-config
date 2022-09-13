local status_ok, lualine = pcall(require, 'lualine')
if status_ok then
  vim.cmd([[packadd nvim-web-devicons]])
else
	return
end

lualine.setup({
  options = { theme = 'dracula' }
})
