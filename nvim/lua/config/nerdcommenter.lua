-- add heading space when commenting
vim.o.NERDSpaceDelims = 1
-- allow commenting empty lines
vim.o.NERDCommentEmptyLines = 1
-- comment in blocks
vim.o.NERDDefaultAlign = 'left'
-- do not load key mappings
vim.o.NERDCreateDefaultMappings = 0
-- toggle comments
vim.keymap.set('', '<F3>', '<Plug>NERDCommenterToggle', {})
