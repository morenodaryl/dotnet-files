local map = vim.keymap.set

map('n', "]g", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Prev diagnostic", silent = true })
map('n', "[g", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Next diagnostic", silent = true })
