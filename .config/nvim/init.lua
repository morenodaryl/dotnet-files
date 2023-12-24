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

require("indent_blankline").setup {
  -- show_end_of_line = true,
  show_current_context = true,
  show_current_context_start = true,
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
}

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
