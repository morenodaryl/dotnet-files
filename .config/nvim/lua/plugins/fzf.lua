-- Classic fzf.vim (junegunn) so `:Ag`, `:Files`, `:GFiles`, `:Buffers`, `:Rg`, etc. work.
-- Requires the `ag` (the_silver_searcher) binary on PATH for `:Ag`.
return {
  {
    "junegunn/fzf",
    -- Downloads the fzf binary into the plugin dir on install/update.
    build = "./install --bin",
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    -- Enable fzf's query history. With a history dir set, CTRL-P / CTRL-N are
    -- rebound to previous-history / next-history (cycle past search queries)
    -- instead of up / down. Arrow keys still move through the result list.
    init = function()
      vim.g.fzf_history_dir = vim.fn.stdpath("data") .. "/fzf-history"
      -- Preview on the right, toggled with Ctrl-/ inside the fzf window.
      -- (Requires LazyVim's terminal-mode <C-/> mapping to be unset so the
      -- keystroke reaches fzf -- see lua/config/keymaps.lua.)
      vim.g.fzf_vim = { preview_window = { "right,50%", "ctrl-/" } }
    end,
    -- Lazy-load when any of these commands are first used.
    cmd = {
      "Ag",
      "Rg",
      "Files",
      "GFiles",
      "Buffers",
      "Lines",
      "BLines",
      "History",
    },
  },
}
