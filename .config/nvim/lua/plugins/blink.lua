-- Completion behavior: don't auto-select an item, so <CR> only accepts once you
-- focus one. Use <Tab>/<S-Tab> to move through the list, then <CR> to accept.
return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      list = {
        -- Nothing selected when the menu opens; text isn't inserted until accept.
        selection = { preselect = false, auto_insert = false },
      },
    },
    keymap = {
      -- Move down the list (or jump a snippet placeholder, or insert a real Tab).
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      -- Accept the focused item; if nothing is focused, insert a newline.
      ["<CR>"] = { "accept", "fallback" },
    },
  },
}
