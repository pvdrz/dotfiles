-- Basics

-- remap leader
vim.g.mapleader = ","
-- remap U to u
vim.api.nvim_set_keymap('', 'U', 'u', { noremap = true })
-- remap :W to :w
-- FIXME: Remove vimscript (Blocked on https://github.com/neovim/neovim/pull/11613).
vim.api.nvim_command('command! -bar -nargs=* -complete=file -range=% -bang W <line1>,<line2>write<bang> <args>')
vim.api.nvim_command('command! -bar -nargs=* -complete=file -range=% -bang Wq <line1>,<line2>wq<bang> <args>')
vim.api.nvim_command('command! -bar -nargs=* -complete=file -range=% -bang WQ <line1>,<line2>wq<bang> <args>')
vim.api.nvim_command('command! -bar -nargs=* -complete=file -bang Q q<bang>')
-- unmap s
vim.api.nvim_set_keymap('', 's', '', {})
-- toggle comments
vim.api.nvim_set_keymap('', '<F3>', '<Plug>NERDCommenterToggle', {})


-- Navigation

-- move to next/previous buffer
vim.api.nvim_set_keymap('', '<A-Left>', ':bp<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-Right>', ':bn<CR>', { noremap = true })
-- move to the upper/lower split
vim.api.nvim_set_keymap('', '<A-Up>', '<C-w><Up>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-Down>', '<C-w><Down>', { noremap = true })


-- Edition

-- use blackhole register for the next action
vim.api.nvim_set_keymap('', '<leader>b', '"_', {})
-- use backspace to delete to blackhole register
vim.api.nvim_set_keymap('', '<BS>', '"_d', {})


-- Code Completion

-- use Tab and S-Tab to traverse completions
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { noremap = true, expr = true })


-- Quickfix

-- go to previous diagnostic
vim.api.nvim_set_keymap('n', '<leader>p', '<Plug>(qf_qf_previous)', {})
-- go to next diagnostic
vim.api.nvim_set_keymap('n', '<leader>n', '<Plug>(qf_qf_next)', {})
-- toggle the quickfix buffer
vim.api.nvim_set_keymap('n', '<F4>', '<Plug>(qf_qf_toggle)', {})


-- Language client

-- go to definition
vim.api.nvim_set_keymap('n', '<leader>d', ':call LanguageClient#textDocument_definition()<CR>', { })
-- go to type definition
vim.api.nvim_set_keymap('n', '<leader>t', ':call LanguageClient#textDocument_typeDefinition()<CR>', {})
-- show references in the quickfix list
vim.api.nvim_set_keymap('n', '<leader>r', ':call LanguageClient_textDocument_references()<CR>', {})
-- show hover information
vim.api.nvim_set_keymap('n', '<leader>m', ':call LanguageClient_textDocument_hover()<CR>', {})
-- format the current buffer
vim.api.nvim_set_keymap('n', '<leader>f', ':call LanguageClient#textDocument_formatting_sync()<CR>', {})
