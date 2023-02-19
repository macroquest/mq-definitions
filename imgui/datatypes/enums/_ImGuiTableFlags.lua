---@meta

---@enum ImGuiTableFlags
ImGuiTableFlags = {
  None = 0,
  Resizable = 0, -- Enable resizing columns.
  Reorderable = 0, -- Enable reordering columns in header row (need calling TableSetupColumn() + TableHeadersRow() to display headers)
  Hideable = 0, -- Enable hiding/disabling columns in context menu.
  Sortable = 0, -- Enable sorting. Call TableGetSortSpecs() to obtain sort specs. Also see ImGuiTableFlags_SortMulti and ImGuiTableFlags_SortTristate.
  NoSavedSettings = 0, -- Disable persisting columns order, width and sort settings in the .ini file.
  ContextMenuInBody = 0, -- Right-click on columns body/contents will display table context menu. By default it is available in TableHeadersRow().
  RowBg = 0, -- Set each RowBg color with ImGuiCol_TableRowBg or ImGuiCol_TableRowBgAlt (equivalent of calling TableSetBgColor with ImGuiTableBgFlags_RowBg0 on each row manually)
  BordersInnerH = 0, -- Draw horizontal borders between rows.
  BordersOuterH = 0, -- Draw horizontal borders at the top and bottom.
  BordersInnerV = 0, -- Draw vertical borders between columns.
  BordersOuterV = 0, -- Draw vertical borders on the left and right sides.
  BordersH = 0, -- Draw horizontal borders.
  BordersV = 0, -- Draw vertical borders.
  BordersInner = 0, -- Draw inner borders.
  BordersOuter = 0, -- Draw outer borders.
  Borders = 0, -- Draw all borders.
  NoBordersInBody = 0, -- [ALPHA] Disable vertical borders in columns Body (borders will always appears in Headers). -> May move to style
  NoBordersInBodyUntilResize = 0, -- [ALPHA] Disable vertical borders in columns Body until hovered for resize (borders will always appears in Headers). -> May move to style
  SizingFixedFit = 0, -- Columns default to _WidthFixed or _WidthAuto (if resizable or not resizable), matching contents width.
  SizingFixedSame = 0, -- Columns default to _WidthFixed or _WidthAuto (if resizable or not resizable), matching the maximum contents width of all columns. Implicitly enable ImGuiTableFlags_NoKeepColumnsVisible.
  SizingStretchProp = 0, -- Columns default to _WidthStretch with default weights proportional to each columns contents widths.
  SizingStretchSame = 0, -- Columns default to _WidthStretch with default weights all equal, unless overridden by TableSetupColumn().
  NoHostExtendX = 0, --  Make outer width auto-fit to columns, overriding outer_size.x value. Only available when ScrollX/ScrollY are disabled and Stretch columns are not used.
  NoHostExtendY = 0, --  Make outer height stop exactly at outer_size.y (prevent auto-extending table past the limit). Only available when ScrollX/ScrollY are disabled. Data below the limit will be clipped and not visible.
  NoKeepColumnsVisible = 0, -- Disable keeping column always minimally visible when ScrollX is off and table gets too small. Not recommended if columns are resizable.
  PreciseWidths = 0, --  Disable distributing remainder width to stretched columns (width allocation on a 100-wide table with 3 columns: Without this flag: 33,33,34. With this flag: 33,33,33). With larger number of columns, resizing will appear to be less smooth.
  NoClip = 0, -- Disable clipping rectangle for every individual columns (reduce draw command count, items will be able to overflow into other columns). Generally incompatible with TableSetupScrollFreeze().
  PadOuterX = 0, -- Default if BordersOuterV is on. Enable outer-most padding. Generally desirable if you have headers.
  NoPadOuterX = 0, -- Default if BordersOuterV is off. Disable outer-most padding.
  NoPadInnerX = 0, -- Disable inner padding between columns (double inner padding if BordersOuterV is on, single inner padding if BordersOuterV is off).
  ScrollX = 0, -- Enable horizontal scrolling. Require 'outer_size' parameter of BeginTable() to specify the container size. Changes default sizing policy. Because this create a child window, ScrollY is currently generally recommended when using ScrollX.
  ScrollY = 0, -- Enable vertical scrolling. Require 'outer_size' parameter of BeginTable() to specify the container size.
  SortMulti = 0, -- Hold shift when clicking headers to sort on multiple column. TableGetSortSpecs() may return specs where (SpecsCount > 1).
  SortTristate = 0, -- Allow no sorting, disable default sorting. TableGetSortSpecs() may return specs where (SpecsCount == 0).
  MultiSortable = 0, -- Allows Sorting on multiple columns
}