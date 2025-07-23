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
          -- ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          -- ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
          -- Disabled
          -- ['<Leader>k'] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          -- ['<Leader>j'] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Next buffer" },
          -- ["<Leader>w"] = false,
          -- -- FZF
          -- ["<C-p>"] = { "<cmd>OpenFiles<cr>", desc = "Telescope" },
          -- ["<C-f>"] = { "<cmd>Ag<cr>", desc = "FindFiles" },
          -- ["<Leader>ba"] = { "<cmd>Buffers<cr>", desc = "Buffers" },
          -- -- NERDTree
          -- ["<C-t>"] = { "<cmd>Neotree toggle<cr>", desc = "Tree toggle" },
          -- ["<Leader>n"] = { "<cmd>Neotree reveal<cr>", desc = "Tree reveal" },
          -- -- Buffer handling
          -- ["<Leader>o"] = { "<cmd>on<cr>", desc = "buffer only" },
          -- ["<Leader>ww"] = { "<cmd>Bdelete<cr>", desc = "Close buffer" },
          -- ['<C-H>'] = { '<cmd>BufferLineCyclePrev<cr>', desc = "Buffer prev", silent = true },
          -- ['<C-l>'] = { '<cmd>BufferLineCycleNext<cr>', desc = "Buffer next", silent = true },
          -- -- LSP 
          -- ["<Leader>a"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
          -- -- Reload Astro
          -- ["<Leader>rv"] = { "<cmd>AstroReload<cr>", desc = "Reload astro" },
          -- -- Tmux rails/rspec integration
          -- ["<Leader>rf"] = { "<cmd>exe \"!tmux send-keys -X -t \" . g:my_tmux_target . \" 'cancel'\"<cr><cr> <bar> :exe \"!tmux send -t \" . g:my_tmux_target . \" 'rspec \" . expand('%:p') . \" -f p' Enter\"<cr><cr>", desc = "run file" },
          -- ["<Leader>rk"] = { "<cmd>exe \"!tmux send-keys -X -t \" . g:my_tmux_target . \" 'cancel'\"<cr><cr> <bar> :exe \"!tmux send -t \" . g:my_tmux_target . \" 'rspec ' Up Enter\"<cr><cr>" },
          -- ["<Leader>rl"] = { "<cmd>exe \"!tmux send-keys -X -t \" . g:my_tmux_target . \" 'cancel'\"<cr><cr> <bar> :exe \"!tmux send -t \" . g:my_tmux_target . \" 'rspec \" . expand('%:p') . \":\" . line(\".\") . \" -f d' Enter\"<cr><cr>" },
          -- ["<Leader>rq"] = { "<cmd>exe \"!tmux send -t \" . g:my_tmux_target . \" 'exit-program' Enter\"<cr><cr>" },
          -- ["<Leader>rs"] = { "<cmd>exe \"!tmux send -t 3.0 'rails s' Enter\"<cr><cr>" },
          -- ["<Leader>ry"] = { "<cmd>exe \"!tmux send -t 2.0 'yarn serve' Enter\"<cr><cr>" },
          -- ["<Leader>]"] = { "<cmd>Gitsigns next_hunk<cr>", desc = "Next hunk" },
          -- ["<Leader>["] = { "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev hunk" },
          -- ['gf'] = { "<silent><cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to definition" },
          -- ["]g"] = { function() vim.diagnostic.goto_next() end, desc = "go to next diagnostic" },
          -- ["[g"] = { function() vim.diagnostic.goto_prev() end, desc = "go to prev diagnostic" },
        },
        t = {
          [']g'] = false,
          ['[g'] = false,
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
