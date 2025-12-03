return {
  'mrcjkb/rustaceanvim',
  version = '^6',
  lazy = false,

  config = function()
    vim.g.rustaceanvim = {
      server = {
        settings = {
          ['rust-analyzer'] = {
            diagnostics = { disabled = { 'inactive-code' } },
          },
        },
      },
    }
  end,
}
