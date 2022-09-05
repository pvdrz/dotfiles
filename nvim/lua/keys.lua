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
-- exit terminal mode using ESC
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('t', '<F2>', '<C-\\><C-n>:FloatermToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<F2>', ':FloatermToggle<CR>', { noremap = true })

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
vim.api.nvim_set_keymap('', '<BS><BS>', '"_dd', {})
-- disable middle mouse click pasting
vim.api.nvim_set_keymap('', '<MiddleMouse>',  '<Nop>', {})
vim.api.nvim_set_keymap('', '<2-MiddleMouse>',  '<Nop>', {})
vim.api.nvim_set_keymap('', '<3-MiddleMouse>',  '<Nop>', {})
vim.api.nvim_set_keymap('', '<4-MiddleMouse>',  '<Nop>', {})
vim.api.nvim_set_keymap('i', '<MiddleMouse>',  '<Nop>', {})
vim.api.nvim_set_keymap('i', '<2-MiddleMouse>',  '<Nop>', {})
vim.api.nvim_set_keymap('i', '<3-MiddleMouse>',  '<Nop>', {})
vim.api.nvim_set_keymap('i', '<4-MiddleMouse>',  '<Nop>', {})

-- Quickfix

-- toggle the quickfix buffer
vim.api.nvim_set_keymap('n', '<F4>', '<Plug>(qf_qf_toggle)', {})


-- Language Server Protocol

-- go to declaration
vim.api.nvim_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
-- go to definition
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
-- go to type definition
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>Telescope lsp_type_definitions<CR>', { noremap = true, silent = true })
-- go to implementations
vim.api.nvim_set_keymap('n', '<leader>i', '<cmd>Telescope lsp_implementations<CR>', { noremap = true, silent = true })
-- show hover information
vim.api.nvim_set_keymap('n', '<leader>m', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
-- format the current buffer
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
-- rename the current identifier
vim.api.nvim_set_keymap('n', '<leader>c', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
-- show code actions
vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
-- show diagnostics for the current line
vim.api.nvim_set_keymap('n', '<leader>l', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { noremap = true, silent = true })


-- Telescope

-- show references
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>Telescope lsp_references<CR>', { noremap = true, silent = true })
-- show workspace diagnostics
vim.api.nvim_set_keymap('n', '<leader>w', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
-- show document diagnostics
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>Telescope diagnostics bufnr=0<CR>', { noremap = true, silent = true })


-- Gitsigns
vim.api.nvim_set_keymap('n', '<leader>h', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('n', '<leader>H', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>u', ':Gitsigns reset_hunk<CR>', { noremap = true, silent = true })
