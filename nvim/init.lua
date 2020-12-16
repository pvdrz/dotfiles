require('plugins')
require('keys')
require('look')
require('misc')

require('plugins.nerdcommenter')
require('plugins.gitgutter')
require('plugins.lexima')
require('plugins.lightline')
require('plugins.deoplete')
require('plugins.languageclient')
vim.api.nvim_command([[
let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_virtualTextPrefix = ''
let g:LanguageClient_loggingFile =  expand('~/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/LanguageServer.log')
]])
