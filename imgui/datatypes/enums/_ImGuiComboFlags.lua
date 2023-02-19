---@meta

---@enum ImGuiComboFlags
ImGuiComboFlags =  {
  None                    = 0,
  PopupAlignLeft          = 1,   -- Align the popup toward the left by default
  HeightSmall             = 2,   -- Max ~4 items visible. Tip: If you want your combo popup to be a specific size you can use SetNextWindowSizeConstraints() prior to calling BeginCombo()
  HeightRegular           = 4,   -- Max ~8 items visible (default)
  HeightLarge             = 8,   -- Max ~20 items visible
  HeightLargest           = 16,   -- As many fitting items as possible
  NoArrowButton           = 32,   -- Display on the preview box without the square arrow button
  NoPreview               = 64,   -- Display only a square arrow button
  HeightMask              = 30,   -- HeightSmall | HeightRegular | HeightLarge | HeightLargest
}