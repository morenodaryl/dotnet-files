vim.cmd('source ~/.config/nvim/vimrc.vim')

require('packer').install()
-- require('onedark').setup {
--     style = 'darker'
-- }
-- require('onedark').load()
-- require('telescope').load_extension('fzf')


-- vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"
-- vim.opt.termguicolors = true

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#2B2A2B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#3d3d3d gui=nocombine]]

-- require("indent_blankline").setup {
--   -- show_end_of_line = true,
--   show_current_context = true,
--   show_current_context_start = true,
--   char_highlight_list = {
--     "IndentBlanklineIndent1",
--     "IndentBlanklineIndent2",
--   },
-- }

require('telescope').setup({
  defaults = {
    layout_strategy = 'vertical'
    -- layout_config = {
    --   vertical = { width = 0.5 }
    --   -- other layout configuration here
    -- },
    -- other defaults configuration here
  },
  -- other configuration values here
})

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
