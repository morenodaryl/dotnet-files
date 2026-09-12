-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.root_lsp_ignore = { "vue_ls" }
vim.g.trouble_lualine = false

local opt = vim.opt
opt.smoothscroll = true
opt.spelllang = { "en" }
