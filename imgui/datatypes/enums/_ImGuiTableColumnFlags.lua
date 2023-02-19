---@meta

---@enum ImGuiTableColumnFlags
ImGuiTableColumnFlags = {
  None = 0,
  Disabled = 0, -- Overriding/master disable flag: hide column, won't show in context menu (unlike calling TableSetColumnEnabled() which manipulates the user accessible state)
  DefaultHide = 0, -- Default as a hidden/disabled column.
  DefaultSort = 0, -- Default as a sorting column.
  WidthStretch = 0, -- Column will stretch. Preferable with horizontal scrolling disabled (default if table sizing policy is _SizingStretchSame or _SizingStretchProp).
  WidthFixed = 0, -- Column will not stretch. Preferable with horizontal scrolling enabled (default if table sizing policy is _SizingFixedFit and table is resizable).
  NoResize = 0, -- Disable manual resizing.
  NoReorder = 0, -- Disable manual reordering this column, this will also prevent other columns from crossing over this column.
  NoHide = 0, -- Disable ability to hide/disable this column.
  NoClip = 0, -- Disable clipping for this column (all NoClip columns will render in a same draw command).
  NoSort = 0, -- Disable ability to sort on this field (even if ImGuiTableFlags_Sortable is set on the table).
  NoSortAscending = 0, -- Disable ability to sort in the ascending direction.
  NoSortDescending = 0, -- Disable ability to sort in the descending direction.
  NoHeaderLabel = 0, -- TableHeadersRow() will not submit label for this column. Convenient for some small columns. Name will still appear in context menu.
  NoHeaderWidth = 0, -- Disable header text width contribution to automatic column width.
  PreferSortAscending = 0, -- Make the initial sort direction Ascending when first sorting on this column (default).
  PreferSortDescending = 0, -- Make the initial sort direction Descending when first sorting on this column.
  IndentEnable = 0, -- Use current Indent value when entering cell (default for column 0).
  IndentDisable = 0, -- Ignore current Indent value when entering cell (default for columns > 0). Indentation changes _within_ the cell will still be honored.
  IsEnabled = 0, -- Status: is enabled == not hidden by user/api (referred to as "Hide" in _DefaultHide and _NoHide) flags.
  IsVisible = 0, -- Status: is visible == is enabled AND not clipped by scrolling.
  IsSorted = 0, -- Status: is currently part of the sort specs
  IsHovered = 0, -- Status: is hovered by mouse
  WidthMask_ = 0,
  IndentMask_ = 0,
  StatusMask_ = 0,
  NoDirectResize_ = 0, -- [Internal] Disable user resizing this column directly (it may however we resized indirectly from its left edge)
}