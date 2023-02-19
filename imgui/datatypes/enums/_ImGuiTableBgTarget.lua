---@meta

---@enum ImGuiTableBgTarget
ImGuiTableBgTarget = {
  None = 0,
  RowBg0 = 0, -- Set row background color 0 (generally used for background, automatically set when ImGuiTableFlags_RowBg is used)
  RowBg1 = 0, -- Set row background color 1 (generally used for selection marking)
  CellBg = 0, -- Set cell background color (top-most color)
}