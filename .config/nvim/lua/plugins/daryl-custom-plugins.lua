return {
  { 'junegunn/fzf', build = function() 
    vim.fn['fzf#install']() 
  end },
  { 'junegunn/fzf.vim' },
  { 'ryanoasis/vim-devicons' },
  { 'famiu/bufdelete.nvim' },
  { 'https://github.com/tpope/vim-fugitive.git' },
  { 'https://github.com/tpope/vim-surround.git' },
  { 'https://github.com/tomtom/tcomment_vim' },
  { 'morhetz/gruvbox' },
  { 'editorconfig/editorconfig-vim' },
  { 'christoomey/vim-tmux-navigator' },
  { 'Yggdroot/indentLine' },
  { 'lewis6991/gitsigns.nvim', opts = { add_default_mappings = false } },
  { 'nvim-lualine/lualine.nvim', 
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    options = {
      { theme = 'gruvbox' },
    },
    config = function()
      require('lualine').setup()
    end
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        '.__          ..  .               ',
        '|  \\ _.._.  .||\\/| _ ._. _ ._  _ ',
        '|__/(_][  \\_|||  |(_)[  (/,[ )(_)',
        '          ._|                    '
      }
      return opts
    end,
  },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
	      keymaps = {
	        accept_suggestion = "<C-l>",
	        clear_suggestion = "<C-j>",
	        accept_word = "<C-k>",
	      },
	      ignore_filetypes = { cpp = true }, -- or { "cpp", }
	      color = {
	        suggestion_color = "#ffffff",
	        cterm = 244,
	      },
	      log_level = "info", -- set to "off" to disable logging completely
	      disable_inline_completion = false, -- disables inline completion for use with cmp
	      disable_keymaps = false, -- disables built in keymaps for more manual control
	      condition = function()
	        return false
	      end -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
      })
    end,
  }
}

