return {
  {
    "junegunn/fzf",
    lazy = false,
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
  { "junegunn/fzf.vim", lazy = false },
  { "https://github.com/tomtom/tcomment_vim", lazy = false },
  { "https://github.com/tpope/vim-fugitive.git", lazy = false },
  { "https://github.com/tpope/vim-surround.git", lazy = false },
  { "christoomey/vim-tmux-navigator", lazy = false },
  { "Yggdroot/indentLine", lazy = false },
  { "morhetz/gruvbox", lazy = false },
}
