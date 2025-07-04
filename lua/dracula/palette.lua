local M = {}

-- Base Dracula Pro palette
M.default = {
  fg = "#F8F8F2",
  
  bglighter = "#393649",
  bglight = "#2E2B3B",
  bg = "#22212C",
  bgdark = "#17161D",
  bgdarker = "#0B0B0F",
  
  comment = "#7970A9",
  selection = "#454158",
  subtle = "#525567",
  
  cyan = "#80FFEA",
  green = "#8AFF80",
  orange = "#FFCA80",
  pink = "#FF80BF",
  purple = "#9580FF",
  red = "#FF9580",
  yellow = "#FFFF80",
  
  -- ANSI colors
  color_0 = "#454158",
  color_1 = "#FF9580",
  color_2 = "#8AFF80",
  color_3 = "#FFFF80",
  color_4 = "#9580FF",
  color_5 = "#FF80BF",
  color_6 = "#80FFEA",
  color_7 = "#F8F8F2",
  color_8 = "#7970A9",
  color_9 = "#FFAA99",
  color_10 = "#A2FF99",
  color_11 = "#FFFF99",
  color_12 = "#AA99FF",
  color_13 = "#FF99CC",
  color_14 = "#99FFEE",
  color_15 = "#FFFFFF",
}

-- Alucard (Light theme)
M.alucard = vim.tbl_deep_extend("force", M.default, {
  comment = "#635D97",
  selection = "#CFCFDE",
  subtle = "#C8CAE0",
  
  bglighter = "#FFFFFF",
  bglight = "#F5F5F5",
  bg = "#F5F5F5",
  bgdark = "#E6E6E6",
  bgdarker = "#B8B8B8",
  
  fg = "#1F1F1F",
  
  cyan = "#036A96",
  green = "#14710A",
  orange = "#A34D14",
  pink = "#A3144D",
  purple = "#644AC9",
  red = "#CB3A2A",
  yellow = "#846E15",
  
  -- ANSI colors for light theme
  color_0 = "#F5F5F5",
  color_1 = "#CB3A2A",
  color_2 = "#14710A",
  color_3 = "#846E15",
  color_4 = "#644AC9",
  color_5 = "#A3144D",
  color_6 = "#036A96",
  color_7 = "#1F1F1F",
  color_8 = "#635D97",
  color_9 = "#D74C3D",
  color_10 = "#198D0C",
  color_11 = "#9E841A",
  color_12 = "#7862D0",
  color_13 = "#BF185A",
  color_14 = "#047FB4",
  color_15 = "#2C2B31",
})

-- Blade
M.blade = vim.tbl_deep_extend("force", M.default, {
  comment = "#70A99F",
  selection = "#415854",
})

-- Buffy
M.buffy = vim.tbl_deep_extend("force", M.default, {
  comment = "#9F70A9",
  selection = "#544158",
})

-- Lincoln
M.lincoln = vim.tbl_deep_extend("force", M.default, {
  comment = "#A99F70",
  selection = "#585441",
})

-- Morbius
M.morbius = vim.tbl_deep_extend("force", M.default, {
  comment = "#A97079",
  selection = "#584145",
})

-- Van Helsing
M.van_helsing = vim.tbl_deep_extend("force", M.default, {
  comment = "#708CA9",
  selection = "#414D58",
})

return M
