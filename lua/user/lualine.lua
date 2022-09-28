local status_ok, lualine = pcall(require, 'lualine')
if status_ok then
  -- Enable nvim-web-devicons plugin
  vim.cmd([[packadd nvim-web-devicons]])
else
	return
end

lualine.setup({
  options = {
    theme = 'papercolor_light',
    section_separators = '',
    component_separators = ''
  }
})
