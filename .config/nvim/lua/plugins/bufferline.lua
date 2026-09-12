-- Make the active buffer's tab stand out: yellow background, black text.
local yellow = "#fabd2f" -- gruvbox bright yellow
local black = "#282828" -- gruvbox dark0 (near-black, readable)

local function hl(extra)
  return vim.tbl_extend("force", { fg = black, bg = yellow }, extra or {})
end

return {
  "akinsho/bufferline.nvim",
  opts = {
    highlights = {
      buffer_selected = hl({ bold = true, italic = false }),
      numbers_selected = hl(),
      modified_selected = hl(),
      duplicate_selected = hl({ italic = false }),
      close_button_selected = hl(),
      indicator_selected = hl(),
      pick_selected = hl({ bold = true }),
      diagnostic_selected = hl({ bold = true }),
      error_selected = hl({ bold = true }),
      error_diagnostic_selected = hl({ bold = true }),
      warning_selected = hl({ bold = true }),
      warning_diagnostic_selected = hl({ bold = true }),
      info_selected = hl({ bold = true }),
      info_diagnostic_selected = hl({ bold = true }),
      hint_selected = hl({ bold = true }),
      hint_diagnostic_selected = hl({ bold = true }),
    },
  },
}
