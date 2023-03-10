local notify = require('notify')

notify.setup({
  render = 'compact',
  stages = 'fade',
})

require('lsp-notify').setup({
  notify = notify,
})
