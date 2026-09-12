-- -- Keymaps are automatically loaded on the VeryLazy event
-- -- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- -- Add any additional keymaps here
--
-- local map = vim.keymap.set
--
-- -- "jk" to escape insert mode
-- map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
--
-- -- Ctrl+p to find files (LazyVim.pick is picker-agnostic; uses snacks here)
-- map("n", "<C-p>", function()
--   LazyVim.pick("files")()
-- end, { desc = "Find Files" })
--
-- -- Ctrl+f to find a word across the project (live grep)
-- map("n", "<C-f>", function()
--   LazyVim.pick("live_grep")()
-- end, { desc = "Grep (Find in project)" })
--
-- -- <leader>ww to delete the current buffer
-- map("n", "<leader>ww", "<cmd>bd<cr>", { desc = "Delete Buffer" })

-- others
-- `:G` / `:Git` are provided by vim-fugitive (see lua/plugins/fugitive.lua).

-- Helpers
function cancel_tmux_cmd()
  vim.cmd("silent! !tmux send-keys -X -t " .. vim.g.my_tmux_target .. " 'cancel'")
end

function tmux_cmd(command)
  vim.cmd("silent! !tmux send-keys -X -t " .. vim.g.my_tmux_target .. " 'cancel'")
  vim.cmd("silent! !tmux send -t " .. vim.g.my_tmux_target .. " '" .. command .. "' Enter")
end
vim.api.nvim_create_user_command("OpenFiles", function()
  vim.fn.system("git rev-parse --is-inside-work-tree")
  if vim.v.shell_error == 0 then
    Snacks.picker.git_files()
  else
    Snacks.picker.files()
  end
end, {})

vim.api.nvim_create_user_command("RubyCmds", function()
  -- Capture the active buffer's path and cursor line now, before vim.ui.select changes focus.
  local current_path = vim.api.nvim_buf_get_name(0)
  local current_line = vim.fn.line(".")
  local options = {
    {
      name = "Load in console",
      cmd = function()
        tmux_cmd('load "' .. vim.fn.expand("%") .. '"')
      end,
    },
    {
      name = "Rubocop file",
      cmd = function()
        tmux_cmd("rubocop -a -- " .. vim.fn.expand("%"))
      end,
    },
    {
      name = "Copy Relative Path",
      cmd = function()
        local rel = vim.fn.fnamemodify(current_path, ":.")
        vim.fn.setreg("+", rel)
        vim.notify("Copied: " .. rel)
      end,
    },
    {
      name = "Copy Relative Line",
      cmd = function()
        local rel = vim.fn.fnamemodify(current_path, ":.") .. ":" .. current_line
        vim.fn.setreg("+", rel)
        vim.notify("Copied: " .. rel)
      end,
    },
    {
      name = "Copy Path",
      cmd = function()
        vim.fn.setreg("+", current_path)
        vim.notify("Copied: " .. current_path)
      end,
    },
    {
      name = "Set tmux target",
      cmd = function()
        vim.ui.input({
          prompt = "tmux target: ",
          default = tostring(vim.g.my_tmux_target or ""),
        }, function(input)
          if input and input ~= "" then
            vim.g.my_tmux_target = input
            vim.notify("tmux target set to " .. input)
          end
        end)
      end,
    },
  }
  vim.ui.select(options, {
    prompt = "Choose an action:",
    format_item = function(item)
      return item.name
    end,
  }, function(choice)
    if choice then
      choice.cmd()
    end
  end)
end, {})

-- Key mappings
function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end
function nmap(lhs, rhs, opts)
  return map("n", lhs, rhs, opts)
end
function imap(lhs, rhs, opts)
  return map("i", lhs, rhs, opts)
end
function vmap(lhs, rhs, opts)
  return map("v", lhs, rhs, opts)
end
function cmap(lhs, rhs, opts)
  return map("c", lhs, rhs, opts)
end

cmap("<C-n>", "<down>", { noremap = true, desc = "Cmdline: next history / down" })
cmap("<C-p>", "<Up>", { noremap = true, desc = "Cmdline: prev history / up" })
imap("jk", "<Esc>", { noremap = true, desc = "Exit insert mode" })
vmap("<C-r>", '"hy:%s/<C-r>h//g<left><left>', { noremap = true, desc = "Substitute selected text" })

nmap("<Space>", "<Nop>", { noremap = true, silent = true, desc = "Leader (disable Space motion)" })

-- Unset LazyVim's <C-/> terminal toggle (we use tmux; also frees <C-/> so fzf can
-- use it to toggle its preview). LazyVim maps these in modes n + t in its default
-- config/keymaps.lua, which loads BEFORE this file, so deleting here is reliable.
-- <C-_> is the byte many terminals actually send for <C-/>.
pcall(vim.keymap.del, { "n", "t" }, "<C-/>")
pcall(vim.keymap.del, { "n", "t" }, "<C-_>")

-- fzf.vim `:Ag` (the_silver_searcher). Plugin spec is in lua/plugins/fzf.lua.
nmap("<C-f>", "<cmd>Ag<cr>", { noremap = true, desc = "Ag (find in project)" })
-- `Files` was fzf.vim -> snacks file picker
nmap("<S-f>", "<cmd>Files<cr>", { desc = "Find Files" })
-- <C-h/j/k/l> tmux navigation is provided by vim-tmux-navigator (see lua/plugins/tmux.lua)
nmap("<c-p>", "<cmd>GFiles<cr>", { desc = "Find Files" })
-- nmap("<C-p>", function()
--   LazyVim.pick("files")()
-- end, { desc = "Find Files" })
-- Toggle the neo-tree file explorer.
nmap("<C-t>", function()
  require("neo-tree.command").execute({ toggle = true })
end, { desc = "Neotree toggle" })
nmap("<leader>+", ":12winc +<CR>", { noremap = true, desc = "Increase window height" })
nmap("<leader>-", ":12winc -<CR>", { noremap = true, desc = "Decrease window height" })
nmap("<leader>=", ":12winc ><CR>", { noremap = true, desc = "Increase window width" })
nmap("<leader>[", function()
  require("gitsigns").nav_hunk("prev")
end, { desc = "Prev hunk" })
nmap("<leader>]", function()
  require("gitsigns").nav_hunk("next")
end, { desc = "Next hunk" })
nmap("<leader>_", ":12winc <<CR>", { noremap = true, desc = "Decrease window width" })
nmap("<leader>a", vim.lsp.buf.code_action, { desc = "Code Action" })
nmap("<leader>ba", function()
  LazyVim.pick("buffers")()
end, { desc = "Buffers" })
nmap("<leader>gb", "<cmd>Gitsigns blame_line<cr>", { silent = true, desc = "Blame line" })
nmap("<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { silent = true, desc = "Preview hunk" })
nmap("<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", { silent = true, desc = "Reset hunk" })
nmap("<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", { silent = true, desc = "Stage hunk" })
nmap("<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", { silent = true, desc = "Undo stage hunk" })
-- Git history of the current line / visual selection (git log -L<start>,<end>:file)
local function git_log_lines(line1, line2)
  local file = vim.fn.expand("%:p")
  if file == "" then
    return vim.notify("No file for the current buffer", vim.log.levels.WARN)
  end
  local dir = vim.fn.fnamemodify(file, ":h")
  local spec = string.format("%d,%d:%s", line1, line2, file)
  local out = vim.fn.systemlist({ "git", "-C", dir, "log", "-L", spec })
  if vim.v.shell_error ~= 0 then
    return vim.notify(table.concat(out, "\n"), vim.log.levels.ERROR, { title = "git log -L" })
  end
  vim.cmd("botright vsplit")
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(0, buf)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, out)
  vim.bo[buf].filetype = "git"
  vim.bo[buf].modifiable = false
  vim.bo[buf].bufhidden = "wipe"
  vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf, silent = true, desc = "Close" })
end
vim.api.nvim_create_user_command("GitLogLines", function(o)
  git_log_lines(o.line1, o.line2)
end, { range = true, desc = "Git history of the selected lines" })
nmap("<leader>gh", ":GitLogLines<cr>", { silent = true, desc = "Git history (line)" })
vmap("<leader>gh", ":GitLogLines<cr>", { silent = true, desc = "Git history (selection)" })
-- astrocore.buffer.nav was AstroNvim-only -> use standard buffer nav
nmap("<leader>j", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
nmap("<leader>k", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- Reveal the current file in neo-tree.
nmap("<leader>n", function()
  require("neo-tree.command").execute({ reveal = true })
end, { desc = "Neotree reveal" })
nmap("<leader>o", ":on<CR>", { noremap = true, desc = "Close other windows", silent = true })
nmap("<leader>rb", function()
  vim.cmd(
    "silent! !tmux send -t "
      .. vim.g.my_tmux_target
      .. " 'break '"
      .. vim.fn.expand("%:p")
      .. ":"
      .. vim.fn.line(".")
      .. " Enter"
  )
end, { noremap = true, desc = "Set breakpoint at line (tmux)" })
nmap("<leader>rc", ":!rubocop -a %<CR>", { noremap = true, desc = "Rubocop autocorrect file" })
nmap("<leader>ro", ":RubyCmds<cr>", { noremap = true, desc = "Ruby commands menu" })
nmap("<leader>rf", function()
  tmux_cmd("rspec " .. vim.fn.expand("%:p") .. " -f p")
end, { noremap = true, desc = "RSpec file (progress, tmux)" })
nmap("<leader>rj", function()
  tmux_cmd("yarn vitest " .. vim.fn.expand("%:p"))
end, { noremap = true, desc = "Vitest current file (tmux)" })
nmap("<leader>rk", function()
  cancel_tmux_cmd()
  vim.cmd("silent! !tmux send -t " .. vim.g.my_tmux_target .. " 'rspec ' Up Enter")
end, { noremap = true, desc = "RSpec: rerun last (tmux)" })
nmap("<leader>rl", function()
  tmux_cmd("rspec " .. vim.fn.expand("%:p") .. ":" .. vim.fn.line(".") .. " -f d")
end, { noremap = true, desc = "RSpec at current line (doc, tmux)" })
nmap(
  "<leader>rp",
  ":!yarn eslint --fix --ext .vue,.ts,.js %<CR>",
  { noremap = true, desc = "ESLint --fix current file" }
)
nmap("<leader>rq", function()
  vim.cmd("silent! !tmux send -t " .. vim.g.my_tmux_target .. " 'exit-program' Enter")
end, { noremap = true, desc = "Quit program in tmux pane" })
-- `AstroReload` was AstroNvim-only. In LazyVim reload plugins with `:Lazy reload <plugin>`
-- or restart nvim; there is no equivalent single-command full reload.
nmap("<leader>ww", function()
  Snacks.bufdelete()
end, { desc = "Close buffer" })
nmap("[g", function()
  vim.diagnostic.goto_prev()
end, { noremap = true, desc = "Go to prev diagnostic" })
nmap("]g", function()
  vim.diagnostic.goto_next()
end, { noremap = true, desc = "Go to next diagnostic" })
-- nmap("n", function()
--   return (vim.v.searchforward == 1 and "n" or "N") .. "zz"
-- end, { expr = true, noremap = true })
-- nmap("N", function()
--   return (vim.v.searchforward == 1 and "N" or "n") .. "zz"
-- end, { expr = true, noremap = true })
nmap("zt", "ztkj", { noremap = true, desc = "Scroll cursor near top" })

-- claudecode.nvim actions under the <leader>cc prefix (plugin: lua/plugins/claudecode.lua)
local wk_ok, wk = pcall(require, "which-key")
if wk_ok then
  wk.add({ { "<leader>cc", group = "claude", mode = { "n", "v" } } })
end
nmap("<leader>ccc", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
nmap("<leader>ccf", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude" })
nmap("<leader>ccr", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume Claude" })
nmap("<leader>ccC", "<cmd>ClaudeCode --continue<cr>", { desc = "Continue Claude" })
nmap("<leader>ccb", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add current buffer" })
vmap("<leader>ccs", "<cmd>ClaudeCodeSend<cr>", { desc = "Send to Claude" })
nmap("<leader>cca", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept diff" })
nmap("<leader>ccd", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny diff" })
-- In file-tree buffers, <leader>ccs adds the file under the cursor to Claude.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "neo-tree", "NvimTree", "oil" },
  callback = function(ev)
    vim.keymap.set("n", "<leader>ccs", "<cmd>ClaudeCodeTreeAdd<cr>", {
      buffer = ev.buf,
      desc = "Add file to Claude",
    })
  end,
})
