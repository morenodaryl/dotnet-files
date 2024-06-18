return {
  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons', config = true },
  "https://github.com/tpope/vim-surround.git",
  "https://github.com/tpope/vim-fugitive.git",
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },
  -- FZF
  { 'junegunn/fzf', build = function() vim.fn['fzf#install']() end },
  'junegunn/fzf.vim',
}
