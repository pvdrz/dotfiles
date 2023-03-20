local notify = require('notify')

notify.setup({
  render = 'compact',
  stages = 'fade',
  background_colour = "#2e3440",
})

require('lsp-notify').setup({
  notify = notify,
})
