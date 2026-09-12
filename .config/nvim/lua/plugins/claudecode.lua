-- Claude Code integration. Keymaps live under <leader>cc in lua/config/keymaps.lua.
return {
  "coder/claudecode.nvim",
  opts = {},
  cmd = {
    "ClaudeCode",
    "ClaudeCodeFocus",
    "ClaudeCodeAdd",
    "ClaudeCodeSend",
    "ClaudeCodeTreeAdd",
    "ClaudeCodeDiffAccept",
    "ClaudeCodeDiffDeny",
  },
}
