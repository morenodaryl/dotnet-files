-- Show the search match count (e.g.  3/12) in the statusline while a search is
-- active. Updates as you press n/N; disappears after :nohlsearch.
return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local search_count = {
      function()
        if vim.v.hlsearch == 0 then
          return ""
        end
        local ok, sc = pcall(vim.fn.searchcount, { maxcount = 999, timeout = 250 })
        if not ok or type(sc) ~= "table" or (sc.total or 0) == 0 then
          return ""
        end
        if sc.incomplete == 1 then
          return " ?/?"
        end
        local current = sc.current > sc.maxcount and (">" .. sc.maxcount) or tostring(sc.current)
        local total = sc.total > sc.maxcount and (">" .. sc.maxcount) or tostring(sc.total)
        return string.format(" %s/%s", current, total)
      end,
    }

    opts.sections = opts.sections or {}
    opts.sections.lualine_x = opts.sections.lualine_x or {}
    table.insert(opts.sections.lualine_x, 1, search_count)

    -- Remove the clock from the far-right section (time already shown in tmux).
    opts.sections.lualine_z = {}

    -- Remove the scroll-percentage ("progress") component, keep line:col.
    for _, section in ipairs({ "lualine_y", "lualine_z" }) do
      local comps = opts.sections[section]
      if comps then
        for i = #comps, 1, -1 do
          local c = comps[i]
          if c == "progress" or (type(c) == "table" and c[1] == "progress") then
            table.remove(comps, i)
          elseif c == "location" or (type(c) == "table" and c[1] == "location") then
            -- Add a space before the line number.
            if type(c) ~= "table" then
              comps[i] = { "location" }
              c = comps[i]
            end
            c.padding = c.padding or {}
            c.padding = type(c.padding) == "table" and c.padding or { left = c.padding, right = c.padding }
            c.padding.left = 1
          end
        end
      end
    end
  end,
}
