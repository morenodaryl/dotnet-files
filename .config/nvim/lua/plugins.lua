vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'navarasu/onedark.nvim'

  use "lukas-reineke/indent-blankline.nvim"

  use 'neovim/nvim-lspconfig'

  -- use {'junegunn/fzf'}
  -- use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

end)


