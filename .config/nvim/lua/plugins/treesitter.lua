---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/playground"
    },
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "lua",
        "vim",
        "ruby",
        "vue",
      })
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

       vim.api.nvim_create_autocmd("FileType", {
        pattern = "ruby",
        callback = function()
          vim.api.nvim_set_hl(0, "@function.call", { fg = "#FABD2F" })
          vim.api.nvim_set_hl(0, "@variable", { fg = "#eddbb4" })
          vim.api.nvim_set_hl(0, "@number", { fg = "#eddbb4" })
          vim.api.nvim_set_hl(0, "@keyword.special", { fg = "#FB4934" })
          -- Add more Ruby-specific highlight overrides here
        end,
      })
    end,
  }
}
