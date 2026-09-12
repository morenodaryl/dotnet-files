-- tpope/vim-surround: add/change/delete surrounding pairs.
--   ys{motion}{char}  add surround   (e.g. ysiw"  -> surround word with ")
--   cs{old}{new}      change surround (e.g. cs"'   -> " becomes ')
--   ds{char}          delete surround (e.g. ds(    -> remove parens)
--   S{char}           in visual mode, surround the selection
-- vim-repeat makes `.` repeat these.
return {
  "tpope/vim-surround",
  event = "VeryLazy",
  dependencies = { "tpope/vim-repeat" },
}
