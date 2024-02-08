local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
  return
end

bufferline.setup {
  options = {
    buffer_close_icon = '',
    diagnostics = 'nvim_lsp',
    numbers = 'buffer_id'
  }
}
