---@meta ImGui

--
-- ## ImGui User Types
--


-- ### ImVec2

---@class ImVec2
---@field x number
---@field y number
---@operator add(ImVec2): ImVec2
---@operator add(number): ImVec2
---@operator mul(ImVec2): ImVec2
---@operator mul(number): ImVec2
---@operator div(ImVec2): ImVec2
---@operator div(number): ImVec2
---@operator sub(ImVec2): ImVec2
---@operator sub(number): ImVec2
ImVec2 = {}

---@param x number
---@param y number
---@return ImVec2
function ImVec2(x, y) end
---@return ImVec2
function ImVec2() end


-- ### ImVec4

---@class ImVec4
---@field x number
---@field y number
---@field z number
---@field w number
---@operator add(ImVec4): ImVec4
---@operator add(number): ImVec4
---@operator mul(ImVec4): ImVec4
---@operator mul(number): ImVec4
---@operator div(ImVec4): ImVec4
---@operator div(number): ImVec4
---@operator sub(ImVec4): ImVec4
---@operator sub(number): ImVec4
ImVec4 = {}

-- Construct an ImVec4 from components. If creating a color, these correspond with Red, Green, Blue, and Alpha, repsectively.
---@param x number
---@param y number
---@param z number
---@param w number
---@return ImVec4
function ImVec4(x, y, z, w) end

-- Construct an ImVec4 representing a color, from an ImU32 color number
---@param color ImU32
---@return ImVec4
function ImVec4.FromImU32(color) end

-- Convert ImVec4 to a ImU32
---@return ImU32
function ImVec4:ToImU32() end


--
-- ## ImGuiStyle
--

---@class ImGuiStyle
---@field FontSizeBase number Current base font size before external global factors are applied. Use PushFont(NULL, size) to modify. Use ImGui::GetFontSize() to obtain scaled value.
---@field FontSizeMin number Main global scale factor. May be set by application once, or exposed to end-user.
---@field FontScaleDpi number Additional global scale factor from viewport/monitor contents scale. When io.ConfigDpiScaleFonts is enabled, this is automatically overwritten when changing monitor DPI.
---@field Alpha number Global alpha applies to everything in Dear ImGui.
---@field DisabledAlpha number Additional alpha multiplier applied by BeginDisabled(). Multiply over current value of Alpha.
---@field WindowPadding ImVec2 Padding within a window.
---@field WindowRounding number Radius of window corners rounding. Set to 0.0f to have rectangular windows. Large values tend to lead to variety of artifacts and are not recommended.
---@field WindowBorderSize number Thickness of border around windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
---@field WindowBorderHoverPadding number  Hit-testing extent outside/inside resizing border. Also extend determination of hovered window. Generally meaningfully larger than WindowBorderSize to make it easy to reach borders.
---@field WindowMinSize ImVec2 Minimum window size. This is a global setting. If you want to constraint individual windows, use SetNextWindowSizeConstraints().
---@field WindowTitleAlign ImVec2 Alignment for title bar text. Defaults to (0.0f,0.5f) for left-aligned,vertically centered.
---@field WindowMenuButtonPosition ImGuiDir Side of the collapsing/docking button in the title bar (None/Left/Right). Defaults to ImGuiDir_Left.
---@field ChildRounding number Radius of child window corners rounding. Set to 0.0f to have rectangular windows.
---@field ChildBorderSize number Thickness of border around child windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
---@field PopupRounding number Radius of popup window corners rounding. (Note that tooltip windows use WindowRounding)
---@field PopupBorderSize number Thickness of border around popup/tooltip windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
---@field FramePadding ImVec2 Padding within a framed rectangle (used by most widgets).
---@field FrameRounding number Radius of frame corners rounding. Set to 0.0f to have rectangular frame (used by most widgets).
---@field FrameBorderSize number Thickness of border around frames. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
---@field ItemSpacing ImVec2 Horizontal and vertical spacing between widgets/lines.
---@field ItemInnerSpacing ImVec2 Horizontal and vertical spacing between within elements of a composed widget (e.g. a slider and its label).
---@field CellPadding ImVec2 Padding within a table cell
---@field TouchExtraPadding ImVec2 Expand reactive bounding box for touch-based system where touch position is not accurate enough. Unfortunately we don't sort widgets so priority on overlap will always be given to the first widget. So don't grow this too much!
---@field IndentSpacing number Horizontal indentation when e.g. entering a tree node. Generally == (FontSize + FramePadding.x*2).
---@field ColumnsMinSpacing number Minimum horizontal spacing between two columns. Preferably > (FramePadding.x + 1).
---@field ScrollbarSize number Width of the vertical scrollbar, Height of the horizontal scrollbar.
---@field ScrollbarRounding number Radius of grab corners for scrollbar.
---@field ScrollbarPadding number Padding of scrollbar grab within its frame (same for both axes).
---@field GrabMinSize number Minimum width/height of a grab box for slider/scrollbar.
---@field GrabRounding number Radius of grabs corners rounding. Set to 0.0f to have rectangular slider grabs.
---@field LayoutAlign number Element alignment inside horizontal and vertical layouts (0.0f - left/top, 1.0f - right/bottom, 0.5f - center).
---@field LogSliderDeadzone number The size in pixels of the dead-zone around zero on logarithmic sliders that cross zero.
---@field TabRounding number Radius of upper corners of a tab. Set to 0.0f to have rectangular tabs.
---@field TabBorderSize number Thickness of border around tabs.
---@field TabMinWidthBase number Minimum tab width, to make tabs larger than their contents. TabBar buttons are not affected.
---@field TabMinWidthShrink number Minimum tab width after shrinking, when using ImGuiTabBarFlags_FittingPolicyMixed policy.
---@field TabCloseButtonMinWidthSelected number -1: always visible. 0.0f: visible when hovered. >0.0f: visible when hovered if minimum width.
---@field TabCloseButtonMinWidthUnselected number -1: always visible. 0.0f: visible when hovered. >0.0f: visible when hovered if minimum width.
---@field TabBarBorderSize number Thickness of tab-bar separator, which takes on the tab active color to denote focus.
---@field TabBarOverlineSize number Thickness of tab-bar overline, which highlights the selected tab-bar.
---@field TableAngledHeadersAngle number Angle of angled headers (supported values range from -50.0f degrees to +50.0f degrees).
---@field TableAngledHeadersTextAlign ImVec2 Alignment of angled headers within the cell
---@field TreeLinesFlags ImGuiTreeNodeFlags Default way to draw lines connecting TreeNode hierarchy. ImGuiTreeNodeFlags_DrawLinesNone or ImGuiTreeNodeFlags_DrawLinesFull or ImGuiTreeNodeFlags_DrawLinesToNodes.
---@field TreeLinesSize number Thickness of outlines when using ImGuiTreeNodeFlags_DrawLines.
---@field TreeLinesRounding number Radius of lines connecting child nodes to the vertical line.
---@field DragDropTargetRounding number Radius of the drag and drop target frame.
---@field DragDropTargetBorderSize number Thickness of the drag and drop target border.
---@field DragDropTargetPadding number Size to expand the drag and drop target from actual target item size.
---@field ColorButtonPosition ImGuiDir Side of the color button in the ColorEdit4 widget (left/right). Defaults to ImGuiDir_Right.
---@field ButtonTextAlign ImVec2 Alignment of button text when button is larger than text. Defaults to (0.5f, 0.5f) (centered).
---@field SelectableTextAlign ImVec2 Alignment of selectable text. Defaults to (0.0f, 0.0f) (top-left aligned). It's generally important to keep this left-aligned if you want to lay multiple items on a same line.
---@field SeparatorTextBorderSize number Thickkness of border in SeparatorText()
---@field SeparatorTextAlign ImVec2 Alignment of text within the separator. Defaults to (0.0f, 0.5f) (left aligned, center).
---@field DisplayWindowPadding ImVec2 Window position are clamped to be visible within the display area or monitors by at least this amount. Only applies to regular windows.
---@field DisplaySafeAreaPadding ImVec2 If you cannot see the edges of your screen (e.g. on a TV) increase the safe area padding. Apply to popups/tooltips as well regular windows. NB: Prefer configuring your TV sets correctly!
---@field DockingNodeHasCloseButton boolean Docking node has their own CloseButton() to close all docked windows.
---@field DockingSeparatorSize number Thickness of resizing border between docked windows
---@field MouseCursorScale number Scale software rendered mouse cursor (when io.MouseDrawCursor is enabled). We apply per-monitor DPI scaling over this scale. May be removed later.
---@field AntiAliasedLines boolean Enable anti-aliased lines/borders. Disable if you are really tight on CPU/GPU. Latched at the beginning of the frame (copied to ImDrawList).
---@field AntiAliasedLinesUseTex boolean Enable anti-aliased lines/borders using textures where possible. Require backend to render with bilinear filtering. Latched at the beginning of the frame (copied to ImDrawList).
---@field AntiAliasedFill boolean Enable anti-aliased edges around filled shapes (rounded rectangles, circles, etc.). Disable if you are really tight on CPU/GPU. Latched at the beginning of the frame (copied to ImDrawList).
---@field CurveTessellationTol number Tessellation tolerance when using PathBezierCurveTo() without a specific number of segments. Decrease for highly tessellated curves (higher quality, more polygons), increase to reduce quality.
---@field CircleTessellationMaxError number Maximum error (in pixels) allowed when using AddCircle()/AddCircleFilled() or drawing rounded corner rectangles with no explicit segment count specified. Decrease for higher quality but more geometry.
---@field Colors ImVec4[]
---@field HoverStationaryDelay number Delay for IsItemHovered(ImGuiHoveredFlags_Stationary). Time required to consider mouse stationary.
---@field HoverDelayShort number Delay for IsItemHovered(ImGuiHoveredFlags_DelayShort). Usually used along with HoverStationaryDelay.
---@field HoverDelayNormal number  Delay for IsItemHovered(ImGuiHoveredFlags_DelayNormal). "
---@field HoverFlagsForTooltipMouse ImGuiHoveredFlags Default flags when using IsItemHovered(ImGuiHoveredFlags_ForTooltip) or BeginItemTooltip()/SetItemTooltip() while using mouse.
---@field HoverFlagsForTooltipNav ImGuiHoveredFlags  Default flags when using IsItemHovered(ImGuiHoveredFlags_ForTooltip) or BeginItemTooltip()/SetItemTooltip() while using keyboard/gamepad.
local ImGuiStyle = {}


---@return ImGuiStyle
function ImGuiStyle.new() end

--- Return a copy of the style
---@return ImGuiStyle
function ImGuiStyle:Copy() end

-- To scale your entire UI (e.g. if you want your app to use High DPI or generally be DPI aware) you may use this helper function. Scaling the fonts is done separately and is up to you.
--
-- Important: This operation is lossy because we round all sizes to integer. If you need to change your scale multiples, call this over a freshly initialized ImGuiStyle structure rather than scaling multiple times.
---@param scaleFactor number
function ImGuiStyle:ScaleAllSizes(scaleFactor) end


--
-- ## ImGuiIO
--

-- Communicate most settings and inputs/outputs to Dear ImGui using this structure.
-- Access via ImGui::GetIO(). Read 'Programmer guide' section in .cpp file for general usage.
-- It is generally expected that:
-- - initialization: backends and user code writes to ImGuiIO.
-- - main loop: backends writes to ImGuiIO, user code and imgui code reads from ImGuiIO.
--
-- Also see ImGui::GetPlatformIO() and ImGuiPlatformIO struct for OS/platform related functions: clipboard, IME etc.
--
-- **Most of these fields are read-only to lua, since it is not expected to modify them directly from a lua script.**
---@class ImGuiIO
---@field public ConfigFlags ImGuiConfigFlags See ImGuiConfigFlags enum. Set by user/application. Gamepad/keyboard navigation options, etc.
---@field public BackendFlags ImGuiBackendFlags See ImGuiBackendFlags_enum. Set by backend (imgui_impl_xxx files or custom backend) to communicate features supported by the backend.
---@field public DisplaySize ImVec2 Main display size, in pixels (generally == GetMainViewport()->Size). May change every frame.
---@field public DisplayFramebufferScale ImVec2 [default: (1, 1)] Main display density. For retina display where window coordinates are different from framebuffer coordinates. This will affect font density + will end up in ImDrawData::FramebufferScale.
---@field public DeltaTime number Time elapsed since last frame, in seconds. May change every frame.
---@field public IniSavingRate number [default: 5.0] Minimum time between saving positions/sizes to .ini file, in seconds.
---@field public IniFilename string Path to .ini file (important: default "imgui.ini" is relative to current working dir!). Set NULL to disable automatic .ini loading/saving or if you want to manually call LoadIniSettingsXXX() / SaveIniSettingsXXX() functions.
---@field public LogFilename string Path to .log file (default parameter to ImGui::LogToFile when no file is specified).
---@field public Fonts ImFontAtlas Font atlas: load, rasterize and pack one or more fonts into a single texture.
---@field public FontDefault ImFont Font to use on NewFrame(). Use NULL to uses Fonts->Fonts[0].
---@field public FontAllowUserScaling boolean [default: false] Allow user scaling text of individual window with Ctrl+Wheel.
---@field public Framerate number Estimate of application framerate (rolling average over 60 frames, based on io.DeltaTime), in frame per second. Solely for convenience. Slow applications may not want to use a moving average or may want to reset underlying buffers occasionally.
---@field public MouseDelta ImVec2 Mouse delta. Note that this is zero if either current or previous position are invalid (-FLT_MAX,-FLT_MAX), so a disappearing/reappearing mouse won't have a huge delta.
---@field public MousePos ImVec2 Mouse position, in pixels. Set to ImVec2(-FLT_MAX, -FLT_MAX) if mouse is unavailable (on another screen, etc.)
---@field public KeyCtrl boolean Keyboard modifier down: Control
---@field public KeyShift boolean Keyboard modifier down: Shift
---@field public KeyAlt boolean Keyboard modifier down: Alt
---@field public KeySuper boolean Keyboard modifier down: Cmd/Super/Windows
ImGuiIO = {}


--
-- ## Misc data structures
--


-- ### ImGuiWindowClass

---@class ImGuiWindowClass
---@field public ClassId ImGuiID User data. 0 = Default class (unclassed). Windows of different classes cannot be docked with each others.
---@field public ParentViewportId ImGuiID Hint for the platform backend. -1: use default. 0: request platform backend to not parent the platform. != 0: request platform backend to create a parent<>child relationship between the platform windows. Not conforming backends are free to e.g. parent every viewport to the main viewport or not.
---@field public FocusRouteParentWindowId ImGuiID ID of parent window for shortcut focus route evaluation, e.g. Shortcut() call from Parent Window will succeed when this window is focused.
---@field public ViewportFlagsOverrideSet ImGuiViewportFlags Viewport flags to set when a window of this class owns a viewport. This allows you to enforce OS decoration or task bar icon, override the defaults on a per-window basis.
---@field public ViewportFlagsOverrideClear ImGuiViewportFlags Viewport flags to clear when a window of this class owns a viewport. This allows you to enforce OS decoration or task bar icon, override the defaults on a per-window basis.
---@field public TabItemFlagsOverrideSet ImGuiTabItemFlags [EXPERIMENTAL] TabItem flags to set when a window of this class gets submitted into a dock node tab bar. May use with ImGuiTabItemFlags_Leading or ImGuiTabItemFlags_Trailing.
---@field public DockNodeFlagsOverrideSet ImGuiDockNodeFlags [EXPERIMENTAL] Dock node flags to set when a window of this class is hosted by a dock node (it doesn't have to be selected!)
---@field public DockingAlwaysTabBar boolean Set to true to enforce single floating windows of this class always having their own docking node (equivalent of setting the global io.ConfigDockingAlwaysTabBar)
---@field public DockingAllowUnclassed boolean Set to true to allow windows of this class to be docked/merged with an unclassed window.
ImGuiWindowClass = {}

---@return ImGuiWindowClass
function ImGuiWindowClass() end


-- ### ImGuiPayload
-- ### ImGuiTableColumnSortSpecs
-- ### ImGuiTableSortSpecs


--
-- ## Helpers
--

-- ### ImGuiTextFilter

---@enum ImGuiListClipperFlags
ImGuiListClipperFlags = {
    None                       = 0,
    NoSetTableRowCounters      = 0x01, -- [Internal] Disabled modifying table row counters. Avoid assumption that 1 clipper item == 1 table row.
}

-- ### ImGuiListClipper
-- Manually clip large list of items.
--
-- If you have lots evenly spaced items and you have random access to the list, you can perform coarse
-- clipping based on visibility to only submit items that are in view.
--
-- The clipper calculates the range of visible items and advance the cursor to compensate for the non-visible items we have skipped.
--
-- (Dear ImGui already clip items based on their bounds but: it needs to first layout the item to do so, and generally
--  fetching/submitting your own data incurs additional cost. Coarse clipping using ImGuiListClipper allows you to easily
--  scale using lists with tens of thousands of items without a problem)
--
-- Usage:
--   ```lua
--   local clipper = ImGuiListClipper.new();
--   clipper:Begin(1000);         -- We have 1000 elements, evenly spaced.
--   while clipper:Step() do
--       local row
--       for row = clipper.DisplayStart, clipper.DisplayEnd - 1, 1 do
--           ImGui::Text("line number %d", row);
--       end
--   end
--   clipper:End()
--   ```
--
-- Generally what happens is:
-- - Clipper lets you process the first element (DisplayStart = 0, DisplayEnd = 1) regardless of it being visible or not.
-- - User code submit that one element.
-- - Clipper can measure the height of the first element
-- - Clipper calculate the actual range of elements to display based on the current clipping rectangle, position the cursor before the first visible element.
-- - User code submit visible elements.
-- - The clipper also handles various subtleties related to keyboard/gamepad navigation, wrapping etc.
---@class ImGuiListClipper
---@field public DisplayStart number First item to display, updated by each call to Step()
---@field public DisplayEnd number End of items to display (exclusive)
---@field public Flags ImGuiListClipperFlags [Internal] Flags, currently not yet well exposed.
ImGuiListClipper = {}

---@param itemsCount number Use INT_MAX if you don't know how many items you have (in which case the cursor won't be advanced in the final step)
---@param itemsHeight? number Use -1.0f to be calculated automatically on first step. Otherwise pass in the distance between your items, typically GetTextLineHeightWithSpacing() or GetFrameHeightWithSpacing().
function ImGuiListClipper:Begin(itemsCount, itemsHeight) end

-- Automatically called on the last call of Step() that returns false.
function ImGuiListClipper:End() end

-- Call until it returns false. The DisplayStart/DisplayEnd fields will be set and you can process/draw those items.
---@return boolean
function ImGuiListClipper:Step() end

-- Call IncludeItemByIndex() or IncludeItemsByIndex() *BEFORE* first call to Step() if you need a range of items to not be clipped, regardless of their visibility.
-- (Due to alignment / padding of certain items it is possible that an extra item may be included on either end of the display range).
---@param itemBegin number
---@param itemEnd number Is exclusive e.g. use (42, 42+1) to make item 42 never clipped.
function ImGuiListClipper:IncludeItemsByIndex(itemBegin, itemEnd) end

---@param itemIndex number
function ImGuiListClipper:IncludeItemByIndex(itemIndex) end

-- itemEnd is exclusive e.g. use (42, 42+1) to make item 42 never clipped.
---@param itemBegin number
---@param itemEnd number
function ImGuiListClipper:IncludeItemsByIndex(itemBegin, itemEnd) end

-- Seek cursor toward given item. This is automatically called while stepping.
-- - The only reason to call this is: you can use ImGuiListClipper::Begin(INT_MAX) if you don't know item count ahead of time.
-- - In this case, after all steps are done, you'll want to call SeekCursorForItem(item_count).
---@param itemIndex number
function ImGuiListClipper:SeekCursorForItem(itemIndex) end

---@return ImGuiListClipper
function ImGuiListClipper.new() end


-- ### ImColor
-- ImColor is not a discrete type in lua. Rather, it is simply a factory function that returns
-- an instance of ImVec4. We do it this way so we can provide some constructors for ImVec4 that
-- assume the behaviors of colors.

-- construct an ImVec4 from the parameters of a color, where each component is a number with values
-- from 0.0 to 1.0
---@param red number Red color component
---@param green number Green color component
---@param blue number Blue color component
---@param alpha? number Alpha color component. If omitted, alpha will be 100%
---@return ImVec4 color
function ImColor(red, green, blue, alpha) end

-- Default construct an ImVec4, represented as black with 0% alpha
---@return ImVec4 color
function ImColor() end

-- Copy an ImVec4
---@param color ImVec4
---@return ImVec4 color
function ImColor(color) end

-- Create a color from a table. Accepts a table with either three or four components.
---@param table number[]
---@return ImVec4 color
function ImColor(table) end


--
-- ## Drawing API
--


-- ### ImDrawListSplitter


-- ### ImDrawList

---@class ImDrawList
---@field public Flags ImDrawListFlags
ImDrawList = {}


---@class ImDrawListSharedData
---@field public TexUvWhitePixel ImVec2
---@field public Font ImFont
---@field public FontSize number
---@field public CurveTessellationTol number
---@field public CircleSegmentMaxError number
---@field public InitialFlags ImDrawListFlags
---@field public InitialFringeScale number
---@field public ClipRectFullscreen ImVec4
ImDrawListSharedData = {}

---@param maxError number
function ImDrawListSharedData:SetCircleTessellationMaxError(maxError) end

--- Constructs a new ImDrawList from ImDrawListSharedData
---@param sharedData ImDrawListSharedData
---@return ImDrawList
function ImDrawList.new(sharedData) end

--- Render-level scissoring. This is passed down to your render function but not used
--- for CPU-side coarse clipping. Prefer using higher-level ImGui.PushClipRect() to affect
--- logic (hit-testing and widget culling)
---@param clipRectMin ImVec2
---@param clipRectMax ImVec2
---@param intersectWithCurrentClipRect? boolean default: false
function ImDrawList:PushClipRect(clipRectMin, clipRectMax, intersectWithCurrentClipRect) end

function ImDrawList:PushClipRectFullScreen() end

function ImDrawList:PopClipRect() end

---@param texture ImTextureRef
function ImDrawList:PushTexture(texture) end

function ImDrawList:PopTexture() end

---@param textureId ImTextureID
function ImDrawList:PushTextureID(textureId) end

function ImDrawList:PopTextureID() end

---@return ImVec2
function ImDrawList:GetClipRectMin() end

---@return ImVec2
function ImDrawList:GetClipRectMax() end


-- #### Primitives
-- - Filled shapes must always use clockwise winding order. The anti-aliasing fringe depends on it. Counter-clockwise shapes will have "inward" anti-aliasing.
-- - For rectangular primitives, "p_min" and "p_max" represent the upper-left and lower-right corners.
-- - For circle primitives, use "num_segments == 0" to automatically calculate tessellation (preferred).
--   In older versions (until Dear ImGui 1.77) the AddCircle functions defaulted to num_segments == 12.
--   In future versions we will use textures to provide cheaper and higher-quality circles.
--   Use AddNgon() and AddNgonFilled() functions if you need to guarantee a specific number of sides.

---@param p1 ImVec2
---@param p2 ImVec2
---@param col ImU32
---@param thickness? number default: 1.0
function ImDrawList:AddLine(p1, p2, col, thickness) end

---@param pMin ImVec2
---@param pMax ImVec2
---@param col ImU32
---@param rounding? number default: 0.0
---@param flags? ImDrawFlags default: 0
---@param thickness? number default: 1.0
function ImDrawList:AddRect(pMin, pMax, col, rounding, flags, thickness) end

---@param pMin ImVec2
---@param pMax ImVec2
---@param col ImU32
---@param rounding? number default: 0.0
---@param flags? ImDrawFlags default: 0
function ImDrawList:AddRectFilled(pMin, pMax, col, rounding, flags) end

---@param pMin ImVec2
---@param pMax ImVec2
---@param colUpperLeft number
---@param colUpperRight number
---@param colBottomRight number
---@param colBottomLeft number
function ImDrawList:AddRectFilledMultiColor(pMin, pMax, colUpperLeft, colUpperRight, colBottomRight, colBottomLeft) end

---@param p1 ImVec2
---@param p2 ImVec2
---@param p3 ImVec2
---@param p4 ImVec2
---@param col ImU32
---@param thickness? number default: 1.0
function ImDrawList:AddQuad(p1, p2, p3, p4, col, thickness) end

---@param p1 ImVec2
---@param p2 ImVec2
---@param p3 ImVec2
---@param p4 ImVec2
---@param col ImU32
function ImDrawList:AddQuadFilled(p1, p2, p3, p4, col) end

---@param p1 ImVec2
---@param p2 ImVec2
---@param p3 ImVec2
---@param col ImU32
---@param thickness? number default: 1.0
function ImDrawList:AddTriangle(p1, p2, p3, col, thickness) end

---@param p1 ImVec2
---@param p2 ImVec2
---@param p3 ImVec2
---@param col ImU32
function ImDrawList:AddTriangleFilled(p1, p2, p3, col) end

---@param center ImVec2
---@param radius number
---@param col ImU32
---@param numSegments? number @default: 0 (automatic)
---@param thickness? number @default: 1.0
function ImDrawList:AddCircle(center, radius, col, numSegments, thickness) end

---@param center ImVec2
---@param radius number
---@param col ImU32
---@param numSegments? number @default: 0 (automatic)
function ImDrawList:AddCircleFilled(center, radius, col, numSegments) end

---@param center ImVec2
---@param radius number
---@param col ImU32
---@param numSegments number
---@param thickness? number @default: 1.0
function ImDrawList:AddNgon(center, radius, col, numSegments, thickness) end

---@param center ImVec2
---@param radius number
---@param col ImU32
---@param numSegments number
function ImDrawList:AddNgonFilled(center, radius, col, numSegments) end

---@param pos ImVec2
---@param col ImU32
---@param text string
function ImDrawList:AddText(pos, col, text) end

---@param font ImFont|nil
---@param fontSize number
---@param pos ImVec2
---@param col ImU32
---@param text string
function ImDrawList:AddText(font, fontSize, pos, col, text) end

---@param points ImVec2[]
---@param col ImU32
---@param flags ImDrawFlags
---@param thickness number
function ImDrawList:AddPolyline(points, col, flags, thickness) end

---@param points ImVec2[]
---@param col ImU32
function ImDrawList:AddConvexPolyFilled(points, col) end

---@param p1 ImVec2
---@param p2 ImVec2
---@param p3 ImVec2
---@param p4 ImVec2
---@param col ImU32
---@param thickness number
---@param numSegments? number
function ImDrawList:AddBezierCubic(p1, p2, p3, p4, col, thickness, numSegments) end

---@param p1 ImVec2
---@param p2 ImVec2
---@param p3 ImVec2
---@param col ImU32
---@param thickness number
---@param numSegments? number
function ImDrawList:AddBezierQuadratic(p1, p2, p3, col, thickness, numSegments) end


-- #### Image primitives
-- - Read FAQ to understand what ImTextureID is.
-- - "pMin" and "pMax" represent the upper-left and lower-right corners of the rectangle.
-- - "uvMin" and "uvMax" represent the normalized texture coordinates to use for those corners. Using (0,0)->(1,1) texture coordinates will generally display the entire texture.

---@param userTextureID ImTextureID
---@param pMin ImVec2
---@param pMax ImVec2
---@param uvMin? ImVec2  @min texture coordinate, default: (0, 0)
---@param uvMax? ImVec2  @max texture coordinate, default: (1, 1)
---@param col? ImU32  @color, default: White
function ImDrawList:AddImage(userTextureID, pMin, pMax, uvMin, uvMax, col) end

---@param userTextureID ImTextureID
---@param p1 ImVec2
---@param p2 ImVec2
---@param p3 ImVec2
---@param p4 ImVec2
---@param uv1? ImVec2  @texture coordinate 1, default: (0, 0)
---@param uv2? ImVec2  @texture coordinate 2, default: (1, 0)
---@param uv3? ImVec2  @texture coordinate 3, default: (1, 1)
---@param uv4? ImVec2  @texture coordinate 4, default: (0, 1)
---@param col? ImU32  @ color, default: white
function ImDrawList:AddImageQuad(userTextureID, p1, p2, p3, p4, uv1, uv2, uv3, uv4, col) end

---@param userTextureID ImTextureID
---@param pMin ImVec2
---@param pMax ImVec2
---@param uvMin ImVec2
---@param uvMax ImVec2
---@param col ImU32
---@param rounding number
---@param flags? ImDrawFlags  @default: None
function ImDrawList:AddImageRounded(userTextureID, pMin, pMax, uvMin, uvMax, col, rounding, flags) end


-- #### Paths
-- Stateful path API, add points then finish with PathFillConvex() or PathStroke()
-- - Filled shapes must always use clockwise winding order. The anti-aliasing fringe depends on it. Counter-clockwise shapes will have "inward" anti-aliasing.

function ImDrawList:PathClear() end

---@param pos ImVec2
function ImDrawList:PathLineTo(pos) end

---@param pos ImVec2
function ImDrawList:PathLineToMergeDuplicate(pos) end

---@param col ImU32
function ImDrawList:PathFillConvex(col) end

---@param col ImU32
---@param flags? ImDrawFlags
---@param thickness? number
function ImDrawList:PathStroke(col, flags, thickness) end

---@param center ImVec2
---@param radius number
---@param aMin number
---@param aMax number
---@param numSegments? number
function ImDrawList:PathArcTo(center, radius, aMin, aMax, numSegments) end

--- Use precomputed angles for a 12 steps circle
---@param center ImVec2
---@param radius number
---@param aMinOf12 number
---@param aMaxOf12 number
function ImDrawList:PathArcToFast(center, radius, aMinOf12, aMaxOf12) end

--- Cubic bezier (4 control points)
---@param p2 ImVec2
---@param p3 ImVec2
---@param p4 ImVec2
---@param thickness number
---@param numSegments? number
function ImDrawList:PathBezierCubicCurveTo(p2, p3, p4, thickness, numSegments) end

--- Quadratic bezier (3 control points)
---@param p2 ImVec2
---@param p3 ImVec2
---@param thickness number
---@param numSegments? number
function ImDrawList:PathBezierQuadraticCurveTo(p2, p3, thickness, numSegments) end

---@param rectMin ImVec2
---@param rectMax ImVec2
---@param rounding? number
---@param flags? ImDrawFlags
function ImDrawList:PathRect(rectMin, rectMax, rounding, flags) end


-- #### Advanced: Channels
-- - Use to split render into layers. By switching channels to can render out-of-order (e.g. submit FG primitives before BG primitives)
-- - Use to minimize draw calls (e.g. if going back-and-forth between multiple clipping rectangles, prefer to append into separate channels then merge at the end)
-- - This API shouldn't have been in ImDrawList in the first place!
--   Prefer using your own persistent instance of ImDrawListSplitter as you can stack them.
--   Using the ImDrawList::ChannelsXXXX you cannot stack a split over another.

---@param count number
function ImDrawList:ChannelsSplit(count) end

---@param n number
function ImDrawList:ChannelsSetCurrent(n) end

function ImDrawList:ChannelsMerge() end


-- #### Custom

---@param texture CTextureAnimation
---@param pos ImVec2
---@param size? ImVec2
function ImDrawList:AddTextureAnimation(texture, pos, size) end


--
-- ## Font API
--

-- ### ImFontConfig
-- ### ImFontGlyph
-- ### ImFontGlyphRangesBuilder
-- ### ImFontAtlasCustomRect
-- enum ImFontAtlasFlags_


-- ### ImFontAtlas

---@class ImFontAtlas
---@field public TexID ImTextureID
---@field public TexRef ImTextureRef
ImFontAtlas = {}


-- ### ImFont

---@class ImFont
ImFont = {}



---@class ImTextureRef
ImTextureRef = {}

---@return ImTextureID
function ImTextureRef.GetTexID() end

--
-- Viewports
--

---@class ImGuiViewport
---@field public ID number
---@field public Flags ImGuiViewportFlags
---@field public Pos ImVec2
---@field public Size ImVec2
---@field public WorkPos ImVec2
---@field public WorkSize ImVec2
---@field public DpiScale number
---@field public ParentViewportId number
ImGuiViewport = {}

---@return ImVec2
function ImGuiViewport:GetCenter() end

---@return ImVec2
function ImGuiViewport:GetWorkCenter() end

---@class ImGuiDragDropPayload
---@field public Data any DragDrop payload data. In lua can be one of: string, number, list of numbers. For non-lua types, use RawData and parse the bytes yourself.
---@field public DataType string The name of the DragDrop data type.
---@field public RawData string Raw string of bytes
