local status_ok, lualine = pcall(require, 'lualine')
if status_ok then
  -- Enable nvim-web-devicons plugin
  vim.cmd([[packadd nvim-web-devicons]])
else
	return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn' },
  symbols = { error = ' ', warn = ' ' },
  colored = false,
  always_visible = true,
}

local diff = {
  'diff',
  colored = false,
  symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
  cond = hide_in_width,
}

local spaces = function()
  return 'spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
end

local filetype = {
  'filetype',
  icons_enabled = true,
}

local location = {
  'location',
  padding = 0,
}

lualine.setup({
  options = {
    theme = 'auto',
    section_separators = '',
    component_separators = '',
    disabled_filetypes = { 'alpha', 'dashboard' },
    globalstatus = true,
    icons_enabled = true,
    always_divide_middle = true
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {'branch'},
    lualine_c = { diagnostics, 'filename' },
    lualine_x = { diff, spaces, 'encoding', filetype },
    lualine_y = { 'progress' },
    lualine_z = { location }
  }
})
