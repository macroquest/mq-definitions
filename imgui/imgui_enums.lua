---@meta

--
-- ## ImGui enumeration definitions
--

-- (Enums are ordered as they appear in imgui.h)


-- Flags for ImGui.Begin()
--- @enum ImGuiWindowFlags
ImGuiWindowFlags = {
    None                       = 0,
    NoTitleBar                 = 0x00000001, -- Disable title-bar
    NoResize                   = 0x00000002, -- Disable user resizing with the lower-right grip
    NoMove                     = 0x00000004, -- Disable user moving the window
    NoScrollbar                = 0x00000008, -- Disable scrollbars (window can still scroll with mouse or programmatically)
    NoScrollWithMouse          = 0x00000010, -- Disable user vertically scrolling with mouse wheel. On child window, mouse wheel will be forwarded to the parent unless NoScrollbar is also set.
    NoCollapse                 = 0x00000020, -- Disable user collapsing window by double-clicking on it. Also referred to as Window Menu Button (e.g. within a docking node).
    AlwaysAutoResize           = 0x00000040, -- Resize every window to its content every frame
    NoBackground               = 0x00000080, -- Disable drawing background color (WindowBg, etc.) and outside border. Similar as using SetNextWindowBgAlpha(0.0f).
    NoSavedSettings            = 0x00000100, -- Never load/save settings in .ini file
    NoMouseInputs              = 0x00000200, -- Disable catching mouse, hovering test with pass through.
    MenuBar                    = 0x00000400, -- Has a menu-bar
    HorizontalScrollbar        = 0x00000800, -- Allow horizontal scrollbar to appear (off by default). You may use SetNextWindowContentSize(ImVec2(width,0.0f)); prior to calling Begin() to specify width. Read code in imgui_demo in the "Horizontal Scrolling" section.
    NoFocusOnAppearing         = 0x00001000, -- Disable taking focus when transitioning from hidden to visible state
    NoBringToFrontOnFocus      = 0x00002000, -- Disable bringing window to front when taking focus (e.g. clicking on it or programmatically giving it focus)
    AlwaysVerticalScrollbar    = 0x00004000, -- Always show vertical scrollbar (even if ContentSize.y < Size.y)
    AlwaysHorizontalScrollbar  = 0x00008000, -- Always show horizontal scrollbar (even if ContentSize.x < Size.x)
    NoNavInputs                = 0x00010000, -- No gamepad/keyboard navigation within the window
    NoNavFocus                 = 0x00020000, -- No focusing toward this window with gamepad/keyboard navigation (e.g. skipped by CTRL+TAB)
    UnsavedDocument            = 0x00040000, -- Display a dot next to the title. When used in a tab/docking context, tab is selected when clicking the X + closure is not assumed (will wait for user to stop submitting the tab). Otherwise closure is assumed when pressing the X, so if you keep submitting the tab may reappear at end of tab bar.
    NoDocking                  = 0x00080000, -- Disable docking of this window
    NoNav                      = 0x00030000, -- NoNavInputs | NoNavFocus
    NoDecoration               = 0x0000002B, -- NoTitleBar | NoResize | NoScrollbar | NoCollapse
    NoInputs                   = 0x00030200, -- NoMouseInputs | NoNavInputs | NoNavFocus

    AlwaysUseWindowPadding     = 0x40000000, ---@deprecated Obsoleted in 1.90: Use ImGuiChildFlags/AlwaysUseWindowPadding in BeginChild() call.
}


-- Flags for ImGui::BeginChild()
--
-- About using AutoResizeX/AutoResizeY flags:
-- - May be combined with SetNextWindowSizeConstraints() to set a min/max size for each axis (see "Demo->Child->Auto-resize with Constraints").
-- - Size measurement for a given axis is only performed when the child window is within visible boundaries, or is just appearing.
--   - This allows BeginChild() to return false when not within boundaries (e.g. when scrolling), which is more optimal. BUT it won't update its auto-size while clipped.
--     While not perfect, it is a better default behavior as the always-on performance gain is more valuable than the occasional "resizing after becoming visible again" glitch.
--   - You may also use ImGuiChildFlags_AlwaysAutoResize to force an update even when child window is not in view.
--    HOWEVER PLEASE UNDERSTAND THAT DOING SO WILL PREVENT BeginChild() FROM EVER RETURNING FALSE, disabling benefits of coarse clipping.
---@enum ImGuiChildFlags
ImGuiChildFlags = {
    None                       = 0,
    Border                     = 0x01, -- Show an outer border and enable WindowPadding.
    AlwaysUseWindowPadding     = 0x02, -- Pad with style.WindowPadding even if no border are drawn (no padding by default for non-bordered child windows because it makes more sense)
    ResizeX                    = 0x04, -- Allow resize from right border (layout direction). Enable .ini saving (unless ImGuiWindowFlags_NoSavedSettings passed to window flags)
    ResizeY                    = 0x08, -- Allow resize from bottom border (layout direction). Enable .ini saving (unless ImGuiWindowFlags_NoSavedSettings passed to window flags)
    AutoResizeX                = 0x10, -- Enable auto-resizing width. Read "IMPORTANT: Size measurement" details above.
    AutoResizeY                = 0x20, -- Enable auto-resizing height. Read "IMPORTANT: Size measurement" details above.
    AlwaysAutoResize           = 0x40, -- Combined with AutoResizeX/AutoResizeY. Always measure size even when child is hidden, always return true, always disable clipping optimization! NOT RECOMMENDED.
    FrameStyle                 = 0x80, -- Style the child window like a framed item: use FrameBg, FrameRounding, FrameBorderSize, FramePadding instead of ChildBg, ChildRounding, ChildBorderSize, WindowPadding.
}


-- Flags for ImGui.InputText()
---@enum ImGuiInputTextFlags
ImGuiInputTextFlags = {
    None                       = 0,
    CharsDecimal               = 0x000001, -- Allow 0123456789.+-*/
    CharsHexadecimal           = 0x000002, -- Allow 0123456789ABCDEFabcdef
    CharsUppercase             = 0x000004, -- Turn a..z into A..Z
    CharsNoBlank               = 0x000008, -- Filter out spaces, tabs
    AutoSelectAll              = 0x000010, -- Select entire text when first taking mouse focus
    EnterReturnsTrue           = 0x000020, -- Return 'true' when Enter is pressed (as opposed to every time the value was modified). Consider looking at the IsItemDeactivatedAfterEdit() function.
    CallbackCompletion         = 0x000040, -- Callback on pressing TAB (for completion handling)
    CallbackHistory            = 0x000080, -- Callback on pressing Up/Down arrows (for history handling)
    CallbackAlways             = 0x000100, -- Callback on each iteration. User code may query cursor position, modify text buffer.
    CallbackCharFilter         = 0x000200, -- Callback on character inputs to replace or discard them. Modify 'EventChar' to replace or discard, or return 1 in callback to discard.
    AllowTabInput              = 0x000400, -- Pressing TAB input a '\t' character into the text field
    CtrlEnterForNewLine        = 0x000800, -- In multi-line mode, unfocus with Enter, add new line with Ctrl+Enter (default is opposite: unfocus with Ctrl+Enter, add line with Enter).
    NoHorizontalScroll         = 0x001000, -- Disable following the cursor horizontally
    AlwaysOverwrite            = 0x002000, -- Overwrite mode
    ReadOnly                   = 0x004000, -- Read-only mode
    Password                   = 0x008000, -- Password mode, display all characters as '*'
    NoUndoRedo                 = 0x010000, -- Disable undo/redo. Note that input text owns the text data while active, if you want to provide your own undo/redo stack you need e.g. to call ClearActiveID().
    CharsScientific            = 0x020000, -- Allow 0123456789.+-*/eE (Scientific notation input)
    CallbackResize             = 0x040000, -- Callback on buffer capacity changes request (beyond 'buf_size' parameter value), allowing the string to grow. Notify when the string wants to be resized (for string types which hold a cache of their Size). You will be provided a new BufSize in the callback and NEED to honor it. (see misc/cpp/imgui_stdlib.h for an example of using this)
    CallbackEdit               = 0x080000, -- Callback on any edit (note that InputText() already returns true on edit, the callback is useful mainly to manipulate the underlying buffer while focus is active)
    EscapeClearsAll            = 0x100000, -- Escape key clears content if not empty, and deactivate otherwise (contrast to default behavior of Escape to revert)
}


---@enum ImGuiTreeNodeFlags
ImGuiTreeNodeFlags = {
    None                       = 0,
    Selected                   = 0x0001, -- Draw as selected
    Framed                     = 0x0002, -- Draw frame with background (e.g. for CollapsingHeader)
    AllowOverlap               = 0x0004, -- Hit testing to allow subsequent widgets to overlap this one
    NoTreePushOnOpen           = 0x0008, -- Don't do a TreePush() when open (e.g. for CollapsingHeader) = no extra indent nor pushing on ID stack
    NoAutoOpenOnLog            = 0x0010, -- Don't automatically and temporarily open node when Logging is active (by default logging will automatically open tree nodes)
    DefaultOpen                = 0x0020, -- Default node to be open
    OpenOnDoubleClick          = 0x0040, -- Need double-click to open node
    OpenOnArrow                = 0x0080, -- Only open when clicking on the arrow part. If ImGuiTreeNodeFlags.OpenOnDoubleClick is also set, single-click arrow or double-click all box to open.
    Leaf                       = 0x0100, -- No collapsing, no arrow (use as a convenience for leaf nodes).
    Bullet                     = 0x0200, -- Display a bullet instead of arrow
    FramePadding               = 0x0400, -- Use FramePadding (even for an unframed text node) to vertically align text baseline to regular widget height. Equivalent to calling AlignTextToFramePadding().
    SpanAvailWidth             = 0x0800, -- Extend hit box to the right-most edge, even if not framed. This is not the default in order to allow adding other items on the same line. In the future we may refactor the hit system to be front-to-back, allowing natural overlaps and then this can become the default.
    SpanFullWidth              = 0x1000, -- Extend hit box to the left-most and right-most edges (bypass the indented area).
    SpanAllColumns             = 0x2000,
    NavLeftJumpsBackHere       = 0x4000, -- (WIP) Nav: left direction may move to this TreeNode() from any of its child (items submitted between TreeNode and TreePop)
    CollapsingHeader           = 0x001a, -- Framed | NoTreePushOnOpen | NoAutoOpenOnLog,

    AllowItemOverlap           = 0x0004, ---@deprecated Renamed in 1.89.7, use AllowOverlap
}


-- Flags for OpenPopup*(), BeginPopupContext*(), IsPopupOpen() functions.
-- - To be backward compatible with older API which took an 'int mouse_button = 1' argument, we need to treat
--   small flags values as a mouse button index, so we encode the mouse button in the first few bits of the flags.
--   It is therefore guaranteed to be legal to pass a mouse button index in ImGuiPopupFlags.
-- - For the same reason, we exceptionally default the ImGuiPopupFlags argument of BeginPopupContextXXX functions to 1 instead of 0.
--   IMPORTANT: because the default parameter is 1 (==ImGuiPopupFlags.MouseButtonRight), if you rely on the default parameter
--   and want to use another flag, you need to pass in the ImGuiPopupFlags.MouseButtonRight flag explicitly.
-- - Multiple buttons currently cannot be combined/or-ed in those functions (we could allow it later).
---@enum ImGuiPopupFlags
ImGuiPopupFlags = {
    None                       = 0,
    MouseButtonLeft            = 0x000, -- For BeginPopupContext*(): open on Left Mouse release. Guaranteed to always be == 0 (same as ImGuiMouseButton_Left)
    MouseButtonRight           = 0x001, -- For BeginPopupContext*(): open on Right Mouse release. Guaranteed to always be == 1 (same as ImGuiMouseButton_Right)
    MouseButtonMiddle          = 0x002, -- For BeginPopupContext*(): open on Middle Mouse release. Guaranteed to always be == 2 (same as ImGuiMouseButton_Middle)
    NoOpenOverExistingPopup    = 0x020, -- For OpenPopup*(), BeginPopupContext*(): don't open if there's already a popup at the same level of the popup stack
    NoOpenOverItems            = 0x040, -- For BeginPopupContextWindow(): don't return true when hovering items, only when hovering empty space
    AnyPopupId                 = 0x080, -- For IsPopupOpen(): ignore the ImGuiID parameter and test for any popup.
    AnyPopupLevel              = 0x100, -- For IsPopupOpen(): search/test at any level of the popup stack (default test in the current level)
    AnyPopup                   = 0x180, -- AnyPopupId | AnyPopupLevel

    MouseButtonMask_           = 0x01f,
    MouseButtonDefault_        = 0x001,
}


-- Flags for ImGui::Selectable()
---@enum ImGuiSelectableFlags
ImGuiSelectableFlags = {
    None                       = 0,
    DontClosePopups            = 0x01, -- Clicking this don't close parent popup window
    SpanAllColumns             = 0x02, -- Selectable frame can span all columns (text will still fit in current column)
    AllowDoubleClick           = 0x04, -- Generate press events on double clicks too
    Disabled                   = 0x08, -- Cannot be selected, display grayed out text
    AllowOverlap               = 0x10, -- (WIP) Hit testing to allow subsequent widgets to overlap this one

    AllowItemOverlap           = 0x10, ---@deprecated Renamed in 1.89.7, use AllowOverlap
}


---@enum ImGuiComboFlags
ImGuiComboFlags =  {
    None                       = 0,
    PopupAlignLeft             = 0x01, -- Align the popup toward the left by default
    HeightSmall                = 0x02, -- Max ~4 items visible. Tip: If you want your combo popup to be a specific size you can use SetNextWindowSizeConstraints() prior to calling BeginCombo()
    HeightRegular              = 0x04, -- Max ~8 items visible (default)
    HeightLarge                = 0x08, -- Max ~20 items visible
    HeightLargest              = 0x10, -- As many fitting items as possible
    NoArrowButton              = 0x20, -- Display on the preview box without the square arrow button
    NoPreview                  = 0x40, -- Display only a square arrow button
    WidthFitPreview            = 0x80, -- Width dynamically calculated from preview contents

    HeightMask_                = 0x1e, -- HeightSmall | HeightRegular | HeightLarge | HeightLargest
}


---@enum ImGuiTabBarFlags
ImGuiTabBarFlags = {
    None                       = 0,
    Reorderable                = 0x01, -- Allow manually dragging tabs to re-order them + New tabs are appended at the end of list
    AutoSelectNewTabs          = 0x02, -- Automatically select new tabs when they appear
    TabListPopupButton         = 0x04, -- Disable buttons to open the tab list popup
    NoCloseWithMiddleMouseButton = 0x08, -- Disable behavior of closing tabs (that are submitted with open != nil) with middle mouse button. You can still repro this behavior on user's side with if (IsItemHovered() && IsMouseClicked(2)) *p_open = false.
    NoTabListScrollingButtons  = 0x10, -- Disable scrolling buttons (apply when fitting policy is FittingPolicyScroll)
    NoTooltip                  = 0x20, -- Disable tooltips when hovering a tab
    FittingPolicyResizeDown    = 0x40, -- Resize tabs when they don't fit
    FittingPolicyScroll        = 0x80, -- Add scroll buttons when tabs don't fit

    FittingPolicyMask_         = 0xc0, -- FittingPolicyResizeDown | FittingPolicyScroll
    FittingPolicyDefault_      = 0x40, -- FittingPolicyResizeDown
}


-- Flags for ImGui::BeginTabItem()
---@enum ImGuiTabItemFlags
ImGuiTabItemFlags = {
    None                        = 0,
    UnsavedDocument             = 0x01, -- Display a dot next to the title + tab is selected when clicking the X + closure is not assumed (will wait for user to stop submitting the tab). Otherwise closure is assumed when pressing the X, so if you keep submitting the tab may reappear at end of tab bar.
    SetSelected                 = 0x02, -- Trigger flag to programmatically make the tab selected when calling BeginTabItem()
    NoCloseWithMiddleMouseButton = 0x04, -- Disable behavior of closing tabs (that are submitted with open != nil) with middle mouse button. You can still repro this behavior on user's side with if (IsItemHovered() && IsMouseClicked(2)) open = false.
    NoPushId                    = 0x08, -- Don't call PushID(tab->ID)/PopID() on BeginTabItem()/EndTabItem()
    NoTooltip                   = 0x10, -- Disable tooltip for the given tab
    NoReorder                   = 0x20, -- Disable reordering this tab or having another tab cross over this tab
    Leading                     = 0x40, -- Enforce the tab position to the left of the tab bar (after the tab list popup button)
    Trailing                    = 0x80, -- Enforce the tab position to the right of the tab bar (before the scrolling buttons)
}


---@enum ImGuiTableFlags
ImGuiTableFlags = {
    -- Features
    None                        = 0,
    Resizable                   = 0x00000001, -- Enable resizing columns.
    Reorderable                 = 0x00000002, -- Enable reordering columns in header row (need calling TableSetupColumn() + TableHeadersRow() to display headers)
    Hideable                    = 0x00000004, -- Enable hiding/disabling columns in context menu.
    Sortable                    = 0x00000008, -- Enable sorting. Call TableGetSortSpecs() to obtain sort specs. Also see ImGuiTableFlags_SortMulti and ImGuiTableFlags_SortTristate.
    NoSavedSettings             = 0x00000010, -- Disable persisting columns order, width and sort settings in the .ini file.
    ContextMenuInBody           = 0x00000020, -- Right-click on columns body/contents will display table context menu. By default it is available in TableHeadersRow().
    -- Decorations
    RowBg                       = 0x00000040, -- Set each RowBg color with ImGuiCol_TableRowBg or ImGuiCol_TableRowBgAlt (equivalent of calling TableSetBgColor with ImGuiTableBgFlags_RowBg0 on each row manually)
    BordersInnerH               = 0x00000080, -- Draw horizontal borders between rows.
    BordersOuterH               = 0x00000100, -- Draw horizontal borders at the top and bottom.
    BordersInnerV               = 0x00000200, -- Draw vertical borders between columns.
    BordersOuterV               = 0x00000400, -- Draw vertical borders on the left and right sides.
    BordersH                    = 0x00000180, -- Draw horizontal borders.
    BordersV                    = 0x00000600, -- Draw vertical borders.
    BordersInner                = 0x00000280, -- Draw inner borders.
    BordersOuter                = 0x00000500, -- Draw outer borders.
    Borders                     = 0x00000780, -- Draw all borders.
    NoBordersInBody             = 0x00000800, -- [ALPHA] Disable vertical borders in columns Body (borders will always appears in Headers). -> May move to style
    NoBordersInBodyUntilResize  = 0x00001000, -- [ALPHA] Disable vertical borders in columns Body until hovered for resize (borders will always appears in Headers). -> May move to style
    -- Sizing Policy (read above for defaults)
    SizingFixedFit              = 0x00002000, -- Columns default to _WidthFixed or _WidthAuto (if resizable or not resizable), matching contents width.
    SizingFixedSame             = 0x00004000, -- Columns default to _WidthFixed or _WidthAuto (if resizable or not resizable), matching the maximum contents width of all columns. Implicitly enable ImGuiTableFlags_NoKeepColumnsVisible.
    SizingStretchProp           = 0x00006000, -- Columns default to _WidthStretch with default weights proportional to each columns contents widths.
    SizingStretchSame           = 0x00008000, -- Columns default to _WidthStretch with default weights all equal, unless overridden by TableSetupColumn().
    -- Sizing Extra Options
    NoHostExtendX               = 0x00010000, --  Make outer width auto-fit to columns, overriding outer_size.x value. Only available when ScrollX/ScrollY are disabled and Stretch columns are not used.
    NoHostExtendY               = 0x00020000, --  Make outer height stop exactly at outer_size.y (prevent auto-extending table past the limit). Only available when ScrollX/ScrollY are disabled. Data below the limit will be clipped and not visible.
    NoKeepColumnsVisible        = 0x00040000, -- Disable keeping column always minimally visible when ScrollX is off and table gets too small. Not recommended if columns are resizable.
    PreciseWidths               = 0x00080000, --  Disable distributing remainder width to stretched columns (width allocation on a 100-wide table with 3 columns: Without this flag: 33,33,34. With this flag: 33,33,33). With larger number of columns, resizing will appear to be less smooth.
    -- Clipping
    NoClip                      = 0x00100000, -- Disable clipping rectangle for every individual columns (reduce draw command count, items will be able to overflow into other columns). Generally incompatible with TableSetupScrollFreeze().
    -- PAdding
    PadOuterX                   = 0x00200000, -- Default if BordersOuterV is on. Enable outer-most padding. Generally desirable if you have headers.
    NoPadOuterX                 = 0x00400000, -- Default if BordersOuterV is off. Disable outer-most padding.
    NoPadInnerX                 = 0x00800000, -- Disable inner padding between columns (double inner padding if BordersOuterV is on, single inner padding if BordersOuterV is off).
    -- Scrolling
    ScrollX                     = 0x01000000, -- Enable horizontal scrolling. Require 'outer_size' parameter of BeginTable() to specify the container size. Changes default sizing policy. Because this create a child window, ScrollY is currently generally recommended when using ScrollX.
    ScrollY                     = 0x02000000, -- Enable vertical scrolling. Require 'outer_size' parameter of BeginTable() to specify the container size.
    -- Sorting
    SortMulti                   = 0x04000000, -- Hold shift when clicking headers to sort on multiple column. TableGetSortSpecs() may return specs where (SpecsCount > 1).
    SortTristate                = 0x08000000, -- Allow no sorting, disable default sorting. TableGetSortSpecs() may return specs where (SpecsCount == 0).
    -- Miscellaneous
    HighlightHoveredColumn      = 0x10000000, -- Highlight column headers when hovered (may evolve into a fuller highlight)

    -- Deprecated
    MultiSortable               = 0x04000000, ---@deprecated Use ImGuiTableFlags.SortMulti instead
}


---@enum ImGuiTableColumnFlags
ImGuiTableColumnFlags = {
    None                        = 0,
    Disabled                    = 0x00000001, -- Overriding/master disable flag: hide column, won't show in context menu (unlike calling TableSetColumnEnabled() which manipulates the user accessible state)
    DefaultHide                 = 0x00000002, -- Default as a hidden/disabled column.
    DefaultSort                 = 0x00000004, -- Default as a sorting column.
    WidthStretch                = 0x00000008, -- Column will stretch. Preferable with horizontal scrolling disabled (default if table sizing policy is _SizingStretchSame or _SizingStretchProp).
    WidthFixed                  = 0x00000010, -- Column will not stretch. Preferable with horizontal scrolling enabled (default if table sizing policy is _SizingFixedFit and table is resizable).
    NoResize                    = 0x00000020, -- Disable manual resizing.
    NoReorder                   = 0x00000040, -- Disable manual reordering this column, this will also prevent other columns from crossing over this column.
    NoHide                      = 0x00000080, -- Disable ability to hide/disable this column.
    NoClip                      = 0x00000100, -- Disable clipping for this column (all NoClip columns will render in a same draw command).
    NoSort                      = 0x00000200, -- Disable ability to sort on this field (even if ImGuiTableFlags_Sortable is set on the table).
    NoSortAscending             = 0x00000400, -- Disable ability to sort in the ascending direction.
    NoSortDescending            = 0x00000800, -- Disable ability to sort in the descending direction.
    NoHeaderLabel               = 0x00001000, -- TableHeadersRow() will not submit label for this column. Convenient for some small columns. Name will still appear in context menu.
    NoHeaderWidth               = 0x00002000, -- Disable header text width contribution to automatic column width.
    PreferSortAscending         = 0x00004000, -- Make the initial sort direction Ascending when first sorting on this column (default).
    PreferSortDescending        = 0x00008000, -- Make the initial sort direction Descending when first sorting on this column.
    IndentEnable                = 0x00010000, -- Use current Indent value when entering cell (default for column 0).
    IndentDisable               = 0x00020000, -- Ignore current Indent value when entering cell (default for columns > 0). Indentation changes _within_ the cell will still be honored.
    AngledHeader                = 0x00040000, -- TableHeadersRow() will submit an angled header row for this column. Note this will add an extra row.

    -- Output status flags, read-only via TableGetColumnFlags()
    IsEnabled                   = 0x01000000, -- Status: is enabled == not hidden by user/api (referred to as "Hide" in _DefaultHide and _NoHide) flags.
    IsVisible                   = 0x02000000, -- Status: is visible == is enabled AND not clipped by scrolling.
    IsSorted                    = 0x04000000, -- Status: is currently part of the sort specs
    IsHovered                   = 0x08000000, -- Status: is hovered by mouse

    WidthAlwaysAutoResize       = 0x00000030, -- Same as WidthFixed | NoResize
}


-- Flags for ImGui::TableNextRow()
---@enum ImGuiTableRowFlags
ImGuiTableRowFlags = {
    None                       = 0,
    Headers                    = 1, -- Identify header row (set default background color + width of its contents accounted differently for auto column width)
}


-- Enum for ImGui::TableSetBgColor()
-- Background colors are rendering in 3 layers:
--  - Layer 0: draw with `RowBg0` color if set, otherwise draw with `ColumnBg0` if set.
--  - Layer 1: draw with `RowBg1` color if set, otherwise draw with `ColumnBg1` if set.
--  - Layer 2: draw with `CellBg` color if set.
-- The purpose of the two row/columns layers is to let you decide if a background color change should override or blend with the existing color.
--
-- When using `ImGuiTableFlags.RowBg` on the table, each row has the RowBg0 color automatically set for odd/even rows.
--
-- If you set the color of `RowBg0` target, your color will override the existing RowBg0 color.
--
-- If you set the color of `RowBg1` or `ColumnBg1` target, your color will blend over the RowBg0 color.
---@enum ImGuiTableBgTarget
ImGuiTableBgTarget = {
    None                       = 0,
    RowBg0                     = 1, -- Set row background color 0 (generally used for background, automatically set when ImGuiTableFlags_RowBg is used)
    RowBg1                     = 2, -- Set row background color 1 (generally used for selection marking)
    CellBg                     = 3, -- Set cell background color (top-most color)
}


---Flags for ImGui.IsWindowFocused()
---@enum ImGuiFocusedFlags
ImGuiFocusedFlags = {
    None                       = 0,
    ChildWindows               = 0x01, -- Return true if any children of the window is focused
    RootWindow                 = 0x02, -- Test from root window (top most parent of the current hierarchy)
    AnyWindow                  = 0x04, -- Return true if any window is focused. Important: If you are trying to tell how to dispatch your low-level inputs, do NOT use this. Use 'io.WantCaptureMouse' instead! Please read the FAQ!
    NoPopupHierarchy           = 0x08, -- Do not consider popup hierarchy (do not treat popup emitter as parent of popup) (when used with ChildWindows or RootWindow)
    DockHierarchy              = 0x10, -- Consider docking hierarchy (treat dockspace host as parent of docked window)

    RootAndChildWindows        = 0x03, -- RootWindow | ChildWindows
}


-- Flags for ImGui::IsItemHovered(), ImGui::IsWindowHovered()
-- - Note: windows with the ImGuiWindowFlags.NoInputs flag are ignored by IsWindowHovered() calls.
---@enum ImGuiHoveredFlags
ImGuiHoveredFlags = {
    None                       = 0,     -- Return true if directly over the item/window, not obstructed by another window, not obstructed by an active popup or modal blocking inputs under them.
    ChildWindows               = 0x00001, -- IsWindowHovered() only: Return true if any children of the window is hovered
    RootWindow                 = 0x00002, -- IsWindowHovered() only: Test from root window (top most parent of the current hierarchy)
    AnyWindow                  = 0x00004, -- IsWindowHovered() only: Return true if any window is hovered
    NoPopupHierarchy           = 0x00008, -- IsWindowHovered() only: Do not consider popup hierarchy (do not treat popup emitter as parent of popup) (when used with _ChildWindows or _RootWindow)
    DockHierarchy              = 0x00010, -- IsWindowHovered() only: Consider docking hierarchy (treat dockspace host as parent of docked window) (when used with _ChildWindows or _RootWindow)
    AllowWhenBlockedByPopup    = 0x00020, -- Return true even if a popup window is normally blocking access to this item/window
    AllowWhenBlockedByActiveItem = 0x00080, -- Return true even if an active item is blocking access to this item/window. Useful for Drag and Drop patterns.
    AllowWhenOverlappedByItem  = 0x00100, -- IsItemHovered() only: Return true even if the item uses AllowOverlap mode and is overlapped by another hoverable item.
    AllowWhenOverlappedByWindow= 0x00200, -- IsItemHovered() only: Return true even if the position is obstructed or overlapped by another window.
    AllowWhenDisabled          = 0x00400, -- IsItemHovered() only: Return true even if the item is disabled
    NoNavOverride              = 0x00800, -- IsItemHovered() only: Disable using gamepad/keyboard navigation state when active, always query mouse

    AllowWhenOverlapped        = 0x300, -- AllowWhenOverlappedByItem | AllowWhenOverlappedByWindow
    RectOnly                   = 0x3a0, -- AllowWhenBlockedByPopup | AllowWhenBlockedByActiveItem | AllowWhenOverlapped
    RootAndChildWindows        = 0x003, -- RootWindow | ChildWindows,

    -- Tooltips mode
    -- - typically used in IsItemHovered() + SetTooltip() sequence.
    -- - this is a shortcut to pull flags from 'style.HoverFlagsForTooltipMouse' or 'style.HoverFlagsForTooltipNav' where you can reconfigure desired behavior.
    --   e.g. 'TooltipHoveredFlagsForMouse' defaults to 'ImGuiHoveredFlags_Stationary | ImGuiHoveredFlags_DelayShort'.
    -- - for frequently actioned or hovered items providing a tooltip, you want may to use ImGuiHoveredFlags_ForTooltip (stationary + delay) so the tooltip doesn't show too often.
    -- - for items which main purpose is to be hovered, or items with low affordance, or in less consistent apps, prefer no delay or shorter delay.
    ForTooltip                 = 0x01000, -- Shortcut for standard flags when using IsItemHovered() + SetTooltip() sequence.

    -- (Advanced) Mouse Hovering delays.
    -- - generally you can use ImGuiHoveredFlags_ForTooltip to use application-standardized flags.
    -- - use those if you need specific overrides.
    Stationary                 = 0x02000, -- Require mouse to be stationary for style.HoverStationaryDelay (~0.15 sec) _at least one time_. After this, can move on same item/window. Using the stationary test tends to reduces the need for a long delay.
    DelayNone                  = 0x04000, -- IsItemHovered() only: Return true immediately (default). As this is the default you generally ignore this.
    DelayShort                 = 0x08000, -- IsItemHovered() only: Return true after style.HoverDelayShort elapsed (~0.15 sec) (shared between items) + requires mouse to be stationary for style.HoverStationaryDelay (once per item).
    DelayNormal                = 0x10000, -- IsItemHovered() only: Return true after style.HoverDelayNormal elapsed (~0.40 sec) (shared between items) + requires mouse to be stationary for style.HoverStationaryDelay (once per item).
    NoSharedDelay              = 0x20000, -- IsItemHovered() only: Disable shared delay system where moving from one item to the next keeps the previous timer for a short time (standard for tooltips with long delays)
}


-- Flags for ImGui::DockSpace(), shared/inherited by child nodes.
-- (Some flags can be applied to individual nodes directly)
---@enum ImGuiDockNodeFlags
ImGuiDockNodeFlags = {
    None                       = 0,
    KeepAliveOnly              = 0x01, -- Don't display the dockspace node but keep it alive. Windows docked into this dockspace node won't be undocked.
    NoDockingOverCentralNode   = 0x04, -- Disable docking over the Central Node, which will be always kept empty.
    PassthruCentralNode        = 0x08, -- Enable passthru dockspace: 1) DockSpace() will render a ImGuiCol_WindowBg background covering everything excepted the Central Node when empty. Meaning the host window should probably use SetNextWindowBgAlpha(0.0f) prior to Begin() when using this. 2) When Central Node is empty: let inputs pass-through + won't display a DockingEmptyBg background. See demo for details.
    NoDockingSplit             = 0x10, -- Disable other windows/nodes from splitting this node.
    NoResize                   = 0x20, -- [Saved] Disable resizing node using the splitter/separators. Useful with programmatically setup dockspaces.
    AutoHideTabBar             = 0x40, -- Tab bar will automatically hide when there is a single window in the dock node.
    NoUndocking                = 0x80, -- Disable undocking this node.

    NoSplit                    = 0x10, ---@deprecated Renamed in 1.90, use NoDockingSplit instead
    NoDockingInCentralNode     = 0x04, ---@deprecated Renamed in 1.90, use NoDockingOverCentralNode instead
}


-- Flags for ImGui::BeginDragDropSource(), ImGui::AcceptDragDropPayload()
---@enum ImGuiDragDropFlags
ImGuiDragDropFlags = {
    None                       = 0,

    -- BeginDragDropSource() flags
    SourceNoPreviewTooltip     = 0x0001, -- Disable preview tooltip. By default, a successful call to BeginDragDropSource opens a tooltip so you can display a preview or description of the source contents. This flag disables this behavior.
    SourceNoDisableHover       = 0x0002, -- By default, when dragging we clear data so that IsItemHovered() will return false, to avoid subsequent user code submitting tooltips. This flag disables this behavior so you can still call IsItemHovered() on the source item.
    SourceNoHoldToOpenOthers   = 0x0004, -- Disable the behavior that allows to open tree nodes and collapsing header by holding over them while dragging a source item.
    SourceAllowNullID          = 0x0008, -- Allow items such as Text(), Image() that have no unique identifier to be used as drag source, by manufacturing a temporary identifier based on their window-relative position. This is extremely unusual within the dear imgui ecosystem and so we made it explicit.
    SourceExtern               = 0x0010, -- External source (from outside of dear imgui), won't attempt to read current item/window info. Will always return true. Only one Extern source can be active simultaneously.
    SourceAutoExpirePayload    = 0x0020, -- Automatically expire the payload if the source cease to be submitted (otherwise payloads are persisting while being dragged)

    -- AcceptDragDropPayload() flags
    AcceptBeforeDelivery       = 0x0400, -- AcceptDragDropPayload() will returns true even before the mouse button is released. You can then call IsDelivery() to test if the payload needs to be delivered.
    AcceptNoDrawDefaultRect    = 0x0800, -- Do not draw the default highlight rectangle when hovering over target.
    AcceptNoPreviewTooltip     = 0x1000, -- Request hiding the BeginDragDropSource tooltip from the BeginDragDropTarget site.
    AcceptPeekOnly             = 0x0C00, -- For peeking ahead and inspecting the payload before delivery: AcceptBeforeDelivery | AcceptNoDrawDefaultRect
}


-- A cardinal direction
---@enum ImGuiDir
ImGuiDir = {
    None                       = -1,
    Left                       = 0,
    Right                      = 1,
    Up                         = 2,
    Down                       = 3,
}


-- A sorting direction
---@enum ImGuiSortDirection
ImGuiSortDirection = {
    None                       = 0,
    Ascending                  = 1, -- Ascending = 0->9, A->Z etc.
    Descending                 = 2, -- Descending = 9->0, Z->A etc.
}


-- A key identifier (ImGuiKey_XXX or ImGuiMod_XXX value): can represent Keyboard, Mouse and Gamepad values.
--
-- All our named keys are >= 512. Keys value 0 to 511 are left unused as legacy native/opaque key values (< 1.87).
-- Since >= 1.89 we increased typing (went from int to enum), some legacy code may need a cast to ImGuiKey.
-- Read details about the 1.87 and 1.89 transition : https:--github.com/ocornut/imgui/issues/4921
--
-- Note that "Keys" related to physical keys and are not the same concept as input "Characters", the later are submitted via io.AddInputCharacter().
---@enum ImGuiKey
ImGuiKey = {
    -- Keyboard
    None                       = 0,
    Tab                        = 512, -- == ImGuiKey_NamedKey_BEGIN
    LeftArrow                  = 513,
    RightArrow                 = 514,
    UpArrow                    = 515,
    DownArrow                  = 516,
    PageUp                     = 517,
    PageDown                   = 518,
    Home                       = 519,
    End                        = 520,
    Insert                     = 521,
    Delete                     = 522,
    Backspace                  = 523,
    Space                      = 524,
    Enter                      = 525,
    Escape                     = 526,
    LeftCtrl                   = 527,
    LeftShift                  = 528,
    LeftAlt                    = 529,
    LeftSuper                  = 530,
    RightCtrl                  = 531,
    RightShift                 = 532,
    RightAlt                   = 533,
    RightSuper                 = 534,
    Menu                       = 535,
    Key_0                      = 536,
    Key_1                      = 537,
    Key_2                      = 538,
    Key_3                      = 539,
    Key_4                      = 540,
    Key_5                      = 541,
    Key_6                      = 542,
    Key_7                      = 543,
    Key_8                      = 544,
    Key_9                      = 545,
    A                          = 546,
    B                          = 547,
    C                          = 548,
    D                          = 549,
    E                          = 550,
    F                          = 551,
    G                          = 552,
    H                          = 553,
    I                          = 554,
    J                          = 555,
    K                          = 556,
    L                          = 557,
    M                          = 558,
    N                          = 559,
    O                          = 560,
    P                          = 561,
    Q                          = 562,
    R                          = 563,
    S                          = 564,
    T                          = 565,
    U                          = 566,
    V                          = 567,
    W                          = 568,
    X                          = 569,
    Y                          = 570,
    Z                          = 571,
    F1                         = 572,
    F2                         = 573,
    F3                         = 574,
    F4                         = 575,
    F5                         = 576,
    F6                         = 577,
    F7                         = 578,
    F8                         = 579,
    F9                         = 580,
    F10                        = 581,
    F11                        = 582,
    F12                        = 583,
    F13                        = 584,
    F14                        = 585,
    F15                        = 586,
    F16                        = 587,
    F17                        = 588,
    F18                        = 589,
    F19                        = 590,
    F20                        = 591,
    F21                        = 592,
    F22                        = 593,
    F23                        = 594,
    F24                        = 595,
    Apostrophe                 = 596, -- '
    Comma                      = 597, -- ,
    Minus                      = 598, -- -
    Period                     = 599, -- .
    Slash                      = 600, -- /
    Semicolon                  = 601, -- ;
    Equal                      = 602, -- =
    LeftBracket                = 603, -- [
    Backslash                  = 604, -- \ 
    RightBracket               = 605, -- ]
    GraveAccent                = 606, -- `
    CapsLock                   = 607,
    ScrollLock                 = 608,
    NumLock                    = 609,
    PrintScreen                = 610,
    Pause                      = 611,
    Keypad0                    = 612,
    Keypad1                    = 613,
    Keypad2                    = 614,
    Keypad3                    = 615,
    Keypad4                    = 616,
    Keypad5                    = 617,
    Keypad6                    = 618,
    Keypad7                    = 619,
    Keypad8                    = 620,
    Keypad9                    = 621,
    KeypadDecimal              = 622,
    KeypadDivide               = 623,
    KeypadMultiply             = 624,
    KeypadSubtract             = 625,
    KeypadAdd                  = 626,
    KeypadEnter                = 627,
    KeypadEqual                = 628,
    AppBack                    = 629, -- Available on some keyboard/mouses. Often referred as "Browser Back"
    AppForward                 = 630,

    -- Gamepad (some of those are analog values, 0.0f to 1.0f)                          -- NAVIGATION ACTION
    -- (download controller mapping PNG/PSD at http:--dearimgui.com/controls_sheets)
    GamepadStart               = 631, -- Menu (Xbox)      + (Switch)   Start/Options (PS)
    GamepadBack                = 632, -- View (Xbox)      - (Switch)   Share (PS)
    GamepadFaceLeft            = 633, -- X (Xbox)         Y (Switch)   Square (PS)        -- Tap: Toggle Menu. Hold: Windowing mode (Focus/Move/Resize windows)
    GamepadFaceRight           = 634, -- B (Xbox)         A (Switch)   Circle (PS)        -- Cancel / Close / Exit
    GamepadFaceUp              = 635, -- Y (Xbox)         X (Switch)   Triangle (PS)      -- Text Input / On-screen Keyboard
    GamepadFaceDown            = 636, -- A (Xbox)         B (Switch)   Cross (PS)         -- Activate / Open / Toggle / Tweak
    GamepadDpadLeft            = 637, -- D-pad Left                                       -- Move / Tweak / Resize Window (in Windowing mode)
    GamepadDpadRight           = 638, -- D-pad Right                                      -- Move / Tweak / Resize Window (in Windowing mode)
    GamepadDpadUp              = 639, -- D-pad Up                                         -- Move / Tweak / Resize Window (in Windowing mode)
    GamepadDpadDown            = 640, -- D-pad Down                                       -- Move / Tweak / Resize Window (in Windowing mode)
    GamepadL1                  = 641, -- L Bumper (Xbox)  L (Switch)   L1 (PS)            -- Tweak Slower / Focus Previous (in Windowing mode)
    GamepadR1                  = 642, -- R Bumper (Xbox)  R (Switch)   R1 (PS)            -- Tweak Faster / Focus Next (in Windowing mode)
    GamepadL2                  = 643, -- L Trig. (Xbox)   ZL (Switch)  L2 (PS) [Analog]
    GamepadR2                  = 644, -- R Trig. (Xbox)   ZR (Switch)  R2 (PS) [Analog]
    GamepadL3                  = 645, -- L Stick (Xbox)   L3 (Switch)  L3 (PS)
    GamepadR3                  = 646, -- R Stick (Xbox)   R3 (Switch)  R3 (PS)
    GamepadLStickLeft          = 647, -- [Analog]                                         -- Move Window (in Windowing mode)
    GamepadLStickRight         = 648, -- [Analog]                                         -- Move Window (in Windowing mode)
    GamepadLStickUp            = 649, -- [Analog]                                         -- Move Window (in Windowing mode)
    GamepadLStickDown          = 650, -- [Analog]                                         -- Move Window (in Windowing mode)
    GamepadRStickLeft          = 651, -- [Analog]
    GamepadRStickRight         = 652, -- [Analog]
    GamepadRStickUp            = 653, -- [Analog]
    GamepadRStickDown          = 654, -- [Analog]

    -- Aliases: Mouse Buttons (auto-submitted from AddMouseButtonEvent() calls)
    -- - This is mirroring the data also written to io.MouseDown[], io.MouseWheel, in a format allowing them to be accessed via standard key API.
    MouseLeft                  = 655,
    MouseRight                 = 656,
    MouseMiddle                = 657,
    MouseX1                    = 658,
    MouseX2                    = 659,
    MouseWheelX                = 660,
    MouseWheelY                = 661,

    -- [Internal] Prior to 1.87 we required user to fill io.KeysDown[512] using their own native index + the io.KeyMap[] array.
    -- We are ditching this method but keeping a legacy path for user code doing e.g. IsKeyPressed(MY_NATIVE_KEY_CODE)
    -- If you need to iterate all keys (for e.g. an input mapper) you may use ImGuiKey_NamedKey_BEGIN..ImGuiKey_NamedKey_END.
    NamedKey_BEGIN             = 512,
    NamedKey_END               = 666,
    NamedKey_COUN              = 154,
}


-- Keyboard Modifiers (explicitly submitted by backend via AddKeyEvent() calls)
-- - This is mirroring the data also written to io.KeyCtrl, io.KeyShift, io.KeyAlt, io.KeySuper, in a format allowing
--   them to be accessed via standard key API, allowing calls such as IsKeyPressed(), IsKeyReleased(), querying duration etc.
-- - Code polling every key (e.g. an interface to detect a key press for input mapping) might want to ignore those
--   and prefer using the real keys (e.g. ImGuiKey_LeftCtrl, ImGuiKey_RightCtrl instead of ImGuiMod_Ctrl).
-- - In theory the value of keyboard modifiers should be roughly equivalent to a logical or of the equivalent left/right keys.
--   In practice: it's complicated; mods are often provided from different sources. Keyboard layout, IME, sticky keys and
--   backends tend to interfere and break that equivalence. The safer decision is to relay that ambiguity down to the end-user...
---@enum ImGuiMod
ImGuiMod = {
    ImGuiMod_None              = 0,
    ImGuiMod_Ctrl              = 0x1000, -- Ctrl
    ImGuiMod_Shift             = 0x2000, -- Shift
    ImGuiMod_Alt               = 0x4000, -- Option/Menu
    ImGuiMod_Super             = 0x8000, -- Cmd/Super/Windows
    ImGuiMod_Shortcut          = 0x0800, -- Alias for Ctrl (non-macOS) _or_ Super (macOS).
    ImGuiMod_Mask_             = 0xF800, -- 5-bits
}


-- Configuration flags stored in io.ConfigFlags. Set by user/application.
---@enum ImGuiConfigFlags
ImGuiConfigFlags = {
    None                       = 0,
    NavEnableKeyboard          = 0x0001, -- Master keyboard navigation enable flag. NewFrame() will automatically fill io.NavInputs[] based on io.KeysDown[].
    NavEnableGamepad           = 0x0002, -- Master gamepad navigation enable flag. This is mostly to instruct your imgui backend to fill io.NavInputs[]. Backend also needs to set ImGuiBackendFlags_HasGamepad.
    NavEnableSetMousePos       = 0x0004, -- Instruct navigation to move the mouse cursor. May be useful on TV/console systems where moving a virtual mouse is awkward. Will update io.MousePos and set io.WantSetMousePos=true. If enabled you MUST honor io.WantSetMousePos requests in your backend, otherwise ImGui will react as if the mouse is jumping around back and forth.
    NavNoCaptureKeyboard       = 0x0008, -- Instruct navigation to not set the io.WantCaptureKeyboard flag when io.NavActive is set.
    NoMouse                    = 0x0010, -- Instruct imgui to clear mouse position/buttons in NewFrame(). This allows ignoring the mouse information set by the backend.
    NoMouseCursorChange        = 0x0020, -- Instruct backend to not alter mouse cursor shape and visibility. Use if the backend cursor changes are interfering with yours and you don't want to use SetMouseCursor() to change mouse cursor. You may want to honor requests from imgui by reading GetMouseCursor() yourself instead.

    -- [BETA] Docking
    DockingEnable              = 0x0040, -- Docking enable flags.

    -- [BETA] Viewports
    -- When using viewports it is recommended that your default value for ImGuiCol_WindowBg is opaque (Alpha=1.0) so transition to a viewport won't be noticeable.
    ViewportsEnable            = 0x0400, -- Viewport enable flags (require both ImGuiBackendFlags_PlatformHasViewports + ImGuiBackendFlags_RendererHasViewports set by the respective backends)
    DpiEnableScaleViewports    = 0x4000, -- [BETA: Don't use] FIXME-DPI: Reposition and resize imgui windows when the DpiScale of a viewport changed (mostly useful for the main viewport hosting other window). Note that resizing the main window itself is up to your application.
    DpiEnableScaleFonts        = 0x0800, -- [BETA: Don't use] FIXME-DPI: Request bitmap-scaled fonts to match DpiScale. This is a very low-quality workaround. The correct way to handle DPI is _currently_ to replace the atlas and/or fonts in the Platform_OnChangedViewport callback, but this is all early work in progress.

    -- User storage (to allow your backend/engine to communicate to code that may be shared between multiple projects. Those flags are not used by core Dear ImGui)
    IsSRGB                     = 0x100000, -- Application is SRGB-aware.
    IsTouchScreen              = 0x200000, -- Application is using a touch screen instead of a mouse.
}


-- Enumeration for PushStyleColor() / PopStyleColor()
---@enum ImGuiCol
ImGuiCol = {
    Text                       = 0,
    TextDisabled               = 1,
    WindowBg                   = 2, -- Background of normal windows
    ChildBg                    = 3, -- Background of child windows
    PopupBg                    = 4, -- Background of popups, menus
    Border                     = 5,
    BorderShadow               = 6,
    FrameBg                    = 7, -- Background of checkbox, radio button, plot, slider, text input
    FrameBgHovered             = 8,
    FrameBgActive              = 9,
    TitleBg                    = 10,
    TitleBgActive              = 11,
    TitleBgCollapsed           = 12,
    MenuBarBg                  = 13,
    ScrollbarBg                = 14,
    ScrollbarGrab              = 15,
    ScrollbarGrabHovered       = 16,
    ScrollbarGrabActive        = 17,
    CheckMark                  = 18,
    SliderGrab                 = 19,
    SliderGrabActive           = 20,
    Button                     = 21,
    ButtonHovered              = 22,
    ButtonActive               = 23,
    Header                     = 24, -- Header* colors are used for CollapsingHeader, TreeNode, Selectable
    HeaderHovered              = 25,
    HeaderActive               = 26,
    Separator                  = 27,
    SeparatorHovered           = 28,
    SeparatorActive            = 29,
    ResizeGrip                 = 30, -- Resize grip in lower-right and lower-left corners of windows.
    ResizeGripHovered          = 31,
    ResizeGripActive           = 32,
    Tab                        = 33, -- TabItem in a TabBar
    TabHovered                 = 34,
    TabActive                  = 35,
    TabUnfocused               = 36,
    TabUnfocusedActive         = 37,
    DockingPreview             = 38, -- Preview overlay color when about to docking something
    DockingEmptyBg             = 39, -- Background color for empty node (e.g. CentralNode with no window docked into it)
    PlotLines                  = 40,
    PlotLinesHovered           = 41,
    PlotHistogram              = 42,
    PlotHistogramHovered       = 43,
    TableHeaderBg              = 44, -- Table header background
    TableBorderStrong          = 45, -- Table outer and header borders (prefer using Alpha=1.0 here)
    TableBorderLight           = 46, -- Table inner borders (prefer using Alpha=1.0 here)
    TableRowBg                 = 47, -- Table row background (even rows)
    TableRowBgAlt              = 48, -- Table row background (odd rows)
    TextSelectedBg             = 49,
    DragDropTarget             = 50, -- Rectangle highlighting a drop target
    NavHighlight               = 51, -- Gamepad/keyboard: current highlighted item
    NavWindowingHighlight      = 52, -- Highlight window when using CTRL+TAB
    NavWindowingDimBg          = 53, -- Darken/colorize entire screen behind the CTRL+TAB window list, when active
    ModalWindowDimBg           = 54, -- Darken/colorize entire screen behind a modal window, when one is active

    COUNT                      = 55,
}


-- Enumeration for PushStyleVar() / PopStyleVar() to temporarily modify the ImGuiStyle structure.
---@enum ImGuiStyleVar
ImGuiStyleVar = {
    -- Enum name ------------------ -- Member in ImGuiStyle structure (see ImGuiStyle for descriptions)
    Alpha                      = 0,  -- float     Alpha
    DisabledAlpha              = 1,  -- float     DisabledAlpha
    WindowPadding              = 2,  -- ImVec2    WindowPadding
    WindowRounding             = 3,  -- float     WindowRounding
    WindowBorderSize           = 4,  -- float     WindowBorderSize
    WindowMinSize              = 5,  -- ImVec2    WindowMinSize
    WindowTitleAlign           = 6,  -- ImVec2    WindowTitleAlign
    ChildRounding              = 7,  -- float     ChildRounding
    ChildBorderSize            = 8,  -- float     ChildBorderSize
    PopupRounding              = 9,  -- float     PopupRounding
    PopupBorderSize            = 10, -- float     PopupBorderSize
    FramePadding               = 11, -- ImVec2    FramePadding
    FrameRounding              = 12, -- float     FrameRounding
    FrameBorderSize            = 13, -- float     FrameBorderSize
    ItemSpacing                = 14, -- ImVec2    ItemSpacing
    ItemInnerSpacing           = 15, -- ImVec2    ItemInnerSpacing
    IndentSpacing              = 16, -- float     IndentSpacing
    CellPadding                = 17, -- ImVec2    CellPadding
    ScrollbarSize              = 18, -- float     ScrollbarSize
    ScrollbarRounding          = 19, -- float     ScrollbarRounding
    GrabMinSize                = 20, -- float     GrabMinSize
    GrabRounding               = 21, -- float     GrabRounding
    TabRounding                = 22, -- float     TabRounding
    TabBarBorderSize           = 23, -- float     TabBarBorderSize
    ButtonTextAlign            = 24, -- ImVec2    ButtonTextAlign
    SelectableTextAlign        = 25, -- ImVec2    SelectableTextAlign
    SeparatorTextBorderSize    = 26, -- float     SeparatorTextBorderSize
    SeparatorTextAlign         = 27, -- ImVec2    SeparatorTextAlign
    SeparatorTextPadding       = 28, -- ImVec2    SeparatorTextPadding
    DockingSeparatorSize       = 29, -- float     DockingSeparatorSize
    COUNT                      = 30
}


-- // Flags for InvisibleButton() [extended in imgui_internal.h]
---@enum ImGuiButtonFlags
ImGuiButtonFlags = {
    None                       = 0,
    MouseButtonLeft            = 1, -- React on left mouse button (default)
    MouseButtonRight           = 2, -- React on right mouse button
    MouseButtonMiddle          = 4, -- React on center mouse button
}


-- Flags for ColorEdit3() / ColorEdit4() / ColorPicker3() / ColorPicker4() / ColorButton()
---@enum ImGuiColorEditFlags
ImGuiColorEditFlags = {
    None                       = 0,
    NoAlpha                    = 0x00000002, -- ColorEdit, ColorPicker, ColorButton: ignore Alpha component (will only read 3 components from the input pointer).
    NoPicker                   = 0x00000004, -- ColorEdit: disable picker when clicking on color square.
    NoOptions                  = 0x00000008, -- ColorEdit: disable toggling options menu when right-clicking on inputs/small preview.
    NoSmallPreview             = 0x00000010, -- ColorEdit, ColorPicker: disable color square preview next to the inputs. (e.g. to show only the inputs)
    NoInputs                   = 0x00000020, -- ColorEdit, ColorPicker: disable inputs sliders/text widgets (e.g. to show only the small preview color square).
    NoTooltip                  = 0x00000040, -- ColorEdit, ColorPicker, ColorButton: disable tooltip when hovering the preview.
    NoLabel                    = 0x00000080, -- ColorEdit, ColorPicker: disable display of inline text label (the label is still forwarded to the tooltip and picker).
    NoSidePreview              = 0x00000100, -- ColorPicker: disable bigger color preview on right side of the picker, use small color square preview instead.
    NoDragDrop                 = 0x00000200, -- ColorEdit: disable drag and drop target. ColorButton: disable drag and drop source.
    NoBorder                   = 0x00000400, -- ColorButton: disable border (which is enforced by default)

    -- User Options (right-click on widget to change some of them).
    AlphaBar                   = 0x00010000, -- ColorEdit, ColorPicker: show vertical alpha bar/gradient in picker.
    AlphaPreview               = 0x00020000, -- ColorEdit, ColorPicker, ColorButton: display preview as a transparent color over a checkerboard, instead of opaque.
    AlphaPreviewHalf           = 0x00040000, -- ColorEdit, ColorPicker, ColorButton: display half opaque / half checkerboard, instead of opaque.
    HDR                        = 0x00080000, -- (WIP) ColorEdit: Currently only disable 0.0f..1.0f limits in RGBA edition (note: you probably want to use ImGuiColorEditFlags_Float flag as well).
    DisplayRGB                 = 0x00100000, -- [Display] ColorEdit: override _display_ type among RGB/HSV/Hex. ColorPicker: select any combination using one or more of RGB/HSV/Hex.
    DisplayHSV                 = 0x00200000, -- [Display] ColorEdit: override _display_ type among RGB/HSV/Hex. ColorPicker: select any combination using one or more of RGB/HSV/Hex.
    DisplayHex                 = 0x00400000, -- [Display] ColorEdit: override _display_ type among RGB/HSV/Hex. ColorPicker: select any combination using one or more of RGB/HSV/Hex.
    Uint8                      = 0x00800000, -- [DataType] ColorEdit, ColorPicker, ColorButton: _display_ values formatted as 0..255.
    Float                      = 0x01000000, -- [DataType] ColorEdit, ColorPicker, ColorButton: _display_ values formatted as 0.0f..1.0f floats instead of 0..255 integers. No round-trip of value via integers.
    PickerHueBar               = 0x02000000, -- [Picker] ColorPicker: bar for Hue, rectangle for Sat/Value.
    PickerHueWheel             = 0x04000000, -- [Picker] ColorPicker: wheel for Hue, triangle for Sat/Value.
    InputRGB                   = 0x08000000, -- [Input] ColorEdit, ColorPicker: input and output data in RGB format.
    InputHSV                   = 0x10000000, -- [Input] ColorEdit, ColorPicker: input and output data in HSV format.

    -- Defaults Options. You can set application defaults using SetColorEditOptions(). The intent is that you probably don't want to
    -- override them in most of your calls. Let the user choose via the option menu and/or call SetColorEditOptions() once during startup.
    DefaultOptions_            = 0x0A900000, -- Uint8 | DisplayRGB | InputRGB | PickerHueBar
}


---Flags for DragFloat(), DragInt(), SliderFloat(), SliderInt() etc.
--
---We use the same sets of flags for DragXXX() and SliderXXX() functions as the features are the same and it makes it easier to swap them.
---@enum ImGuiSliderFlags
ImGuiSliderFlags = {
    None                       = 0x00,
    AlwaysClamp                = 0x10, -- Clamp value to min/max bounds when input manually with CTRL+Click. By default CTRL+Click allows going out of bounds.
    Logarithmic                = 0x20, -- Make the widget logarithmic (linear otherwise). Consider using ImGuiSliderFlags_NoRoundToFormat with this if using a format-string with small amount of digits.
    NoRoundToFormat            = 0x40, -- Disable rounding underlying value to match precision of the display format string (e.g. %.3f values are rounded to those 3 digits)
    NoInput                    = 0x80, -- Disable CTRL+Click or Enter key allowing to input text directly into the widget
}


-- Identify a mouse button.
--
-- Those values are guaranteed to be stable and we frequently use 0/1 directly. Named enums provided for convenience.
---@enum ImGuiMouseButton
ImGuiMouseButton = {
    Left                       = 0,
    Right                      = 1,
    Middle                     = 2,
    Count                      = 5,
}


-- Enumeration for GetMouseCursor()
--
-- User code may request backend to display given cursor by calling SetMouseCursor(), which is why we have some cursors that are marked unused here
---@enum ImGuiMouseCursor
ImGuiMouseCursor = {
    None                       = -1,
    Arrow                      = 0,
    TextInput                  = 1, -- When hovering over InputText, etc.
    ResizeAll                  = 2, -- (Unused by Dear ImGui functions)
    ResizeNS                   = 3, -- When hovering over a horizontal border
    ResizeEW                   = 4, -- When hovering over a vertical border or a column
    ResizeNESW                 = 5, -- When hovering over the bottom-left corner of a window
    ResizeNWSE                 = 6, -- When hovering over the bottom-right corner of a window
    Hand                       = 7, -- (Unused by Dear ImGui functions. Use for e.g. hyperlinks)
    NotAllowed                 = 8, -- When hovering something with disallowed interaction. Usually a crossed circle.
    COUNT                      = 9
};


-- Enumeration for AddMouseSourceEvent() actual source of Mouse Input data.
--
-- Historically we use "Mouse" terminology everywhere to indicate pointer data, e.g. MousePos, IsMousePressed(), io.AddMousePosEvent()
-- But that "Mouse" data can come from different source which occasionally may be useful for application to know about.
--
-- You can submit a change of pointer type using io.AddMouseSourceEvent().
---@enum ImGuiMouseSource
ImGuiMouseSource = {
    Mouse                      = 0, -- Input is coming from an actual mouse.
    TouchScreen                = 1, -- Input is coming from a touch screen (no hovering prior to initial press, less precise initial press aiming, dual-axis wheeling possible).
    Pen                        = 2, -- Input is coming from a pressure/magnetic pen (often used in conjunction with high-sampling rates).
    COUNT                      = 3,
};


-- Enumeration for ImGui.SetWindow***(), SetNextWindow***(), SetNextItem***() functions
--
-- Represent a condition.
--
-- Important: Treat as a regular enum! Do NOT combine multiple values using binary operators! All the functions above treat 0 as a shortcut to ImGuiCond_Always.
---@enum ImGuiCond
ImGuiCond = {
    None                       = 0,  -- No condition (always set the variable), same as _Always
    Always                     = 1,  -- No condition (always set the variable)
    Once                       = 2,  -- Set the variable once per runtime session (only the first call will succeed)
    FirstUseEver               = 4,  -- Set the variable if the object/window has no persistently saved data (no entry in .ini file)
    Appearing                  = 8,  -- Set the variable if the object/window is appearing after being hidden/inactive (or the first time)
}


-- Flags for ImDrawList functions
---@enum ImDrawFlags
ImDrawFlags = {
    None                       = 0,
    Closed                     = 0x001, -- PathStroke(), AddPolyline(): specify that shape should be closed (Important: this is always == 1 for legacy reason)
    RoundCornersTopLeft        = 0x010, -- AddRect(), AddRectFilled(), PathRect(): enable rounding top-left corner only (when rounding > 0.0f, we default to all corners). Was 0x01.
    RoundCornersTopRight       = 0x020, -- AddRect(), AddRectFilled(), PathRect(): enable rounding top-right corner only (when rounding > 0.0f, we default to all corners). Was 0x02.
    RoundCornersBottomLeft     = 0x040, -- AddRect(), AddRectFilled(), PathRect(): enable rounding bottom-left corner only (when rounding > 0.0f, we default to all corners). Was 0x04.
    RoundCornersBottomRight    = 0x080, -- AddRect(), AddRectFilled(), PathRect(): enable rounding bottom-right corner only (when rounding > 0.0f, we default to all corners). Wax 0x08.
    RoundCornersNone           = 0x100, -- AddRect(), AddRectFilled(), PathRect(): disable rounding on all corners (when rounding > 0.0f). This is NOT zero, NOT an implicit flag!
    RoundCornersTop            = 0x030, -- RoundCornersTopLeft | RoundCornersTopRight,
    RoundCornersBottom         = 0x0C0, -- RoundCornersBottomLeft | RoundCornersBottomRight,
    RoundCornersLeft           = 0x050, -- RoundCornersBottomLeft | RoundCornersTopLeft,
    RoundCornersRight          = 0x0A0, -- RoundCornersBottomRight | RoundCornersTopRight,
    RoundCornersAll            = 0x0F0, -- RoundCornersTopLeft | RoundCornersToRight | RoundCornersBottomLeft | RoundCornersBottomRight,
}


-- Flags for ImDrawList instance. Those are set automatically by ImGui:: functions from ImGuiIO settings, and generally not manipulated directly.
-- It is however possible to temporarily alter flags between calls to ImDrawList:: functions.
---@enum ImDrawListFlags
ImDrawListFlags = {
    None                       = 0x00,
    AntiAliasedLines           = 0x01, -- Enable anti-aliased lines/borders (*2 the number of triangles for 1.0f wide line or lines thin enough to be drawn using textures, otherwise *3 the number of triangles)
    AntiAliasedLinesUseTex     = 0x02, -- Enable anti-aliased lines/borders using textures when possible. Require backend to render with bilinear filtering (NOT point/nearest filtering).
    AntiAliasedFill            = 0x04, -- Enable anti-aliased edge around filled shapes (rounded rectangles, circles).
    AllowVtxOffset             = 0x08, -- Can emit 'VtxOffset > 0' to allow large meshes. Set when 'ImGuiBackendFlags_RendererHasVtxOffset' is enabled.
}


-- Flags for ImFontAtlas build
---@enum ImFontAtlasFlags
ImFontAtlasFlags = {
    None                       = 0,
    NoPowerOfTwoHeight         = 0x01, -- Don't round the height to next power of two
    NoMouseCursors             = 0x02, -- Don't build software mouse cursors into the atlas (save a little texture memory)
    NoBakedLines               = 0x04, -- Don't build thick line textures into the atlas (save a little texture memory, allow support for point/nearest filtering). The AntiAliasedLinesUseTex features uses them, otherwise they will be rendered using polygons (more expensive for CPU/GPU).
}


-- Flags stored in ImGuiViewport::Flags, giving indications to the platform backends.
---@enum ImGuiViewportFlags
ImGuiViewportFlags = {
    None                       = 0,
    IsPlatformWindow           = 0x0001, -- Represent a Platform Window
    IsPlatformMonitor          = 0x0002, -- Represent a Platform Monitor (unused yet)
    OwnedByApp                 = 0x0004, -- Platform Window: Was created/managed by the user application? (rather than our backend)
    NoDecoration               = 0x0008, -- Platform Window: Disable platform decorations: title bar, borders, etc. (generally set all windows, but if ImGuiConfigFlags_ViewportsDecoration is set we only set this on popups/tooltips)
    NoTaskBarIcon              = 0x0010, -- Platform Window: Disable platform task bar icon (generally set on popups/tooltips, or all windows if ImGuiConfigFlags_ViewportsNoTaskBarIcon is set)
    NoFocusOnAppearing         = 0x0020, -- Platform Window: Don't take focus when created.
    NoFocusOnClick             = 0x0040, -- Platform Window: Don't take focus when clicked on.
    NoInputs                   = 0x0080, -- Platform Window: Make mouse pass through so we can drag this window while peaking behind it.
    NoRendererClear            = 0x0100, -- Platform Window: Renderer doesn't need to clear the framebuffer ahead (because we will fill it entirely).
    NoAutoMerge                = 0x0200, -- Platform Window: Avoid merging this window into another host window. This can only be set via ImGuiWindowClass viewport flags override (because we need to now ahead if we are going to create a viewport in the first place!).
    TopMost                    = 0x0400, -- Platform Window: Display on top (for tooltips only).
    CanHostOtherWindows        = 0x0800, -- Viewport can host multiple imgui windows (secondary viewports are associated to a single window). // FIXME: In practice there's still probably code making the assumption that this is always and only on the MainViewport. Will fix once we add support for "no main viewport".

    -- Output status flags (from Platform)
    IsMinimized                = 0x1000, -- Platform Window: Window is minimized, can skip render. When minimized we tend to avoid using the viewport pos/size for clipping window or testing if they are contained in the viewport.
    IsFocused                  = 0x2000, -- Platform Window: Window is focused (last call to Platform_GetWindowFocus() returned true)
}
