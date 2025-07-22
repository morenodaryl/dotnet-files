-- others
vim.api.nvim_create_user_command('G', function() vim.cmd('Git') vim.cmd('only') end, {})

-- Helpers
function cancel_tmux_cmd() vim.cmd("silent! !tmux send-keys -X -t " .. vim.g.my_tmux_target .. " 'cancel'") end
function tmux_cmd(command)
  vim.cmd("silent! !tmux send-keys -X -t " .. vim.g.my_tmux_target .. " 'cancel'")
  vim.cmd("silent! !tmux send -t " .. vim.g.my_tmux_target .. " '" .. command .. "' Enter")
end

-- Key mappings
function map(mode, lhs, rhs, opts) vim.keymap.set(mode, lhs, rhs, opts) end
function nmap(lhs, rhs, opts) return map('n', lhs, rhs, opts) end
function imap(lhs, rhs, opts) return map('i', lhs, rhs, opts) end
function vmap(lhs, rhs, opts) return map('v', lhs, rhs, opts) end
function cmap(lhs, rhs, opts) return map('c', lhs, rhs, opts) end

nmap('n', function()
  return (vim.v.searchforward == 1 and 'n' or 'N') .. 'zz'
end, { expr = true, noremap = true })
nmap('N', function()
  return (vim.v.searchforward == 1 and 'N' or 'n') .. 'zz'
end, { expr = true, noremap = true })
nmap('<Space>', '<Nop>', { noremap = true, silent = true })
imap('jk', '<Esc>', { noremap = true })
nmap('zt', 'ztkj', { noremap = true })
nmap('<leader>rv', ':source ~/.config/nvim/init.lua<CR>', { noremap = true })
nmap('<leader>]', function() vim.diagnostic.goto_next() end, { noremap = true })
nmap('<leader>[', function() vim.diagnostic.goto_prev() end, { noremap = true })
-- nmap('<slient>gD', '<Plug>(coc-implementation)', { noremap = true })
-- nmap('<slient>gr', '<Plug>(coc-references)', { noremap = true })
-- nmap('<leader>qf', '<Plug>(coc-fix-current)', { noremap = true })
-- nmap('<leader>rn', '<Plug>(coc-rename)', { noremap = true })
-- nmap('<slient><leader>a', '<Plug>(coc-codeaction-cursor)', { noremap = true })
-- nmap('<slient><leader>a', '<Plug>(coc-codeaction-selected)', { noremap = true })
-- nmap('<leader>qd', ':CocDiagnostics<cr>', { noremap = true })
cmap('<C-p>', '<Up>', { noremap = true })
cmap('<C-n>', '<down>', { noremap = true })
nmap('<leader>n', ':NERDTreeFind<CR>', { noremap = true })
nmap('<C-n>', ':NERDTree<CR>', { noremap = true })
nmap('<C-t>', ':NERDTreeToggle<CR>', { noremap = true })
nmap('<leader>k', ':bn<CR>', { noremap = true })
nmap('<leader>j', ':bp<CR>', { noremap = true })
nmap('<leader>o', ':on<CR>', { noremap = true })
nmap('<leader>+', ':12winc +<CR>', { noremap = true })
nmap('<leader>-', ':12winc -<CR>', { noremap = true })
nmap('<leader>=', ':12winc ><CR>', { noremap = true })
nmap('<leader>_', ':12winc <<CR>', { noremap = true })
nmap('<silent><leader>]', ':Gitsigns next_hunk<CR>', { noremap = true })
nmap('<silent><leader>[', ':Gitsigns prev_hunk<CR>', { noremap = true })
nmap('<silent><leader>gs', ':Gitsigns stage_hunk<CR>', { noremap = true })
nmap('<silent><leader>gu', ':Gitsigns undo_stage_hunk<CR>', { noremap = true })
nmap('<silent><leader>gr', ':Gitsigns reset_hunk<CR>', { noremap = true })
nmap('<silent><leader>gp', ':Gitsigns preview_hunk<CR>', { noremap = true })
nmap('<silent><leader>gb', ':Gitsigns blame_line<CR>', { noremap = true })
nmap('<leader>rf', function() tmux_cmd('rspec ' .. vim.fn.expand('%:p') .. ' -f p') end, { noremap = true })
nmap('<leader>rl', function() tmux_cmd('rspec ' .. vim.fn.expand('%:p') .. ':' .. vim.fn.line('.') .. ' -f d') end, { noremap = true })
nmap('<leader>rk', function() cancel_tmux_cmd(); vim.cmd("silent! !tmux send -t " .. vim.g.my_tmux_target .. " 'rspec ' Up Enter") end, { noremap = true })
nmap('<leader>rq', function() vim.cmd("silent! !tmux send -t " .. vim.g.my_tmux_target .. " 'exit-program' Enter") end, { noremap = true })
nmap('<leader>rb', function() vim.cmd("silent! !tmux send -t " .. vim.g.my_tmux_target .. " 'break '" ..  vim.fn.expand('%:p') .. ":" .. vim.fn.line('.') .. " Enter") end, { noremap = true })
nmap('<leader>rj', function() tmux_cmd('yarn vitest ' .. vim.fn.expand('%:p')) end, { noremap = true })
nmap('<leader>rc', ':!rubocop -a %<CR>', { noremap = true })
nmap('<leader>rp', ':!yarn eslint --fix --ext .vue,.ts,.js %<CR>', { noremap = true })
nmap('<slient><C-h>', '<C-U>TmuxNavigateLeft<cr>', { noremap = true })
nmap('<slient><C-j>', '<C-U>TmuxNavigateDown<cr>', { noremap = true })
nmap('<slient><C-k>', '<C-U>TmuxNavigateUp<cr>', { noremap = true })
nmap('<slient><C-l>', '<C-U>TmuxNavigateRight<cr>', { noremap = true })
vmap('<C-r>', '"hy:s/<C-r>h//g<left><left>', { noremap = true })

-- fzf pending

print('Custom keymaps loaded')

