vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use "lukas-reineke/indent-blankline.nvim"

  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use 'neovim/nvim-lspconfig'
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'm4xshen/autoclose.nvim'
  use 'preservim/nerdtree'

  use {
   "folke/trouble.nvim",
   requires = { "nvim-tree/nvim-web-devicons" },
   opts = {
     mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
   },
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
      "nvim-lua/plenary.nvim"
    },
  })
end)


