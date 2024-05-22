---------------------------------------------------
-- Initial setup ----------------------------------
---------------------------------------------------
vim.cmd('source ~/.config/nvim/vimrc.vim')
require('packer').install()

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#2B2A2B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#3d3d3d gui=nocombine]]
vim.o.mouse = 'a'

---------------------------------------------------
-- Initial Plugin Setuip --------------------------
---------------------------------------------------
require('telescope').setup({
  defaults = { layout_strategy = 'vertical' },
})

vim.opt.termguicolors = true

---------------------------------------------------
-- Mapping ----------------------------------------
---------------------------------------------------
vim.keymap.set('n', '<leader>rw', ':%s/\\<<C-r><C-w>\\>//g<left><left>', { silent = true })

vim.keymap.set('n', '<leader>ww', function()
  if vim.fn.winnr('$') > 1 then
    return ":b#<bar>bd#<CR>"
  else
    return ":bd<CR>"
  end
end, { expr = true, replace_keycodes = true, silent = true})

local keyset = vim.keymap.set

-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})
