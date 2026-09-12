-- Replace the big "LazyVim" banner on the start screen with "DARYL".
-- Every line is padded to the same display width so the dashboard (which centers
-- each header line independently) keeps the banner aligned.
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
██████╗  █████╗ ██████╗ ██╗   ██╗██╗     
██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝██║     
██║  ██║███████║██████╔╝ ╚████╔╝ ██║     
██║  ██║██╔══██║██╔══██╗  ╚██╔╝  ██║     
██████╔╝██║  ██║██║  ██║   ██║   ███████╗
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝]],
      },
    },
  },
}
