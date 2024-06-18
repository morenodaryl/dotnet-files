---@diagnostic disable-next-line: undefined-global
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'github/copilot.vim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({
    "kdheepak/lazygit.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })
end)


