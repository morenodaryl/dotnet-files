vim.g.my_tmux_target = "DS:testing.0"

vim.api.nvim_create_user_command('OpenFiles', function()
  vim.fn.system('git rev-parse --is-inside-work-tree')
  if vim.v.shell_error == 0 then
    vim.cmd('GFiles')
  else
    vim.cmd('Files')
  end
end, {})

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        i = {
          ['jj'] = false
        },
        n = {
          -- Disabled
          ["<Leader>w"] = false,
          -- FZF
          ["<C-p>"] = { "<cmd>OpenFiles<cr>", desc = "Telescope" },
          ["<C-f>"] = { "<cmd>Ag<cr>", desc = "FindFiles" },
          ["<Leader>ba"] = { "<cmd>Buffers<cr>", desc = "Buffers" },
          -- NERDTree
          ["<C-t>"] = { "<cmd>Neotree toggle<cr>", desc = "Tree toggle" },
          ["<Leader>n"] = { "<cmd>Neotree reveal<cr>", desc = "Tree reveal" },
          -- LSP 
          ["<Leader>a"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
          -- Reload Astro
          ["<Leader>rv"] = { "<cmd>AstroReload<cr>", desc = "Reload astro" },
          -- Buffer handling
          ["<Leader>j"] = { "<cmd>norm [b<cr>", desc = "Next buffer" },
          ["<Leader>k"] = { "<cmd>norm ]b<cr>", desc = "Prev buffer" },
          ["<Leader>o"] = { "<cmd>on<cr>", desc = "buffer only" },
          ["<Leader>ww"] = { "<cmd>bd<cr>", desc = "Close buffer" },
          -- Tmux rails/rspec integration
          ["<Leader>rf"] = { "<cmd>exe \"!tmux send-keys -X -t \" . g:my_tmux_target . \" 'cancel'\"<cr><cr> <bar> :exe \"!tmux send -t \" . g:my_tmux_target . \" 'rspec \" . expand('%:p') . \" -f p' Enter\"<cr><cr>", desc = "run file" },
          ["<Leader>rk"] = { "<cmd>exe \"!tmux send-keys -X -t \" . g:my_tmux_target . \" 'cancel'\"<cr><cr> <bar> :exe \"!tmux send -t \" . g:my_tmux_target . \" 'rspec ' Up Enter\"<cr><cr>" },
          ["<Leader>rl"] = { "<cmd>exe \"!tmux send-keys -X -t \" . g:my_tmux_target . \" 'cancel'\"<cr><cr> <bar> :exe \"!tmux send -t \" . g:my_tmux_target . \" 'rspec \" . expand('%:p') . \":\" . line(\".\") . \" -f d' Enter\"<cr><cr>" },
          ["<Leader>rq"] = { "<cmd>exe \"!tmux send -t \" . g:my_tmux_target . \" 'exit-program' Enter\"<cr><cr>" },
          ["<Leader>rs"] = { "<cmd>exe \"!tmux send -t 3.0 'rails s' Enter\"<cr><cr>" },
          ["<Leader>ry"] = { "<cmd>exe \"!tmux send -t 2.0 'yarn serve' Enter\"<cr><cr>" },
          
          -- ["[g"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "go to prev diagnostic", silent = true },
          -- ["]g"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "go to next diagnostic", silent = true },
        },
        t = {
          ["<Leader>j"] = { "]b", desc = "Next buffer" },
          ["<Leader>k"] = { "[b", desc = "Prev buffer" },
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function()
              vim.lsp.buf.hover()
            end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function()
              vim.lsp.buf.declaration()
            end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
