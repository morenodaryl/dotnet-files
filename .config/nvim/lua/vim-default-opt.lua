-- Set leader key
vim.g.mapleader = ' '

-- Editor options
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight current line number
vim.cmd('highlight LineNr ctermfg=4')

-- custom vim options
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.clipboard = 'unnamed'
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.foldmethod = 'manual'

-- PENDING gruvbox config

-- Custom variables 
vim.g.my_tmux_target = 3
vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_disable_when_zoomed = 1
vim.indentLine_char_list = {'|', '¦', '┆'}
 
-- fzf

vim.cmd [[ let g:fzf_layout = { 'down': '~40%' } ]]
vim.g.fzf_preview_window = { 'right:50%', 'ctrl-/' }
vim.g.fzf_history_dir = '~/.local/share/fzf-history'

-- vim.cmd [[ let g:fzf_preview_window = ['right,right,50%,<70(up,50%)', 'ctrl-/'] ]]
-- vim.g.fzf_preview_window = { 'right,right,50%,<70(up,50%)', 'ctrl-/' }
-- vim.g.fzf_layout = "{ 'window': { 'width': 0.95, 'height': 0.7 } }"
-- let g:fzf_preview_window = ['right,right,50%,<70(up,50%)', 'ctrl-/']
-- let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.7 } }
