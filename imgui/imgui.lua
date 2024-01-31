---@meta ImGui

-- ## Macroquest ImGui Lua Bindings
---@class ImGui
---@field ConsoleFont ImFont
ImGui = {}

-- Represents a color
---@alias ImU32 number

-- Represents a texture
---@alias ImTextureID number

-- A unique ID used by widgets (typically the result of hashing a stack of string)
---@alias ImGuiID number

-- Flags: an ImGuiKey optionally OR-ed with one or more ImGuiMod.XXX values.
---@alias ImGuiKeyChord ImGuiKey|ImGuiMod

--
-- ### Main
--

---@return ImGuiIO
function ImGui.GetIO() end

---@return ImGuiStyle
function ImGui.GetStyle() end


--
-- ### Demo, Debug, Information
--

---@param show boolean
---@return boolean show
function ImGui.ShowDemoWindow(show) end
function ImGui.ShowDemoWindow() end

---@param show boolean
---@return boolean show
function ImGui.ShowMetricsWindow(show) end
function ImGui.ShowMetricsWindow() end

---@param show boolean
---@return boolean show
function ImGui.ShowDebugLogWindow(show) end
function ImGui.ShowDebugLogWindow() end

---@param show boolean
---@return boolean show
function ImGui.ShowIDStackToolWindow(show) end
function ImGui.ShowIDStackToolWindow() end

---@param show boolean
---@return boolean show
function ImGui.ShowAboutWindow(show) end
function ImGui.ShowAboutWindow() end

---@param style ImGuiStyle
function ImGui.ShowStyleEditor(style) end
function ImGui.ShowStyleEditor() end

---@param label string
---@return boolean
function ImGui.ShowStyleSelector(label) end

---@param label string
function ImGui.ShowFontSelector(label) end

function ImGui.ShowUserGuide() end

---@return string version
function ImGui.GetVersion() end


--
-- ### Styles
--

---@return ImGuiStyle
function ImGui.StyleColorsDark() end

---@return ImGuiStyle
function ImGui.StyleColorsLight() end

---@return ImGuiStyle
function ImGui.StyleColorsClassic() end


-- ## Windows
--
-- Push window to the stack and start appending to it.
-- - Passing `true` for `open` shows a window-closing widget in the upper-right corner of the window,
--   which clicking will set the boolean result `open` to false when clicked.
-- - You may append multiple times to the same window during the same frame by calling Begin()/End() pairs multiple times.
--   Some information such as `flags` or `open` will only be considered by the first call to Begin().
-- - Begin() returns boolean `draw` as false to indicate the window is collapsed or fully clipped, so you may
--   early out and omit submitting anything to the window.
-- - Always call a matching End() for each Begin() call, regardless of its return value!
-- - [Important: due to legacy reason, Begin/End and BeginChild/EndChild are inconsistent with all other functions
--    such as BeginMenu/EndMenu, BeginPopup/EndPopup, etc. where the EndXXX call should only be called if the corresponding
--    BeginXXX function returned true. Begin and BeginChild are the only odd ones out. Will be fixed in a future update.]
-- - Note that the bottom of window stack always contains a window called "Debug".
---@param name string
---@return boolean draw
function ImGui.Begin(name) end
---@param name string
---@param open boolean|nil
---@param flags? ImGuiWindowFlags
---@return boolean open, boolean draw
function ImGui.Begin(name, open, flags) end

-- Pop window from the stack.
function ImGui.End() end

--
-- ## ChildWindows
-- - Use child windows to begin into a self-contained independent scrolling/clipping regions within a host window. Child windows can embed their own child.
-- - Manual sizing (each axis can use a different setting e.g. ImVec2(0.0f, 400.0f)):
--    - == 0.0f: use remaining parent window size for this axis.
--    - \> 0.0f: use specified size for this axis.
--    - \< 0.0f: right/bottom-align to specified distance from available content boundaries.
-- - Specifying ImGuiChildFlags_AutoResizeX or ImGuiChildFlags_AutoResizeY makes the sizing automatic based on child contents.
--   Combining both ImGuiChildFlags_AutoResizeX _and_ ImGuiChildFlags_AutoResizeY defeats purpose of a scrolling region and is NOT recommended.
-- - BeginChild() returns false to indicate the window is collapsed or fully clipped, so you may early out and omit submitting
--   anything to the window. Always call a matching EndChild() for each BeginChild() call, regardless of its return value.
-- - [Important: due to legacy reason, Begin/End and BeginChild/EndChild are inconsistent with all other functions
--    such as BeginMenu/EndMenu, BeginPopup/EndPopup, etc. where the EndXXX call should only be called if the corresponding
--    BeginXXX function returned true. Begin and BeginChild are the only odd ones out. Will be fixed in a future update.]
-- - [Deprecation Note: The form taking a bool as a `border` parameter has been replaced with `childFlags`]
---@param strId string
---@param sizeX? number
---@param sizeY? number
---@param childFlags? ImGuiChildFlags
---@param flags? ImGuiWindowFlags
---@return boolean draw
function ImGui.BeginChild(strId, sizeX, sizeY, childFlags, flags) end
---@param strId string
---@param size ImVec2
---@param childFlags? ImGuiChildFlags
---@param flags? ImGuiWindowFlags
---@return boolean draw
function ImGui.BeginChild(strId, size, childFlags, flags) end

function ImGui.EndChild() end


--
-- ## Windows Utilities
-- - 'current window' = the window we are appending into while inside a Begin()/End() block. 'next window' = next window we will Begin() into.
--

---@return boolean
function ImGui.IsWindowAppearing() end

---@return boolean
function ImGui.IsWindowCollapsed() end

--- Is current window focused? or its root/child, depending on flags. see flags for options.
---@param flags? ImGuiFocusedFlags
---@return boolean
function ImGui.IsWindowFocused(flags) end

-- Is current window hovered and hoverable (e.g. not blocked by a popup/modal)? See ImGuiHoveredFlags_ for options.
---@param flags? ImGuiHoveredFlags
---@return boolean
function ImGui.IsWindowHovered(flags) end

-- Get draw list associated to the current window, to append your own drawing primitives
---@return ImDrawList
function ImGui.GetWindowDrawList() end

-- Get DPI scale currently associated to the current window's viewport.
---@return number
function ImGui.GetWindowDpiScale() end

-- Get current window position in screen space (note: it is unlikely you need to use this. Consider using current layout pos instead, GetCursorScreenPos())
---@return number posX, number posY
function ImGui.GetWindowPos() end

-- Get current window position in screen space (note: it is unlikely you need to use this. Consider using current layout pos instead, GetCursorScreenPos())
---@return ImVec2
function ImGui.GetWindowPosVec() end

-- Get current window size (note: it is unlikely you need to use this. Consider using GetCursorScreenPos() and e.g. GetContentRegionAvail() instead)
---@return number width, number height
function ImGui.GetWindowSize() end

-- Get current window size (note: it is unlikely you need to use this. Consider using GetCursorScreenPos() and e.g. GetContentRegionAvail() instead)
---@return ImVec2
function ImGui.GetWindowSizeVec() end

-- Get current window width (shortcut for GetWindowSize().x)
---@return number
function ImGui.GetWindowWidth() end

-- Get current window height (shortcut for GetWindowSize().y)
---@return number
function ImGui.GetWindowHeight() end

-- Get viewport currently associated to the current window.
---@return ImGuiViewport
function ImGui.GetWindowViewport() end


--
-- ## Window manipulation
-- - Prefer using SetNextXXX functions (before Begin) rather that SetXXX functions (after Begin).
--

-- Set next window position. call before Begin(). use pivot=(0.5f,0.5f) to center on given point, etc.
---@param pos ImVec2
---@param cond? ImGuiCond
---@param pivot? ImVec2
function ImGui.SetNextWindowPos(pos, cond, pivot) end
---@param posX number
---@param posY number
---@param cond? ImGuiCond
---@param pivotX? number
---@param pivotY? number
function ImGui.SetNextWindowPos(posX, posY, cond, pivotX, pivotY) end

-- Set next window size. set axis to 0.0f to force an auto-fit on this axis. call before Begin()
---@param size ImVec2
---@param cond? ImGuiCond
function ImGui.SetNextWindowSize(size, cond) end
---@param sizeX number
---@param sizeY number
---@param cond? ImGuiCond
function ImGui.SetNextWindowSize(sizeX, sizeY, cond) end

-- Set next window size limits. use 0.0f or FLT_MAX if you don't want limits.
-- Use -1 for both min and max of same axis to preserve current size (which itself is a constraint).
-- Use callback to apply non-trivial programmatic constraints. If using a callback, return the desired size.
---@param min ImVec2
---@param max ImVec2
---@param callback? fun(pos: ImVec2, currentSize: ImVec2, desiredSize: ImVec2): ImVec2
function ImGui.SetNextWindowSizeConstraints(min, max, callback) end
---@param minX number
---@param minY number
---@param maxX number
---@param maxY number
function ImGui.SetNextWindowSizeConstraints(minX, minY, maxX, maxY) end

-- Set next window content size (~ scrollable client area, which enforce the range of scrollbars).
-- Not including window decorations (title bar, menu bar, etc.) nor WindowPadding.
-- Set an axis to 0.0f to leave it automatic. call before Begin()
---@param size ImVec2
function ImGui.SetNextWindowContentSize(size) end
---@param sizeX number
---@param sizeY number
function ImGui.SetNextWindowContentSize(sizeX, sizeY) end

-- Set next window collapsed state. call before Begin()
---@param collapsed boolean
---@param cond? ImGuiCond
function ImGui.SetNextWindowCollapsed(collapsed, cond) end

-- set next window to be focused / top-most. call before Begin()
function ImGui.SetNextWindowFocus() end

-- Set next window scrolling value (use < 0.0f to not affect a given axis).
---@param scroll ImVec2
function ImGui.SetNextWindowScroll(scroll) end

-- Set next window background color alpha. helper to easily override the Alpha component
-- of ImGuiCol.WindowBg/ChildBg/PopupBg. you may also use ImGuiWindowFlags.NoBackground.
---@param alpha number
function ImGui.SetNextWindowBgAlpha(alpha) end

-- Set next window viewport
---@param viewportID number
function ImGui.SetNextWindowViewport(viewportID) end

-- Set window position (has two forms: with or without name)
-- - Version without `name`:
-- > (not recommended) set current window position - call within Begin()/End().
--   prefer using SetNextWindowPos(), as this may incur tearing and side-effects.
-- - Version with `name`:
-- > Set named window position
---@param name string
---@param pos ImVec2
---@param cond? ImGuiCond
function ImGui.SetWindowPos(name, pos, cond) end
---@param name string
---@param posX number
---@param posY number
---@param cond? ImGuiCond
function ImGui.SetWindowPos(name, posX, posY, cond) end
---@param pos ImVec2
---@param cond? ImGuiCond
function ImGui.SetWindowPos(pos, cond) end
---@param posX number
---@param posY number
---@param cond? ImGuiCond
function ImGui.SetWindowPos(posX, posY, cond) end

-- Set window size (has two forms: with or without name)
-- - Version without `name`:
-- > (not recommended) set current window size - call within Begin()/End().
--   set to ImVec2(0, 0) to force an auto-fit. prefer using SetNextWindowSize(),
--   as this may incur tearing and minor side-effects.
-- - Version with `name`:
-- > Sset named window size. set axis to 0.0f to force an auto-fit on this axis.
---@param name string
---@param size ImVec2
---@param cond? ImGuiCond
function ImGui.SetWindowSize(name, size, cond) end
---@param name string
---@param sizeX number
---@param sizeY number
---@param cond? ImGuiCond
function ImGui.SetWindowSize(name, sizeX, sizeY, cond) end
---@param size ImVec2
---@param cond? ImGuiCond
function ImGui.SetWindowSize(size, cond) end
---@param sizeX number
---@param sizeY number
---@param cond? ImGuiCond
function ImGui.SetWindowSize(sizeX, sizeY, cond) end

-- Set window collapsed state. (has two forms: with or without name)
-- - Version without `name`:
-- > (not recommended) set current window collapsed state. prefer using SetNextWindowCollapsed().
-- - Version with `name`:
-- > Set named window collapsed state.
---@param name string
---@param collapsed boolean
---@param cond? ImGuiCond
function ImGui.SetWindowCollapsed(name, collapsed, cond) end
---@param collapsed boolean
---@param cond? ImGuiCond
function ImGui.SetWindowCollapsed(collapsed, cond) end

-- Set window focused state. (has two forms: with or without name)
-- - Version without `name`:
-- > (not recommended) set current window to be focused / top-most. prefer using SetNextWindowFocus().
-- - Version with `name`:
-- > Set named window to be focused / top-most. use `nil` to remove focus.
---@param name? string
function ImGui.SetWindowFocus(name) end

-- [OBSOLETE] set font scale. Adjust IO.FontGlobalScale if you want to scale all windows.
-- This is an old API! For correct scaling, prefer to reload font + rebuild ImFontAtlas + call style.ScaleAllSizes().
---@param scale number
function ImGui.SetWindowFontScale(scale) end


--
-- ## Content region
-- - Retrieve available space from a given point. GetContentRegionAvail() is frequently useful.
-- - Those functions are bound to be redesigned (they are confusing, incomplete and the Min/Max return values
--   are in local window coordinates which increases confusion)
--

-- Returns the remaining content region. Same as GetContentRegionMax() - GetCursorPos()
---@return number x, number y
function ImGui.GetContentRegionAvail() end

-- Returns the remaining content region. Same as GetContentRegionMax() - GetCursorPos()
---@return ImVec2
function ImGui.GetContentRegionAvailVec() end

-- Current content boundaries (typically window boundaries including scrolling, or current column boundaries), in windows coordinates
---@return number x, number y
function ImGui.GetContentRegionMax() end

-- Current content boundaries (typically window boundaries including scrolling, or current column boundaries), in windows coordinates
---@return ImVec2
function ImGui.GetContentRegionMaxVec() end

-- Content boundaries min for the full window (roughly (0,0)-Scroll), in window coordinates
---@return number x, number y
function ImGui.GetWindowContentRegionMin() end
---@return ImVec2
function ImGui.GetWindowContentRegionMinVec() end

-- Content boundaries max for the full window (roughly (0,0)+Size-Scroll) where Size can be overridden with
-- SetNextWindowContentSize(), in window coordinates
---@return number x, number y
function ImGui.GetWindowContentRegionMax() end
---@return ImVec2
function ImGui.GetWindowContentRegionMaxVec() end

---@return number width
function ImGui.GetWindowContentRegionWidth() end


--
-- ## Windows Scrolling
-- - Any change of Scroll will be applied at the beginning of next frame in the first call to Begin().
-- - You may instead use SetNextWindowScroll() prior to calling Begin() to avoid this delay, as an alternative to using
--   SetScrollX()/SetScrollY().
--

---Set scrolling amount [0 .. GetScrollMaxX()]
---@return number x
function ImGui.GetScrollX() end

-- Get scrolling amount [0 .. GetScrollMaxY()]
---@return number y
function ImGui.GetScrollY() end

-- Set scrolling amount [0 .. GetScrollMaxX()]
---@param scrollX number
function ImGui.SetScrollX(scrollX) end

-- Set scrolling amount [0 .. GetScrollMaxY()]
---@param scrollY number
function ImGui.SetScrollY(scrollY) end

-- Get maximum scrolling amount ~~ ContentSize.x - WindowSize.x - DecorationsSize.x
---@return number x
function ImGui.GetScrollMaxX() end

-- -Get maximum scrolling amount ~~ ContentSize.y - WindowSize.y - DecorationsSize.y
---@return number y
function ImGui.GetScrollMaxY() end

-- Adjust scrolling amount to make current cursor position visible. center_x_ratio=0.0: left,
-- 0.5: center, 1.0: right. When using to make a "default/current item" visible, consider using
-- SetItemDefaultFocus() instead.
---@param scrollX? number
function ImGui.SetScrollHereX(scrollX) end

-- Adjust scrolling amount to make current cursor position visible. center_y_ratio=0.0: top,
-- 0.5: center, 1.0: bottom. When using to make a "default/current item" visible, consider using
-- SetItemDefaultFocus() instead.
---@param scrollY? number
function ImGui.SetScrollHereY(scrollY) end

-- Adjust scrolling amount to make given position visible. Generally GetCursorStartPos() + offset to compute a valid position.
---@param localX number
---@param centerXRatio? number
function ImGui.SetScrollFromPosX(localX, centerXRatio) end

-- Aadjust scrolling amount to make given position visible. Generally GetCursorStartPos() + offset to compute a valid position.
---@param localY number
---@param centerYRatio? number
function ImGui.SetScrollFromPosY(localY, centerYRatio) end


--
-- ## Parameters Stacks (Shared)
--

-- Push a font onto the font stack. use `nil` as a shortcut to push default font.
---@param font? ImFont
function ImGui.PushFont(font) end

-- Pop a font from the font stack.
function ImGui.PopFont() end

-- Modify a style color. Push a new value for the given style color index onto the stack
---@param idx ImGuiCol Style color index
---@param col ImU32 RGBA Color
function ImGui.PushStyleColor(idx, col) end
---@param idx ImGuiCol Style color index
---@param colR number Red
---@param colG number Green
---@param colB number Blue
---@param colA number Alpha
function ImGui.PushStyleColor(idx, colR, colG, colB, colA) end
---@param idx ImGuiCol Style color index
---@param col ImVec4 RGBA Color
function ImGui.PushStyleColor(idx, col) end

-- Pop one or more style color changes off of the stack
---@param count? number Default = 1
function ImGui.PopStyleColor(count) end

-- Modify a style float variable.
---@param idx ImGuiStyleVar
---@param value number
function ImGui.PushStyleVar(idx, value) end

-- Modify a style ImVec2 variable.
---@param idx ImGuiStyleVar
---@param value ImVec2
function ImGui.PushStyleVar(idx, value) end

-- Modify a style ImVec2 variable (as separate parameters).
---@param idx ImGuiStyleVar
---@param valueX number
---@param valueY number
function ImGui.PushStyleVar(idx, valueX, valueY) end

-- Pop one or more style variable changes off of the stack
---@param count? number Default = 1
function ImGui.PopStyleVar(count) end

-- Tab stop enable. Allow focusing using TAB/Shift-TAB, enabled by default but you can disable it for certain widgets
---@param tabStop boolean
function ImGui.PushTabStop(tabStop) end

function ImGui.PopTabStop() end

-- in 'repeat' mode, Button*() functions return repeated true in a typematic manner (using io.KeyRepeatDelay/io.KeyRepeatRate setting).
-- Note that you can call IsItemActive() after any Button() to tell if the button is held in the current frame.
---@param btnRepeat boolean
function ImGui.PushButtonRepeat(btnRepeat) end

function ImGui.PopButtonRepeat() end


--
-- ## Parameters stacks (current window)
--

-- push width of items for common large "item+label" widgets. >0.0f: width in pixels, <0.0f align xx pixels to
-- the right of window (so -FLT_MIN always align width to the right side).
---@param itemWidth number
function ImGui.PushItemWidth(itemWidth) end

function ImGui.PopItemWidth() end

-- set width of the _next_ common large "item+label" widget. >0.0f: width in pixels, <0.0f align xx pixels to the
-- right of window (so -FLT_MIN always align width to the right side)
---@param itemWidth number
function ImGui.SetNextItemWidth(itemWidth) end

-- width of item given pushed settings and current cursor position.
-- NOT necessarily the width of last item unlike most 'Item' functions.
---@return number
function ImGui.CalcItemWidth() end

-- push word-wrapping position for Text*() commands. < 0.0f: no wrapping; 0.0f: wrap to end of window (or column);
-- \> 0.0f: wrap at 'wrap_pos_x' position in window local space
---@param wrapLocalPosX? number Default = 0
function ImGui.PushTextWrapPos(wrapLocalPosX) end

function ImGui.PopTextWrapPos() end

---@param repeatButton boolean
function ImGui.PushButtonRepeat(repeatButton) end
function ImGui.PopButtonRepeat() end


--
-- ## Style read access
-- - Use the ShowStyleEditor() function to interactively see/edit the colors.
--

-- Get current font
---@return ImFont
function ImGui.GetFont() end

-- Get current font size (= height in pixels) of current font with current scale applied
---@return number
function ImGui.GetFontSize() end

---@param idx ImGuiCol
---@return ImVec4 color
function ImGui.GetStyleColor(idx) end

-- Get UV coordinate for a while pixel, useful to draw custom shapes via the ImDrawList API
---@return ImVec2
function ImGui.GetFontTexUvWhitePixel() end

-- retrieve given style color with style alpha applied and extra alpha multiplier,
-- packed as a 32-bit value suitable for ImDrawList
---@param idx ImGuiCol color value
---@param alphaMul number Alpha multiplier
---@return ImU32 col 
function ImGui.GetColorU32(idx, alphaMul) end

-- retrieve given color with style alpha applied, packed as a 32-bit value suitable for ImDrawList
--- @param r number Red (0-1)
--- @param g number Green (0-1)
--- @param b number Blue (0-1)
--- @param a number Alpha (0-1)
--- @return ImU32
function ImGui.GetColorU32(r, g, b, a) end

-- retrieve given color with style alpha applied, packed as a 32-bit value suitable for ImDrawList
--- @param col ImVec4
--- @return number col ImU32
function ImGui.GetColorU32(col) end

-- retrieve given color as individual component values from 0-1
---@param idx ImGuiCol
---@return number r, number g, number b, number a
function ImGui.GetStyleColor(idx) end

-- retrieve given color as ImVec4 (individual component values from 0-1)
---@param idx ImGuiCol
---@return ImVec4
function ImGui.GetStyleColorVec4(idx) end

-- Combine RGBA color components into a single number. Usable with any function taking ImU32 color values.
---@param r number The red component (0-255)
---@param g number The green component (0-255)
---@param b number The blue component (0-255)
---@param a? number The alpha component (0-255). Default=255
---@return number col The color encoded as ABGR
function IM_COL32(r, g, b, a) end


--
-- ## Layout cursor positioning
-- - By "cursor" we mean the current output position.
-- - The typical widget behavior is to output themselves at the current cursor position, then move the cursor one line down.
-- - You can call SameLine() between widgets to undo the last carriage return and output at the right of the preceding widget.
-- - Attention! We currently have inconsistencies between window-local and absolute positions we will aim to fix with future API:
--    - Absolute coordinate:        GetCursorScreenPos(), SetCursorScreenPos(), all ImDrawList:: functions. -> this is the preferred way forward.
--    - Window-local coordinates:   SameLine(), GetCursorPos(), SetCursorPos(), GetCursorStartPos(), GetContentRegionMax(), GetWindowContentRegion*(), PushTextWrapPos()
-- - GetCursorScreenPos() = GetCursorPos() + GetWindowPos(). GetWindowPos() is almost only ever useful to convert from window-local to absolute coordinates.
--

-- Get cursor position in absolute coordinates (prefer using this, also more useful to work with ImDrawList API).
---@return number x, number y
function ImGui.GetCursorScreenPos() end

-- Get cursor position in absolute coordinates (prefer using this, also more useful to work with ImDrawList API).
---@return ImVec2 pos
function ImGui.GetCursorScreenPosVec() end

-- Set cursor position in absolute coordinates
---@param pos ImVec2
function ImGui.SetCursorScreenPos(pos) end
---@param x number
---@param y number
function ImGui.SetCursorScreenPos(x, y) end

-- [window-local] Get cursor position in window coordinates (relative to window position)
---@return number x, number y
function ImGui.GetCursorPos() end

-- [window-local] Get cursor position in window coordinates (relative to window position)
---@return ImVec2 pos
function ImGui.GetCursorPosVec() end

-- [window-local] Get cursor position in window coordinates (relative to window position)
---@return number x
function ImGui.GetCursorPosX() end

-- [window-local] Get cursor position in window coordinates (relative to window position)
---@return number y
function ImGui.GetCursorPosY() end

-- [window-local] Set cursor position in window coordinates (relative to window position)
---@param pos ImVec2
function ImGui.SetCursorPos(pos) end
---@param x number
---@param y number
function ImGui.SetCursorPos(x, y) end

-- [window-local] Set cursor position in window coordinates (relative to window position)
---@param x number
function ImGui.SetCursorPosX(x) end

-- [window-local] Set cursor position in window coordinates (relative to window position)
---@param y number
function ImGui.SetCursorPosY(y) end

-- [window-local] Get initial cursor position, in window coordinates
---@return number x, number y
function ImGui.GetCursorStartPos() end

-- [window-local] Get initial cursor position, in window coordinates
---@return ImVec2 pos
function ImGui.GetCursorStartPosVec() end


--
-- ## Other layout functions
--

-- separator, generally horizontal. inside a menu bar or in horizontal layout mode, this becomes a vertical separator.
function ImGui.Separator() end

-- call between widgets or groups to layout them horizontally. X position given in window coordinates.
---@param offsetFromStartX? number Default = 0.0
---@param spacing? number Default = -1.0
function ImGui.SameLine(offsetFromStartX, spacing) end

-- undo a SameLine() or force a new line when in a horizontal-layout context.
function ImGui.NewLine() end

-- add vertical spacing.
function ImGui.Spacing() end

-- add a dummy item of given size. unlike InvisibleButton(), Dummy() won't take the mouse click or be navigable into.
---@param sizeX number
---@param sizeY number
function ImGui.Dummy(sizeX, sizeY) end
---@param size ImVec2
function ImGui.Dummy(size) end

-- move content position toward the right, by indentW, or style.IndentSpacing if indentW <= 0
---@param indentW? number Default = 0.0
function ImGui.Indent(indentW) end

-- move content position back to the left, by indentW, or style.IndentSpacing if indentW <= 0
---@param indentW? number Default = 0.0
function ImGui.Unindent(indentW) end

-- lock horizontal starting position
function ImGui.BeginGroup() end

-- unlock horizontal starting position + capture the whole group bounding box into one "item"
-- (so you can use IsItemHovered() or layout primitives such as SameLine() on whole group, etc.)
function ImGui.EndGroup() end

-- vertically align upcoming text baseline to FramePadding.y so that it will align properly to regularly
-- framed items (call if you have text on a line before a framed item)
function ImGui.AlignTextToFramePadding() end

-- Computed to be approximately equivalent to the FontSize
---@return number
function ImGui.GetTextLineHeight() end

-- Computed to be approximately equivalent to the FontSize + style.ItemSpacing.y (distance in pixels between 2 consecutive lines of text)
---@return number
function ImGui.GetTextLineHeightWithSpacing() end

-- Computed to be approximately equivalent to the FontSize + style.FramePadding.y * 2
---@return number
function ImGui.GetFrameHeight() end

-- Computed to be approximately equivalent to the FontSize + style.FramePadding.y * 2 + style.ItemSpacing.y
-- (distance in pixels between 2 consecutive lines of framed widgets)
---@return number
function ImGui.GetFrameHeightWithSpacing() end

--
-- ## ID stack/scopes
-- Read the FAQ (docs/FAQ.md or http://dearimgui.com/faq) for more details about how ID are handled in dear imgui.
-- - Those questions are answered and impacted by understanding of the ID stack system:
--   - "Q: Why is my widget not reacting when I click on it?"
--   - "Q: How can I have widgets with an empty label?"
--   - "Q: How can I have multiple widgets with the same label?"
-- - Short version: ID are hashes of the entire ID stack. If you are creating widgets in a loop you most likely
--   want to push a unique identifier (e.g. object pointer, loop index) to uniquely differentiate them.
-- - You can also use the "Label##foobar" syntax within widget label to distinguish them from each others.
-- - In this header file we use the "label"/"name" terminology to denote a string that will be displayed + used as an ID,
--   whereas "str_id" denote a string that is only used as an ID and not normally displayed.
--

-- push anything into the ID stack (will hash string/integer/object).
---@param id any
function ImGui.PushID(id) end

-- pop from the ID stack.
function ImGui.PopID() end

-- calculate unique ID (hash of whole ID stack + given parameter). e.g. if you want to query into ImGuiStorage yourself
---@param id any
---@return number
function ImGui.GetID(id) end


--
-- ## Widgets: Text
--

-- Draw raw text without formatting. Roughly equivalent to Text("%s", text)
---@param text string
function ImGui.TextUnformatted(text) end

-- Draw formatted text
---@param format string
---@vararg any
function ImGui.Text(format, ...) end
---@param text string
function ImGui.Text(text) end

-- Draw colored text. Shortcut for PushStyleColor(ImGuiCol_Text, col); Text(fmt, ...); PopStyleColor();
---@param r number
---@param g number
---@param b number
---@param a number
---@param text string
---@varargs any
function ImGui.TextColored(r, g, b, a, text, ...) end
---@param col ImVec4|ImU32
---@param text string
---@varargs any
function ImGui.TextColored(col, text, ...) end

-- Draw disabled text. Shortcut for PushStyleColor(ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]); Text(fmt, ...); PopStyleColor();
---@param text string
---@varargs any
function ImGui.TextDisabled(text, ...) end

-- Draw wrapped text. shortcut for PushTextWrapPos(0.0f); Text(fmt, ...); PopTextWrapPos();. Note that this won't work on an
-- auto-resizing window if there's no other widgets to extend the window width, yoy may need to set a size using SetNextWindowSize().
---@param text string
---@varargs any
function ImGui.TextWrapped(text, ...) end

-- Display text+label aligned the same way as value+label widgets
---@param label string
---@param text string
---@varargs any
function ImGui.LabelText(label, text, ...) end

-- Shortcut for Bullet()+Text()
---@param text string
---@varargs any
function ImGui.BulletText(text, ...) end

-- Formatted text with an horizontal line
---@param text string
---@varargs any
function ImGui.SeparatorText(text, ...) end


--
-- ## Widgets: Main
-- - Most widgets return true when the value has been changed or when pressed/selected
-- - You may also use one of the many IsItemXXX functions (e.g. IsItemActive, IsItemHovered, etc.) to query widget state.
--

-- Draw a button.
---@param label string
---@param size? ImVec2
---@return boolean pressed
function ImGui.Button(label, size) end
---@param label string
---@param sizeX number
---@param sizeY number
---@return boolean pressed
function ImGui.Button(label, sizeX, sizeY) end

-- Button with (FramePadding.y == 0) to easily embed within text
---@param label string
---@return boolean pressed
function ImGui.SmallButton(label) end

-- Flexible button behavior without the visuals, frequently useful to build custom behaviors using the public
-- api (along with IsItemActive, IsItemHovered, etc.)
---@param label string
---@param size ImVec2
---@param flags? ImGuiButtonFlags
---@return boolean pressed
function ImGui.InvisibleButton(label, size, flags) end
---@param label string
---@param sizeX number
---@param sizeY number
---@param flags? ImGuiButtonFlags
---@return boolean pressed
function ImGui.InvisibleButton(label, sizeX, sizeY, flags) end

-- Square button with an arrow shape
---@param strId string
---@param dir ImGuiDir
---@return boolean pressed
function ImGui.ArrowButton(strId, dir) end

-- Checkbox
---@param label string
---@param value boolean
---@return boolean value, boolean pressed
function ImGui.Checkbox(label, value) end

-- checkbox reading a specified flag `flagsValue` from a given set of flags
---@param label string
---@param flags number Flags value to check against
---@param flagsValue number Mask against flags that indicates checkbox is set.
---@return number flags, boolean pressed
function ImGui.CheckboxFlags(label, flags, flagsValue) end

-- use with e.g. `if RadioButton("one", my_value==1) then my_value = 1 end`
---@param label string
---@param active boolean
---@return boolean pressed
function ImGui.RadioButton(label, active) end

-- shortcut to handle the above pattern when value is an integer
---@param label string
---@param v number
---@param vButton number
---@return number v, boolean active
function ImGui.RadioButton(label, v, vButton) end

---@param fraction number
---@param size? ImVec2
---@param overlay? string
function ImGui.ProgressBar(fraction, size, overlay) end
---@param fraction number
---@param sizeX number
---@param sizeY number
---@param overlay? string
function ImGui.ProgressBar(fraction, sizeX, sizeY, overlay) end

-- draw a small circle + keep the cursor on the same line. advance cursor x position by GetTreeNodeToLabelSpacing(),
-- same distance that TreeNode() uses
function ImGui.Bullet() end


--
-- ## Widgets: Images
-- - Read about ImTextureID here: https://github.com/ocornut/imgui/wiki/Image-Loading-and-Displaying-Examples
-- - Note that ImageButton() adds style.FramePadding*2.0f to provided size. This is in order to facilitate fitting an image in a button.
--

---@param textureId ImTextureID
---@param size ImVec2
---@param uv0? ImVec2
---@param uv1? ImVec2
---@param tintCol? ImVec4
---@param borderCol? ImVec4
function ImGui.Image(textureId, size, uv0, uv1, tintCol, borderCol) end

---@param strId string
---@param textureId ImTextureID
---@param size ImVec2
---@param uv0? ImVec2
---@param uv1? ImVec2
---@param tintCol? ImVec4
---@param borderCol? ImVec4
function ImGui.ImageButton(strId, textureId, size, uv0, uv1, tintCol, borderCol) end


--
-- ## Widgets: Combo Box (Dropdown)
-- - The BeginCombo()/EndCombo() api allows you to manage your contents and selection state however you want it, by creating e.g. Selectable() items.
-- - The old Combo() api are helpers over BeginCombo()/EndCombo() which are kept available for convenience purpose. This is analogous to how ListBox are created.
--

---@param label string
---@param previewValue string
---@param flags? ImGuiComboFlags
function ImGui.BeginCombo(label, previewValue, flags) end

-- Finish a combo started with BeginCombo. Only call EndCombo() if BeginCombo() returns true!
function ImGui.EndCombo() end

---@param label string
---@param currentItem number
---@param items string[]
---@param itemsCount? number
---@param popupMaxHeightInItems? number
---@return number currentItem, boolean clicked
function ImGui.Combo(label, currentItem, items, itemsCount, popupMaxHeightInItems) end

---@param label string
---@param currentItem number
---@param itemsSeparatedByZeros string
---@param popupMaxHeightInItems? number
---@return number
function ImGui.Combo(label, currentItem, itemsSeparatedByZeros, popupMaxHeightInItems) end

---@param label string
---@param currentItem number
---@param getter fun(idx: number): string
---@param itemsCount number
---@param popupMaxHeightInItems? number
---@return number currentItem, boolean clicked
function ImGui.Combo(label, currentItem, getter, itemsCount, popupMaxHeightInItems) end


--
-- ## Widgets: Drag Sliders
-- - CTRL+Click on any drag box to turn them into an input box. Manually input values aren't clamped by default and can go off-bounds. Use ImGuiSliderFlags_AlwaysClamp to always clamp.
-- - For all the Float2/Float3/Float4/Int2/Int3/Int4 versions of every function, note that a 'float v[X]' function argument is the same as 'float* v',
--   the array syntax is just a way to document the number of elements that are expected to be accessible. You can pass address of your first element out of a contiguous set, e.g. &myvector.x
-- - Adjust format string to decorate the value with a prefix, a suffix, or adapt the editing and display precision e.g. "%.3f" -> 1.234; "%5.2f secs" -> 01.23 secs; "Biscuit: %.0f" -> Biscuit: 1; etc.
-- - Format string may also be set to NULL or use the default format ("%f" or "%d").
-- - Speed are per-pixel of mouse movement (v_speed=0.2f: mouse needs to move by 5 pixels to increase value by 1). For gamepad/keyboard navigation, minimum speed is Max(v_speed, minimum_step_at_given_precision).
-- - Use v_min < v_max to clamp edits to given limits. Note that CTRL+Click manual input can override those limits if ImGuiSliderFlags_AlwaysClamp is not used.
-- - Use v_max = FLT_MAX / INT_MAX etc to avoid clamping to a maximum, same with v_min = -FLT_MAX / INT_MIN to avoid clamping to a minimum.
-- - We use the same sets of flags for DragXXX() and SliderXXX() functions as the features are the same and it makes it easier to swap them.
-- - Legacy: Pre-1.78 there are DragXXX() function signatures that take a final `float power=1.0f' argument instead of the `ImGuiSliderFlags flags=0' argument.
--   If you get a warning converting a float to ImGuiSliderFlags, read https://github.com/ocornut/imgui/issues/3361
--

---@param label string
---@param value number
---@param valueSpeed? number
---@param valueMin? number
---@param valueMax? number
---@param format? string e.g. "%.3f"
---@param flags? ImGuiSliderFlags
---@return number value, boolean changed
function ImGui.DragFloat(label, value, valueSpeed, valueMin, valueMax, format, flags) end

---@param label string
---@param value number[]  List of 2 values
---@param valueSpeed? number
---@param valueMin? number
---@param valueMax? number
---@param format? string
---@param flags? ImGuiSliderFlags
---@return number[] value, boolean changed
function ImGui.DragFloat2(label, value, valueSpeed, valueMin, valueMax, format, flags) end

---@param label string
---@param value number[]  List of 3 values
---@param valueSpeed? number
---@param valueMin? number
---@param valueMax? number
---@param format? string
---@param flags? ImGuiSliderFlags
---@return number[] value, boolean changed
function ImGui.DragFloat3(label, value, valueSpeed, valueMin, valueMax, format, flags) end

---@param label string
---@param value number[]  List of 4 values
---@param valueSpeed? number
---@param valueMin? number
---@param valueMax? number
---@param format? string
---@param flags? ImGuiSliderFlags
---@return number[] value, boolean changed
function ImGui.DragFloat4(label, value, valueSpeed, valueMin, valueMax, format, flags) end

---@param label string
---@param valueCurrentMin number
---@param valueCurrentMax number
---@param valueSpeed? number
---@param valueMin? number
---@param valueMax? number
---@param format? string
---@param formatMax? string
---@param flags? ImGuiSliderFlags
---@return number valueCurrentMin, number valueCurrentMax, boolean changed
function ImGui.DragFloatRange2(label, valueCurrentMin, valueCurrentMax, valueSpeed, valueMin, valueMax, format, formatMax, flags) end

---@param label string
---@param value integer
---@param valueSpeed? number
---@param valueMin? integer
---@param valueMax? integer
---@param format? string
---@param flags? ImGuiSliderFlags
---@return integer value, boolean changed
function ImGui.DragInt(label, value, valueSpeed, valueMin, valueMax, format, flags) end

---@param label string
---@param values integer[] List of 2 values
---@param valueSpeed? number
---@param valueMin? integer
---@param valueMax? integer
---@param format? string
---@param flags? ImGuiSliderFlags
---@return integer[] values, boolean changed
function ImGui.DragInt2(label, values, valueSpeed, valueMin, valueMax, format, flags) end

---@param label string
---@param values integer[] List of 3 values
---@param valueSpeed? number
---@param valueMin? integer
---@param valueMax? integer
---@param format? string
---@param flags? ImGuiSliderFlags
---@return integer[] values, boolean changed
function ImGui.DragInt3(label, values, valueSpeed, valueMin, valueMax, format, flags) end

---@param label string
---@param values integer[] List of 4 values
---@param valueSpeed? number
---@param valueMin? integer
---@param valueMax? integer
---@param format? string
---@param flags? ImGuiSliderFlags
---@return integer[] values, boolean changed
function ImGui.DragInt4(label, values, valueSpeed, valueMin, valueMax, format, flags) end

---@param label string
---@param valueCurrentMin integer
---@param valueCurrentMax integer
---@param valueSpeed? number
---@param valueMin? integer
---@param valueMax? integer
---@param format? string
---@param formatMax? string
---@param flags? ImGuiSliderFlags
---@return integer valueCurrentMin, integer valueCurrentMax, boolean changed
function ImGui.DragIntRange2(label, valueCurrentMin, valueCurrentMax, valueSpeed, valueMin, valueMax, format, formatMax, flags) end

---@generic T: number|integer
---@param label string
---@param dataType ImGuiDataType
---@param values T[]
---@param components integer
---@param valueSpeed number
---@param valueMin? T
---@param valueMax? T
---@param format? string
---@param flag? ImGuiSliderFlags
---@return T[] values, bool changed
function ImGui.DragScalarN(label, dataType, values, components, valueSpeed, valueMin, valueMax, format, flag) end


--
-- ## Widgets: Regular Sliders
-- - CTRL+Click on any slider to turn them into an input box. Manually input values aren't clamped by default and can go off-bounds. Use ImGuiSliderFlags_AlwaysClamp to always clamp.
-- - Adjust format string to decorate the value with a prefix, a suffix, or adapt the editing and display precision e.g. "%.3f" -> 1.234; "%5.2f secs" -> 01.23 secs; "Biscuit: %.0f" -> Biscuit: 1; etc.
-- - Format string may also be set to NULL or use the default format ("%f" or "%d").
-- - Legacy: Pre-1.78 there are SliderXXX() function signatures that take a final `float power=1.0f' argument instead of the `ImGuiSliderFlags flags=0' argument.
--   If you get a warning converting a float to ImGuiSliderFlags, read https://github.com/ocornut/imgui/issues/3361
--

---@param label string
---@param value number
---@param valueMin number
---@param valueMax number
---@param format? string
---@param flags? ImGuiSliderFlags
---@return number value, boolean changed
function ImGui.SliderFloat(label, value, valueMin, valueMax, format, flags) end

---@param label string
---@param values number[] List of 2 values
---@param valueMin number
---@param valueMax number
---@param format? string
---@param flags? ImGuiSliderFlags
---@return number[] values, boolean changed
function ImGui.SliderFloat2(label, values, valueMin, valueMax, format, flags) end

---@param label string
---@param value ImVec2
---@param valueMin number
---@param valueMax number
---@param format? string
---@param flags? ImGuiSliderFlags
---@return ImVec2 value, boolean changed
function ImGui.SliderFloatVec2(label, value, valueMin, valueMax, format, flags) end

---@param label string
---@param values number[] List of 3 values
---@param valueMin number
---@param valueMax number
---@param format? string
---@param flags? ImGuiSliderFlags
---@return number[] values, boolean changed
function ImGui.SliderFloat3(label, values, valueMin, valueMax, format, flags) end

---@param label string
---@param values number[] List of 4 values
---@param valueMin number
---@param valueMax number
---@param format? string
---@param flags? ImGuiSliderFlags
---@return number[] values, boolean changed
function ImGui.SliderFloat4(label, values, valueMin, valueMax, format, flags) end

---@param label string
---@param value ImVec4
---@param valueMin number
---@param valueMax number
---@param format? string
---@param flags? ImGuiSliderFlags
---@return ImVec4 value, boolean changed
function ImGui.SliderFloatVec4(label, value, valueMin, valueMax, format, flags) end

---@param label string
---@param v_rad number
---@param valueDegreesMin? number
---@param valueDegreesMax? number
---@param format? string
---@param flags? ImGuiSliderFlags
---@return number v_rad, boolean changed
function ImGui.SliderAngle(label, v_rad, valueDegreesMin, valueDegreesMax, format, flags) end

---@param label string
---@param value integer
---@param valueMin integer
---@param valueMax integer
---@param format? string
---@param flags? ImGuiSliderFlags
---@return integer value, boolean changed
function ImGui.SliderInt(label, value, valueMin, valueMax, format, flags) end


---@param label string
---@param values integer[] List of 2 values
---@param valueMin integer
---@param valueMax integer
---@param format? string
---@param flags? ImGuiSliderFlags
---@return integer[] values, boolean changed
function ImGui.SliderInt2(label, values, valueMin, valueMax, format, flags) end

---@param label string
---@param values integer[] List of 3 values
---@param valueMin integer
---@param valueMax integer
---@param format? string
---@param flags? ImGuiSliderFlags
---@return integer[] values, boolean changed
function ImGui.SliderInt3(label, values, valueMin, valueMax, format, flags) end

---@param label string
---@param values integer[] List of 2 values
---@param valueMin integer
---@param valueMax integer
---@param format? string
---@param flags? ImGuiSliderFlags
---@return integer[] values, boolean changed
function ImGui.SliderInt4(label, values, valueMin, valueMax, format, flags) end

---@param label string
---@param sizeX number
---@param sizeY number
---@param value number
---@param valueMin number
---@param valueMax number
---@param format? string
---@param flags? ImGuiSliderFlags
---@return number value, boolean changed
function ImGui.VSliderFloat(label, sizeX, sizeY, value, valueMin, valueMax, format, flags) end

---@param label string
---@param size ImVec2
---@param value number
---@param valueMin number
---@param valueMax number
---@param format? string
---@param flags? ImGuiSliderFlags
---@return ImVec2 value, boolean changed
function ImGui.VSliderFloat(label, size, value, valueMin, valueMax, format, flags) end

---@param label string
---@param sizeX number
---@param sizeY number
---@param value integer
---@param valueMin integer
---@param valueMax integer
---@param format? string
---@param flags? ImGuiSliderFlags
---@return integer value, boolean changed
function ImGui.VSliderInt(label, sizeX, sizeY, value, valueMin, valueMax, format, flags) end


--
-- ## Widgets: Input with Keyboard
-- - Most of the ImGuiInputTextFlags flags are only useful for InputText() and not for InputFloatX, InputIntX, InputDouble etc.
--

-- Shared state of InputText(), passed as an argument to your callback when a ImGuiInputTextFlags.Callback* flag is used.
-- The callback function should return 0 by default.
-- Callbacks (follow a flag name and see comments in ImGuiInputTextFlags_ declarations for more details)
-- - ImGuiInputTextFlags.CallbackEdit:        Callback on buffer edit (note that InputText() already returns true on edit, the callback is useful mainly to manipulate the underlying buffer while focus is active)
-- - ImGuiInputTextFlags.CallbackAlways:      Callback on each iteration
-- - ImGuiInputTextFlags.CallbackCompletion:  Callback on pressing TAB
-- - ImGuiInputTextFlags.CallbackHistory:     Callback on pressing Up/Down arrows
-- - ImGuiInputTextFlags.CallbackCharFilter:  Callback on character inputs to replace or discard them. Modify 'EventChar' to replace or discard, or return 1 in callback to discard.
-- - ImGuiInputTextFlags.CallbackResize:      Callback on buffer capacity changes request (beyond 'buf_size' parameter value), allowing the string to grow.
--
-- Arguments for the different callback events
-- - To modify the text buffer in a callback, prefer using the InsertChars() / DeleteChars() function. InsertChars() will take care of calling the resize callback if necessary.
-- - If you know your edits are not going to resize the underlying buffer allocation, you may modify the contents of 'Buf[]' directly. You need to update 'BufTextLen' accordingly (0 <= BufTextLen < BufSize) and set 'BufDirty'' to true so InputText can update its internal state.
---@class ImGuiInputTextCallbackData
---@field EventFlag ImGuiInputTextFlags [read-only] One ImGuiInputTextFlags.Callback*
---@field Flags ImGuiInputTextFlags [read-only] What the user passed into InputText
---@field EventChar string [read-write] Character input. Replace character with another one, or set to zero to drop. return 1 is equivalent to setting EventChar=0;
---@field EventKey ImGuiKey [read-only] Key pressed (Up/Down/TAB)
---@field Buffer string [read-only] Text buffer. Modify using DeleteChars/InsertChars
---@field CursorPos number [read-write]
---@field SelectionStart number [read-write]
---@field SelectionEnd number [read-write]
ImGuiInputTextCallbackData = {}

---Callback function for an InputText. Should return 0 by default.
---@alias ImGuiInputTextCallback fun(data: ImGuiInputTextCallbackData): number

---@param pos number
---@param bytesCount number
function ImGuiInputTextCallbackData:DeleteChars(pos, bytesCount) end

---@param pos number
---@param text string
function ImGuiInputTextCallbackData:InsertChars(pos, text) end

function ImGuiInputTextCallbackData:SelectAll() end
function ImGuiInputTextCallbackData:ClearSelection() end

---@return boolean
function ImGuiInputTextCallbackData:HasSelection() end

---@param label string
---@param text string
---@param flags? ImGuiInputTextFlags
---@param callback? ImGuiInputTextCallback
---@return string text, boolean changed
function ImGui.InputText(label, text, flags, callback) end

---@param label string
---@param text string
---@param size? ImVec2
---@param flags? ImGuiInputTextFlags
---@param callback? ImGuiInputTextCallback
---@return string text, boolean changed
function ImGui.InputTextMultiline(label, text, size, flags, callback) end
---@param label string
---@param text string
---@param sizeX? number
---@param sizeY? number
---@param flags? ImGuiInputTextFlags
---@param callback? ImGuiInputTextCallback
---@return string text, boolean changed
function ImGui.InputTextMultiline(label, text, sizeX, sizeY, flags, callback) end

---@param label string
---@param hint string
---@param text string
---@param flags? ImGuiInputTextFlags
---@param callback? ImGuiInputTextCallback
---@return string text, boolean changed
function ImGui.InputTextWithHint(label, hint, text, flags, callback) end

---@param label string
---@param value number
---@param step? number
---@param stepFast? number
---@param format? string
---@param flags? ImGuiInputTextFlags
---@return number value, boolean changed
function ImGui.InputFloat(label, value, step, stepFast, format, flags) end

---@param label string
---@param values number[] List of 2 values
---@param step? number
---@param stepFast? number
---@param format? string
---@param flags? ImGuiInputTextFlags
---@return number[] values, boolean changed
function ImGui.InputFloat2(label, values, step, stepFast, format, flags) end

---@param label string
---@param values number[] List of 3 values
---@param step? number
---@param stepFast? number
---@param format? string
---@param flags? ImGuiInputTextFlags
---@return number[] values, boolean changed
function ImGui.InputFloat3(label, values, step, stepFast, format, flags) end

---@param label string
---@param values number[] List of 4 values
---@param step? number
---@param stepFast? number
---@param format? string
---@param flags? ImGuiInputTextFlags
---@return number[] values, boolean changed
function ImGui.InputFloat4(label, values, step, stepFast, format, flags) end

---@param label string
---@param value integer
---@param step? number
---@param stepFast? number,
---@param flags? ImGuiInputTextFlags
---@return number value, boolean changed
function ImGui.InputInt(label, value, step, stepFast, flags) end

---@param label string
---@param value integer[] List of 2 values
---@param flags? ImGuiInputTextFlags
---@return integer[] values, boolean changed
function ImGui.InputInt2(label, value, flags) end

---@param label string
---@param value integer[] List of 3 values
---@param flags? ImGuiInputTextFlags
---@return integer[] values, boolean changed
function ImGui.InputInt3(label, value, flags) end

---@param label string
---@param value integer[] List of 4 values
---@param flags? ImGuiInputTextFlags
---@return integer[] values, boolean changed
function ImGui.InputInt4(label, value, flags) end

---@param label string
---@param value number
---@param step? number
---@param stepFast? number
---@param format? string
---@param flags? ImGuiInputTextFlags
---@return number values, boolean changed
function ImGui.InputDouble(label, value, step, stepFast, format, flags) end


--
-- ## Widgets: Color Editor/Picker (tip: the ColorEdit* functions have a little color square that can be left-clicked
-- to open a picker, and right-clicked to open an option menu.)
--

---Color pickers can take either a list (table) of 3/4 numbers from 0 to 1, an ImVec4 (with values from 0 to 1),
---or an ImU32, which is an ABGR packed 32bit integer.
---@alias ColorPickerColor number[]|ImVec4|ImU32

---@generic Color : ColorPickerColor
---@param label string
---@param col Color Color as list of 3 numbers 0.0 to 1.0, an ImVec4, or ImU32
---@param flags? ImGuiColorEditFlags
---@return Color col, boolean changed
function ImGui.ColorEdit3(label, col, flags) end

---@generic Color : ColorPickerColor
---@param label string
---@param col Color Color as list of 4 numbers 0.0 to 1.0, an ImVec4, or ImU32
---@param flags? ImGuiColorEditFlags
---@return Color col, boolean changed
function ImGui.ColorEdit4(label, col, flags) end


---@generic Color : ColorPickerColor
---@param label string
---@param col Color Color as list of 3 numbers 0.0 to 1.0, an ImVec4, or ImU32
---@param flags? ImGuiColorEditFlags
---@return Color col, boolean changed
function ImGui.ColorPicker3(label, col, flags) end

---@generic Color : ColorPickerColor
---@param label string
---@param col Color Color as list of 4 numbers 0.0 to 1.0, an ImVec4, or ImU32
---@param flags? ImGuiColorEditFlags
---@return Color col, boolean changed
function ImGui.ColorPicker4(label, col, flags) end

-- display a color square/button, hover for details, return true when pressed.
---@param descId string
---@param col ColorPickerColor
---@param flags? ImGuiColorEditFlags
---@param size? ImVec2
---@return boolean pressed
function ImGui.ColorButton(descId, col, flags, size) end

-- initialize current options (generally on application startup) if you want to select a default format, picker type, etc.
-- User will be able to change many settings, unless you pass the _NoOptions flag to your calls.
---@param flags ImGuiColorEditFlags
function ImGui.SetColorEditOptions(flags) end


--
-- ## Widgets: Trees
-- - TreeNode functions return true when the node is open, in which case you need to also call TreePop() when you are
--   finished displaying the tree node contents.
--

---@param label string
---@return boolean open
function ImGui.TreeNode(label) end

---@param strId string Specify id by string value
---@param fmt string
---@vararg any
---@return boolean open
function ImGui.TreeNode(strId, fmt, ...) end
---@param objId any Create id from any object
---@param fmt string
---@vararg any
---@return boolean open
function ImGui.TreeNode(objId, fmt, ...) end

---@param label string
---@param flags? ImGuiTreeNodeFlags
---@return boolean open
function ImGui.TreeNodeEx(label, flags) end
---@param strId string Specify id by string value
---@param flags ImGuiTreeNodeFlags
---@param fmt string
---@vararg any
---@return boolean open
function ImGui.TreeNodeEx(strId, flags, fmt, ...) end
---@param objId any Create id from any object
---@param flags ImGuiTreeNodeFlags
---@param fmt string
---@vararg any
---@return boolean open
function ImGui.TreeNodeEx(objId, flags, fmt, ...) end

-- ~ Indent()+PushId(). Already called by TreeNode() when returning true, but you can call TreePush/TreePop yourself if desired.
---@param strId string Id string, or nil
function ImGui.TreePush(strId) end
---@param objId? any Create id from any object
function ImGui.TreePush(objId) end

-- ~ Unindent()+PopId()
function ImGui.TreePop() end

-- horizontal distance preceding label when using TreeNode*() or `Bullet() == (g.FontSize + style.FramePadding.x*2)` for a regular unframed TreeNode
---@return number
function ImGui.GetTreeNodeToLabelSpacing() end

-- if returning 'true' the header is open. doesn't indent nor push on ID stack. user doesn't have to call TreePop().
---@param label string
---@param flags? ImGuiTreeNodeFlags
function ImGui.CollapsingHeader(label, flags) end

-- when `visible != nil`: if `visible==true` display an additional small close button on upper right of the header which will
-- set the bool to false when clicked, if `visible==false` don't display the header.
---@param label string
---@param visible? boolean
---@param flags? ImGuiTreeNodeFlags
---@return boolean visible, boolean show
function ImGui.CollapsingHeader(label, visible, flags) end

---@param open boolean
---@param cond? ImGuiCond
function ImGui.SetNextItemOpen(open, cond) end

-- Advance cursor to position where label would appear in a tree node.
function ImGui.TreeAdvanceToLabelPos() end

--
-- ## Widgets: Selectables
-- - A selectable highlights when hovered, and can display another color when selected.
-- - Neighbors selectable extend their highlight bounds in order to leave no gap between them. This is so a series of selected Selectable appear contiguous.
--

-- Selectable() is clicked is returns true so you can modify your selection state.
-- size.x==0.0: use remaining width, size.x>0.0: specify width. size.y==0.0: use label height, size.y>0.0: specify height
---@param label string
---@param selected? boolean
---@param flags? ImGuiSelectableFlags
---@param size? ImVec2
---@return boolean selected, boolean pressed
function ImGui.Selectable(label, selected, flags, size) end
---@param label string
---@param selected boolean
---@param flags ImGuiSelectableFlags
---@param sizeX number
---@param sizeY number
---@return boolean selected, boolean pressed
function ImGui.Selectable(label, selected, flags, sizeX, sizeY) end

--
-- ## Widgets: List Boxes
-- - This is essentially a thin wrapper to using BeginChild/EndChild with the ImGuiChildFlags_FrameStyle flag for stylistic changes + displaying a label.
-- - You can submit contents and manage your selection state however you want it, by creating e.g. Selectable() or any other items.
-- - The simplified/old ListBox() api are helpers over BeginListBox()/EndListBox() which are kept available for convenience purpose. This is analoguous to how Combos are created.
-- - Choose frame width:   size.x > 0.0f: custom  /  size.x < 0.0f or -FLT_MIN: right-align   /  size.x = 0.0f (default): use current ItemWidth
-- - Choose frame height:  size.y > 0.0f: custom  /  size.y < 0.0f or -FLT_MIN: bottom-align  /  size.y = 0.0f (default): arbitrary default height which can fit ~7 items
--

-- open a framed scrolling region
--
-- This is essentially a thin wrapper to using BeginChild/EndChild with the ImGuiChildFlags_FrameStyle flag for stylistic changes + displaying a label.
-- - Tip: To have a list filling the entire window width, use size.x = -FLT_MIN and pass an non-visible label e.g. "##empty"
-- - Tip: If your vertical size is calculated from an item count (e.g. 10 * item_height) consider adding a fractional part to facilitate seeing scrolling boundaries (e.g. 10.25 * item_height).
---@param label string
---@param size? ImVec2
---@return boolean changed
function ImGui.BeginListBox(label, size) end

-- only call EndListBox() if BeginListBox() returned true!
function ImGui.EndListBox() end

---@param label string
---@param currentItem integer
---@param items string[]
---@param itemsCount? integer
---@param heightInItems? integer
---@return integer currentItem, boolean changed
function ImGui.ListBox(label, currentItem, items, itemsCount, heightInItems) end

---@param label string
---@param currentItem number
---@param getter fun(idx: number): string
---@param itemsCount number
---@param popupMaxHeightInItems? number
---@return number currentItem, boolean changed
function ImGui.ListBox(label, currentItem, getter, itemsCount, popupMaxHeightInItems) end


-- ## Widgets: Value() Helpers.
-- - Those are merely shortcut to calling Text() with a format string. Output single value in "name: value" format
---@param prefix string
---@param value boolean|integer
function ImGui.Value(prefix, value) end
---@param text string
---@param value number
---@param floatFormat? string
function ImGui.Value(text, value, floatFormat) end


-- ## Widgets: Data Plotting
-- - Consider using ImPlot (https://github.com/epezent/implot) which is much better!

---@param label string
---@param values number[]
---@param valuesCount? number
---@param valuesOffset? number
---@param overlayText? string
---@param scaleMin? number
---@param scaleMax? number
---@param graphSize? ImVec2
function ImGui.PlotLines(label, values, valuesCount, valuesOffset, overlayText, scaleMin, scaleMax, graphSize) end
---@param label string
---@param getter fun(idx: number): number
---@param valuesCount number
---@param valuesOffset? number
---@param overlayText? string
---@param scaleMin? number
---@param scaleMax? number
---@param graphSize? ImVec2
function ImGui.PlotLines(label, getter, valuesCount, valuesOffset, overlayText, scaleMin, scaleMax, graphSize) end

---@param label string
---@param values number[]
---@param valuesCount? number
---@param valuesOffset? number
---@param overlayText? string
---@param scaleMin? number
---@param scaleMax? number
---@param graphSize? ImVec2
function ImGui.PlotHistogram(label, values, valuesCount, valuesOffset, overlayText, scaleMin, scaleMax, graphSize) end
---@param label string
---@param getter fun(idx: number): number
---@param valuesCount number
---@param valuesOffset? number
---@param overlayText? string
---@param scaleMin? number
---@param scaleMax? number
---@param graphSize? ImVec2
function ImGui.PlotHistogram(label, getter, valuesCount, valuesOffset, overlayText, scaleMin, scaleMax, graphSize) end



--
-- ## Widgets: Menus
-- - Use BeginMenuBar() on a window ImGuiWindowFlags_MenuBar to append to its menu bar.
-- - Use BeginMainMenuBar() to create a menu bar at the top of the screen and append to it.
-- - Use BeginMenu() to create a menu. You can call BeginMenu() multiple time with the same identifier to append more items to it.
-- - Not that MenuItem() keyboardshortcuts are displayed as a convenience but _not processed_ by Dear ImGui at the moment.
--

-- Append to menu-bar of current window (requires ImGuiWindowFlags.MenuBar flag set on parent window).
---@return boolean
function ImGui.BeginMenuBar() end

-- only call EndMenuBar() if BeginMenuBar() returns true!
function ImGui.EndMenuBar() end

-- create and append to a full screen menu-bar.
---@return boolean
function ImGui.BeginMainMenuBar() end

-- only call EndMainMenuBar() if BeginMainMenuBar() returns true!
function ImGui.EndMainMenuBar() end

-- create a sub-menu entry. only call EndMenu() if this returns true!
---@param label string
---@param enabled? boolean
---@return boolean
function ImGui.BeginMenu(label, enabled) end

-- only call EndMenu() if BeginMenu() returns true!
function ImGui.EndMenu() end

---@param label string
---@param shortcut? string|nil
---@param selected? boolean|nil @if the menu item is activated, this value will be toggled and returned back as 2nd param
---@param enabled? boolean
---@return boolean activated, boolean selected
function ImGui.MenuItem(label, shortcut, selected, enabled) end


--
-- ## Tooltips
-- - Tooltips are windows following the mouse. They do not take focus away.
-- - A tooltip window can contain items of any types. SetTooltip() is a shortcut for the 'if (BeginTooltip()) { Text(...); EndTooltip(); }' idiom.
--

-- begin/append a tooltip window.
---@return boolean open
function ImGui.BeginTooltip() end

-- only call EndTooltip() if BeginTooltip()/BeginItemTooltip() returns true!
function ImGui.EndTooltip() end

-- set a text-only tooltip. Often used after a ImGui::IsItemHovered() check. Override any previous call to SetTooltip().
---@param fmt string
---@vararg any
function ImGui.SetTooltip(fmt, ...) end


--
-- ### Tooltips: helpers for showing a tooltip when hovering an item
-- - `BeginItemTooltip()` is a shortcut for the `if (IsItemHovered(ImGuiHoveredFlags.ForTooltip) && BeginTooltip())` idiom.
-- - `SetItemTooltip()` is a shortcut for the `if (IsItemHovered(ImGuiHoveredFlags.ForTooltip)) { SetTooltip(...); }` idiom.
-- - Where `ImGuiHoveredFlags.ForTooltip` itself is a shortcut to use `style.HoverFlagsForTooltipMouse` or `style.HoverFlagsForTooltipNav`
--   depending on active input type. For mouse it defaults to `ImGuiHoveredFlags.Stationary | ImGuiHoveredFlags.DelayShort`.
--

-- begin/append a tooltip window if preceding item was hovered.
---@return boolean open
function ImGui.BeginItemTooltip() end

-- set a text-only tooltip if preceeding item was hovered. override any previous call to SetTooltip().
---@param fmt string
---@vararg any
function ImGui.SetItemTooltip(fmt, ...) end


--
-- ## Popups, Modals
--  - They block normal mouse hovering detection (and therefore most mouse interactions) behind them.
--  - If not modal: they can be closed by clicking anywhere outside them, or by pressing ESCAPE.
--  - Their visibility state (~bool) is held internally instead of being held by the programmer as we are used to with regular Begin*() calls.
--  - The 3 properties above are related: we need to retain popup visibility state in the library because popups may be closed as any time.
--  - You can bypass the hovering restriction by using ImGuiHoveredFlags_AllowWhenBlockedByPopup when calling IsItemHovered() or IsWindowHovered().
--  - IMPORTANT: Popup identifiers are relative to the current ID stack, so OpenPopup and BeginPopup generally needs to be at the same level of the stack.
--    This is sometimes leading to confusing mistakes. May rework this in the future.
--

-- ### Popups: begin/end functions
--  - BeginPopup(): query popup state, if open start appending into the window. Call EndPopup() afterwards. ImGuiWindowFlags are forwarded to the window.
--  - BeginPopupModal(): block every interaction behind the window, cannot be closed by user, add a dimming background, has a title bar.

-- return true if the popup is open, and you can start outputting to it.
---@param strId string
---@param flags? ImGuiWindowFlags
---@return boolean show
function ImGui.BeginPopup(strId, flags) end

-- return true if the modal is open, and you can start outputting to it.
--
-- If `open` is specified for a modal popup window (i.e. not nil), the popup will have a regular close
-- button which will close the popup.
--
-- Note that popup visibility status is owned by Dear ImGui (and manipulated with e.g. OpenPopup).
-- - open set back to false in BeginPopupModal() when popup is not open.
-- - if you set open to false before calling BeginPopupModal(), it will close the popup.
---@param name string
---@param open? boolean
---@param flags? ImGuiWindowFlags
---@return boolean show, boolean open
function ImGui.BeginPopupModal(name, open, flags) end

-- only call EndPopup() if BeginPopupXXX() returns true!
function ImGui.EndPopup() end


--
-- ### Popups: open/close functions
--  - OpenPopup(): set popup state to open. ImGuiPopupFlags are available for opening options.
--  - If not modal: they can be closed by clicking anywhere outside them, or by pressing ESCAPE.
--  - CloseCurrentPopup(): use inside the BeginPopup()/EndPopup() scope to close manually.
--  - CloseCurrentPopup() is called by default by Selectable()/MenuItem() when activated (FIXME: need some options).
--  - Use ImGuiPopupFlags_NoOpenOverExistingPopup to avoid opening a popup if there's already one at the same level. This is equivalent to e.g. testing for !IsAnyPopupOpen() prior to OpenPopup().
--  - Use IsWindowAppearing() after BeginPopup() to tell if a window just opened.
--  - IMPORTANT: Notice that for OpenPopupOnItemClick() we exceptionally default flags to 1 (== ImGuiPopupFlags_MouseButtonRight) for backward compatibility with older API taking 'int mouse_button = 1' parameter
--

-- call to mark popup as open (don't call every frame!).
---@param strId string
---@param flags? ImGuiPopupFlags
function ImGui.OpenPopup(strId, flags) end
-- id overload to facilitate calling from nested stacks
---@param id integer 
---@param flags? ImGuiPopupFlags
function ImGui.OpenPopup(id, flags) end

-- helper to open popup when clicked on last item. Default to ImGuiPopupFlags.MouseButtonRight == 1.
-- (note: actually triggers on the mouse _released_ event to be consistent with popup behaviors)
---@param strId string
---@param flags? ImGuiPopupFlags
function ImGui.OpenPopupOnItemClick(strId, flags) end

-- manually close the popup we have begin-ed into.
function ImGui.CloseCurrentPopup() end


--
-- ### Popups: open+begin combined functions helpers
--  - Helpers to do OpenPopup+BeginPopup where the Open action is triggered by e.g. hovering an item and right-clicking.
--  - They are convenient to easily create context menus, hence the name.
--  - IMPORTANT: Notice that BeginPopupContextXXX takes ImGuiPopupFlags just like OpenPopup() and unlike BeginPopup().
--    For full consistency, we may add ImGuiWindowFlags to the BeginPopupContextXXX functions in the future.
--  - IMPORTANT: Notice that we exceptionally default their flags to 1 (== ImGuiPopupFlags_MouseButtonRight) for backward
--     compatibility with older API taking 'int mouse_button = 1' parameter, so if you add other flags remember to re-add
--     the ImGuiPopupFlags_MouseButtonRight.
--

-- open+begin popup when clicked on last item. Use str_id==NULL to associate the popup to previous item. If you want to use
-- that on a non-interactive item such as Text() you need to pass in an explicit ID here. read comments in .cpp!
---@param strId? string
---@param flags? ImGuiPopupFlags
---@return boolean
function ImGui.BeginPopupContextItem(strId, flags) end

-- open+begin popup when clicked on current window.
---@param strId? string
---@param flags? ImGuiPopupFlags
---@return boolean
function ImGui.BeginPopupContextWindow(strId, flags) end

-- open+begin popup when clicked in void (where there are no windows).
---@param strId? string
---@param flags? ImGuiPopupFlags
---@return boolean
function ImGui.BeginPopupContextVoid(strId, flags) end


--
-- ### Popups: query functions
--  - IsPopupOpen(): return true if the popup is open at the current BeginPopup() level of the popup stack.
--  - IsPopupOpen() with ImGuiPopupFlags_AnyPopupId: return true if any popup is open at the current BeginPopup() level of the popup stack.
--  - IsPopupOpen() with ImGuiPopupFlags_AnyPopupId + ImGuiPopupFlags_AnyPopupLevel: return true if any popup is open.
--

-- return true if the popup is open.
---@param strId string
---@param flags? ImGuiPopupFlags
---@return boolean
function ImGui.IsPopupOpen(strId, flags) end


--
-- ## Tables
-- - Full-featured replacement for old Columns API.
-- - See Demo->Tables for demo code. See top of imgui_tables.cpp for general commentary.
-- - See ImGuiTableFlags_ and ImGuiTableColumnFlags_ enums for a description of available flags.
-- The typical call flow is:
-- - 1. Call BeginTable(), early out if returning false.
-- - 2. Optionally call TableSetupColumn() to submit column name/flags/defaults.
-- - 3. Optionally call TableSetupScrollFreeze() to request scroll freezing of columns/rows.
-- - 4. Optionally call TableHeadersRow() to submit a header row. Names are pulled from TableSetupColumn() data.
-- - 5. Populate contents:
--    - In most situations you can use TableNextRow() + TableSetColumnIndex(N) to start appending into a column.
--    - If you are using tables as a sort of grid, where every column is holding the same type of contents,
--      you may prefer using TableNextColumn() instead of TableNextRow() + TableSetColumnIndex().
--      TableNextColumn() will automatically wrap-around into the next row if needed.
--    - IMPORTANT: Comparatively to the old Columns() API, we need to call TableNextColumn() for the first column!
--    - Summary of possible call flow:
--        --------------------------------------------------------------------------------------------------------
--        TableNextRow() -> TableSetColumnIndex(0) -> Text("Hello 0") -> TableSetColumnIndex(1) -> Text("Hello 1")  // OK
--        TableNextRow() -> TableNextColumn()      -> Text("Hello 0") -> TableNextColumn()      -> Text("Hello 1")  // OK
--                          TableNextColumn()      -> Text("Hello 0") -> TableNextColumn()      -> Text("Hello 1")  // OK: TableNextColumn() automatically gets to next row!
--        TableNextRow()                           -> Text("Hello 0")                                               // Not OK! Missing TableSetColumnIndex() or TableNextColumn()! Text will not appear!
--        --------------------------------------------------------------------------------------------------------
-- - 5. Call EndTable()
--

---@param strId string
---@param columnsCount integer
---@param tableFlags? ImGuiTableFlags
---@param outerSize? ImVec2
---@param innerWidth? number
---@return boolean
function ImGui.BeginTable(strId, columnsCount, tableFlags, outerSize, innerWidth) end
---@param strId string
---@param columnsCount integer
---@param tableFlags ImGuiTableFlags
---@param outerSizeX number
---@param outerSizeY number
---@param innerWidth? number
---@return boolean
function ImGui.BeginTable(strId, columnsCount, tableFlags, outerSizeX, outerSizeY, innerWidth) end

-- only call EndTable() if BeginTable() returns true!
function ImGui.EndTable() end

-- Append into the first cell of a new row.
---@param rowFlags? ImGuiTableRowFlags
---@param minRowHeight? number
function ImGui.TableNextRow(rowFlags, minRowHeight) end

-- Append into the next column (or first column of next row if currently in last column). Return true when column is visible.
function ImGui.TableNextColumn() end

-- Append into the specified column. Return true when column is visible.
---@param columnN integer
---@return boolean
function ImGui.TableSetColumnIndex(columnN) end


--
-- ### Tables: Headers & Columns declaration
-- - Use TableSetupColumn() to specify label, resizing policy, default width/weight, id, various other flags etc.
-- - Use TableHeadersRow() to create a header row and automatically submit a TableHeader() for each column.
--   Headers are required to perform: reordering, sorting, and opening the context menu.
--   The context menu can also be made available in columns body using ImGuiTableFlags_ContextMenuInBody.
-- - You may manually submit headers using TableNextRow() + TableHeader() calls, but this is only useful in
--   some advanced use cases (e.g. adding custom widgets in header row).
-- - Use TableSetupScrollFreeze() to lock columns/rows so they stay visible when scrolled.
--

---@param label string
---@param flags? ImGuiTableColumnFlags
---@param initWidthOrHeight? number
---@param user_id? integer
function ImGui.TableSetupColumn(label, flags, initWidthOrHeight, user_id)  end

-- lock columns/rows so they stay visible when scrolled.
---@param cols integer
---@param rows integer
function ImGui.TableSetupScrollFreeze(cols, rows) end

-- submit one header cell manually (rarely used)
---@param label string
function ImGui.TableHeader(label) end

-- submit a row with headers cells based on data provided to TableSetupColumn() + submit context menu
function ImGui.TableHeadersRow() end

-- submit a row with angled headers for every column with the ImGuiTableColumnFlags_AngledHeader flag. MUST BE FIRST ROW.
function ImGui.TableAngledHeadersRow() end


--
-- ### Tables: Sorting & Miscellaneous functions
-- - Sorting: call TableGetSortSpecs() to retrieve latest sort specs for the table. NULL when not sorting.
--   When 'sort_specs->SpecsDirty == true' you should sort your data. It will be true when sorting specs have
--   changed since last call, or the first time. Make sure to set 'SpecsDirty = false' after sorting,
--   else you may wastefully sort your data every frame!
-- - Functions args 'int column_n' treat the default value of -1 as the same as passing the current column index.
--

-- get latest sort specs for the table (nil if not sorting).  Lifetime: don't hold on this pointer over multiple
-- frames or past any subsequent call to BeginTable().
function ImGui.TableGetSortSpecs() end

-- return number of columns (value passed to BeginTable)
---@return integer
function ImGui.TableGetColumnCount() end

-- return current column index.
---@return integer
function ImGui.TableGetColumnIndex() end

-- return current row index.
---@return integer
function ImGui.TableGetRowIndex() end

-- return "" if column didn't have a name declared by TableSetupColumn(). Pass -1 to use current column.
---@param columnN? integer
---@return string
function ImGui.TableGetColumnName(columnN) end

-- return column flags so you can query their Enabled/Visible/Sorted/Hovered status flags. Pass -1 to use current column.
---@param columnN? integer
---@return ImGuiTableColumnFlags
function ImGui.TableGetColumnFlags(columnN) end

-- change user accessible enabled/disabled state of a column. Set to false to hide the column. User can use the context
-- menu to change this themselves (right-click in headers, or right-click in columns body with ImGuiTableFlags.ContextMenuInBody)
---@param columnN integer
---@param value boolean
function ImGui.TableSetColumnEnabled(columnN, value) end

-- change the color of a cell, row, or column.
---@param target ImGuiTableBgTarget
---@param color ImVec4|ImU32
---@param columnN? integer
function ImGui.TableSetBgColor(target, color, columnN) end
---@param target ImGuiTableBgTarget
---@param colR number
---@param colG number
---@param colB number
---@param colA number
---@param columnN? integer
function ImGui.TableSetBgColor(target, colR, colG, colB, colA, columnN) end

-- Return hovered column. return -1 when table is not hovered. return columnsCount
-- if the unused space at the right of visible columns is hovered.
--
-- Note: This function is not part of the public imgui api, and may be subject to change.
---@return integer column
function ImGui.TableGetHoveredColumn() end

---@param columnN? integer
---@return boolean
function ImGui.GetColumnIsVisible(columnN) end

---@param columnN? integer
---@return boolean
function ImGui.GetColumnIsSorted(columnN) end

---@param flag ImGuiTableColumnFlags
---@param columnN? integer
function ImGuiGetColumnHasFlag(flag, columnN) end


--
-- ## Legacy Columns API (prefer using Tables!)
-- - You can also use SameLine(pos_x) to mimic simplified columns.
--

---@param count? integer
---@param id? string
---@param border? boolean
function ImGui.Columns(count, id, border) end

-- next column, defaults to current row or next row if the current row is finished
function ImGui.NextColumn() end

-- get current column index
---@return integer
function ImGui.GetColumnIndex() end

-- get column width (in pixels). pass -1 to use current column
---@param columnIndex? integer
---@return number
function ImGui.GetColumnWidth(columnIndex) end

-- set column width (in pixels). pass -1 to use current column
---@param columnIndex integer
---@param width integer
function ImGui.SetColumnWidth(columnIndex, width) end

-- get position of column line (in pixels, from the left side of the contents region). pass -1 to use current column,
-- otherwise 0..GetColumnsCount() inclusive. column 0 is typically 0.0f
---@param columnIndex? integer
---@return number 
function ImGui.GetColumnOffset(columnIndex) end

-- set position of column line (in pixels, from the left side of the contents region). pass -1 to use current column
---@param columnIndex integer
---@param offset integer
function ImGui.SetColumnOffset(columnIndex, offset) end

---@return integer
function ImGui.GetColumnsCount() end


--
-- ## Tab Bars, Tabs
-- - Note: Tabs are automatically created by the docking system (when in 'docking' branch). Use this to create tab bars/tabs yourself.
--

-- create and append into a TabBar
---@param strId string
---@param flags? ImGuiTabBarFlags
---@return boolean
function ImGui.BeginTabBar(strId, flags) end

-- only call EndTabBar() if BeginTabBar() returns true!
function ImGui.EndTabBar() end

-- create a Tab. Returns true if the Tab is selected and its contents should be shown.
---@param label string
---@param open? boolean
---@param flags? ImGuiTabItemFlags
---@return boolean open, boolean show
function ImGui.BeginTabItem(label, open, flags) end

-- only call EndTabItem() if BeginTabItem() returns true!
function ImGui.EndTabItem() end

-- create a Tab behaving like a button. return true when clicked. cannot be selected in the tab bar.
---@param label string
---@param flags? ImGuiTabItemFlags
---@return boolean
function TabItemButton(label, flags) end

-- notify TabBar or Docking system of a closed tab/window ahead (useful to reduce visual flicker on reorderable tab bars).
-- - For tab-bar: call after BeginTabBar() and before Tab submissions.
-- - Otherwise call with a window name.
---@param tabOrDockedWindowLabel string
function ImGui.SetTabItemClosed(tabOrDockedWindowLabel) end


--
-- ## Docking
-- Note: You can use most Docking facilities without calling any API. You DO NOT need to call DockSpace() to use Docking!
-- - Drag from window title bar or their tab to dock/undock. Hold SHIFT to disable docking.
-- - Drag from window menu button (upper-left button) to undock an entire node (all windows).
-- - When io.ConfigDockingWithShift == true, you instead need to hold SHIFT to enable docking.
-- About dockspaces:
-- - Use DockSpaceOverViewport() to create an explicit dock node covering the screen or a specific viewport.
--   This is often used with ImGuiDockNodeFlags_PassthruCentralNode to make it transparent.
-- - Use DockSpace() to create an explicit dock node _within_ an existing window. See Docking demo for details.
-- - Important: Dockspaces need to be submitted _before_ any window they can host. Submit it early in your frame!
-- - Important: Dockspaces need to be kept alive if hidden, otherwise windows docked into it will be undocked.
--   e.g. if you have multiple tabs with a dockspace inside each tab: submit the non-visible dockspaces with ImGuiDockNodeFlags_KeepAliveOnly.
--

---@param id number
---@param size? ImVec2
---@param flags? ImGuiDockNodeFlags
function ImGui.DockSpace(id, size, flags) end

---@param id number
---@param sizeX number
---@param sizeY number
---@param flags? ImGuiDockNodeFlags
function ImGui.DockSpace(id, sizeX, sizeY, flags) end

---@param dockId number
---@param cond? ImGuiCond
function ImGui.SetNextWindowDockID(dockId, cond) end

function ImGui.GetWindowDockID() end
function ImGui.IsWindowDocked() end


-- ## Logging/Capture
-- - All text output from the interface can be captured into tty/file/clipboard.
--   By default, tree nodes are automatically opened during logging.

-- start logging to tty (stdout)
---@param autoOpenDepth? number Default = -1
function ImGui.LogToTTY(autoOpenDepth) end

-- start logging to file
---@param autoOpenDepth? number Default = -1
---@param filename? string
function ImGui.LogToFile(autoOpenDepth, filename) end

-- start logging to OS clipboard
---@param autoOpenDepth? number Default = -1
function ImGui.LogToClipboard(autoOpenDepth) end

-- stop logging (close file, etc.)
function ImGui.LogFinish() end

-- helper to display buttons for logging to tty/file/clipboard
function ImGui.LogButtons() end

-- pass text data straight to log (without being displayed)
---@param text string
function ImGui.LogText(text) end


--
-- Drag and Drop
-- - On source items, call BeginDragDropSource(), if it returns true also call SetDragDropPayload() + EndDragDropSource().
-- - On target candidates, call BeginDragDropTarget(), if it returns true also call AcceptDragDropPayload() + EndDragDropTarget().
-- - If you stop calling BeginDragDropSource() the payload is preserved however it won't have a preview tooltip (we currently display a fallback "..." tooltip, see #1725)
-- - An item can be both drag source and drop target.
--

-- call after submitting an item which may be dragged. when this return true, you can call SetDragDropPayload() + EndDragDropSource()
---@param flags? ImGuiDragDropFlags
---@return boolean
function ImGui.BeginDragDropSource(flags) end

-- type is a user defined string of maximum 32 characters. Strings starting with '_' are reserved for dear imgui internal types.
-- Data is copied and held by imgui. Return true when payload has been accepted.
---@param type string
---@param payload any
---@param cond? ImGuiCond
function ImGui.SetDragDropPayload(type, payload, cond) end

-- only call EndDragDropSource() if BeginDragDropSource() returns true!
function ImGui.EndDragDropSource() end

-- call after submitting an item that may receive a payload. If this returns true, you can call AcceptDragDropPayload() + EndDragDropTarget()
---@return boolean
function ImGui.BeginDragDropTarget() end

-- accept contents of a given type. If ImGuiDragDropFlags_AcceptBeforeDelivery is set you can peek into the payload before the mouse button is released.
---@return ImGuiDragDropPayload #The content being dragged
function ImGui.AcceptDragDropPayload(label) end

-- only call EndDragDropTarget() if BeginDragDropTarget() returns true!
function ImGui.EndDragDropTarget() end

-- peek directly into the current payload from anywhere. returns NULL when drag and drop is finished or inactive. use ImGuiPayload::IsDataType() to test for the payload type.
---@return any
function ImGui.GetDragDropPayload() end


--
-- ## Disabling [BETA API]
-- - Disable all user interactions and dim items visuals (applying style.DisabledAlpha over current colors)
-- - Those can be nested but it cannot be used to enable an already disabled section (a single BeginDisabled(true) in the stack is enough to keep everything disabled)
-- - BeginDisabled(false) essentially does nothing useful but is provided to facilitate use of boolean expressions. If you can avoid calling BeginDisabled(False)/EndDisabled() best to avoid it.
--

-- BeginDisabled()/EndDisabled()
-- - Those can be nested but it cannot be used to enable an already disabled section (a single BeginDisabled(true) in the stack is enough to keep everything disabled)
-- - Visually this is currently altering alpha, but it is expected that in a future styling system this would work differently.
-- - Feedback welcome at https://github.com/ocornut/imgui/issues/211
-- - BeginDisabled(false) essentially does nothing useful but is provided to facilitate use of boolean expressions. If you can avoid calling BeginDisabled(False)/EndDisabled() best to avoid it.
-- - Optimized shortcuts instead of PushStyleVar() + PushItemFlag()
---@param disabled? boolean
function ImGui.BeginDisabled(disabled) end

function ImGui.EndDisabled() end


-- ## Clipping
-- - Mouse hovering is affected by ImGui::PushClipRect() calls, unlike direct calls to ImDrawList::PushClipRect() which are render only.
--

-- Push a clipping rectangle for both ImGui logic (hit-testing etc.) and low-level ImDrawList rendering.
-- - When using this function it is sane to ensure that float are perfectly rounded to integer values,
--   so that e.g. (int)(max.x-min.x) in user's render produce correct result.
-- - If the code here changes, may need to update code of functions like NextColumn() and PushColumnClipRect():
--   some frequently called functions which to modify both channels and clipping simultaneously tend to use the
--   more specialized SetWindowClipRectBeforeSetChannel() to avoid extraneous updates of underlying ImDrawCmds.
---@param clipRectMin ImVec2
---@param clipRectMax ImVec2
---@param intersectWithCurrentClipRect boolean
function ImGui.PushClipRect(clipRectMin, clipRectMax, intersectWithCurrentClipRect) end
---@param clipRectMinX number
---@param clipRectMinY number
---@param clipRectMaxX number
---@param clipRectMaxY number
---@param intersectWithCurrentClipRect boolean
function ImGui.PushClipRect(clipRectMinX, clipRectMinY, clipRectMaxX, clipRectMaxY, intersectWithCurrentClipRect) end

function ImGui.PopClipRect() end


--
-- ## Focus, Activation
-- - Prefer using "SetItemDefaultFocus()" over "if (IsWindowAppearing()) SetScrollHereY()" when applicable to signify "this is the default item"
--

-- make last item the default focused item of a window.
function ImGui.SetItemDefaultFocus() end

-- focus keyboard on the next widget. Use positive 'offset' to access sub components of a multiple component widget.
-- Use -1 to access previous widget.
---@param offset? number
function ImGui.SetKeyboardFocusHere(offset) end


--
-- ## Overlapping mode
--

-- allow next item to be overlapped by a subsequent item. Useful with invisible buttons, selectable, treenode
-- covering an area where subsequent items may need to be added. Note that both Selectable() and TreeNode() have dedicated flags doing this.
function ImGui.SetNextItemAllowOverlap() end


--
-- ## Item/Widgets Utilities and Query Functions
-- - Most of the functions are referring to the previous Item that has been submitted.
-- - See Demo Window under "Widgets->Querying Status" for an interactive visualization of most of those functions.
--

-- is the last item hovered? (and usable, aka not blocked by a popup, etc.). See ImGuiHoveredFlags for more options.
---@param flags? ImGuiHoveredFlags
---@return boolean
function ImGui.IsItemHovered(flags) end

-- is the last item active? (e.g. button being held, text field being edited. This will continuously return true while holding mouse
-- button on an item. Items that don't interact will always return false)
---@return boolean
function ImGui.IsItemActive() end

-- is the last item focused for keyboard/gamepad navigation?
---@return boolean
function ImGui.IsItemFocused() end

-- is the last item hovered and mouse clicked on? (**)  == IsMouseClicked(mouse_button) && IsItemHovered()Important. (**) this is
-- NOT equivalent to the behavior of e.g. Button(). Read comments in function definition.
---@param button? ImGuiMouseButton
---@return boolean
function ImGui.IsItemClicked(button) end

-- is the last item visible? (items may be out of sight because of clipping/scrolling)
---@return boolean
function ImGui.IsItemVisible() end

-- did the last item modify its underlying value this frame? or was pressed? This is generally the same as the "bool" return value of many widgets.
---@return boolean
function ImGui.IsItemEdited() end

-- was the last item just made active (item was previously inactive).
---@return boolean
function ImGui.IsItemActivated() end

-- was the last item just made inactive (item was previously active). Useful for Undo/Redo patterns with widgets that require continuous editing.
---@return boolean
function ImGui.IsItemDeactivated() end

-- was the last item just made inactive and made a value change when it was active? (e.g. Slider/Drag moved). Useful for Undo/Redo patterns
-- with widgets that require continuous editing. Note that you may get false positives (some widgets such as Combo()/ListBox()/Selectable()
-- will return true even when clicking an already selected item).
---@return boolean
function ImGui.IsItemDeactivatedAfterEdit() end

-- was the last item open state toggled? set by TreeNode().
---@return boolean
function ImGui.IsItemToggledOpen() end

-- is any item hovered?
---@return boolean
function ImGui.IsAnyItemHovered() end

-- is any item active?
---@return boolean
function ImGui.IsAnyItemActive() end

-- is any item focused?
---@return boolean
function ImGui.IsAnyItemFocused() end

-- get ID of last item (~~ often same ImGui::GetID(label) beforehand)
---@return ImGuiID
function ImGui.GetItemID() end

-- get upper-left bounding rectangle of the last item (screen space)
---@return ImVec2
function ImGui.GetItemRectMinVec() end

-- get upper-left bounding rectangle of the last item (screen space)
---@return number, number
function ImGui.GetItemRectMin() end

-- get lower-right bounding rectangle of the last item (screen space)
---@return ImVec2
function ImGui.GetItemRectMaxVec() end

-- get lower-right bounding rectangle of the last item (screen space)
---@return number, number
function ImGui.GetItemRectMax() end

-- get size of last item
---@return ImVec2
function ImGui.GetItemRectSizeVec() end

-- get size of last item
---@return number, number
function ImGui.GetItemRectSize() end

-- Use SetNextItemAllowOverlap() before item.
---@deprecated
---@return boolean
function ImGui.SetItemAllowOverlap() end


--
-- ## Viewports
-- - Currently represents the Platform Window created by the application which is hosting our Dear ImGui windows.
-- - In 'docking' branch with multi-viewport enabled, we extend this concept to have multiple active viewports.
-- - In the future we will extend this concept further to also represent Platform Monitor and support a "no main platform window" operation mode.
--

-- return primary/default viewport. This can never be NULL.
---@return ImGuiViewport
function ImGui.GetMainViewport() end


--
-- ## Background/Foreground Draw Lists
--

-- get background draw list for the viewport associated to the current window. this draw list will be the first rendering one.
-- Useful to quickly draw shapes/text behind dear imgui contents.
---@return ImDrawList
function ImGui.GetBackgroundDrawList() end

-- get foreground draw list for the viewport associated to the current window. this draw list will be the last rendered one.
-- Useful to quickly draw shapes/text over dear imgui contents.
---@return ImDrawList
function ImGui.GetForegroundDrawList() end

-- get background draw list for the given viewport. this draw list will be the first rendering one. Useful to quickly draw
-- shapes/text behind dear imgui contents.
---@param viewport ImGuiViewport
---@return ImDrawList
function ImGui.GetBackgroundDrawList(viewport) end

-- get foreground draw list for the given viewport. this draw list will be the last rendered one. Useful to quickly draw shapes/text
-- over dear imgui contents.
---@param viewport ImGuiViewport
---@return ImDrawList
function ImGui.GetForegroundDrawList(viewport) end


--
-- ## Miscellaneous Utilities
--

-- test if rectangle (of given size, starting from cursor position) is visible / not clipped.
---@param size ImVec2
---@return boolean
function ImGui.IsRectVisible(size) end
---@param sizeX number
---@param sizeY number
---@return boolean
function ImGui.IsRectVisible(sizeX, sizeY) end

-- test if rectangle (in screen space) is visible / not clipped. to perform coarse clipping on user's side.
---@param rectMin ImVec2
---@param rectMax ImVec2
---@return boolean
function ImGui.IsRectVisible(rectMin, rectMax) end
---@param rectMinX number
---@param rectMinY number
---@param rectMaxX number
---@param rectMaxY number
---@return boolean
function ImGui.IsRectVisible(rectMinX, rectMinY, rectMaxX, rectMaxY) end

-- get global imgui time. incremented by io.DeltaTime every frame.
---@return number
function ImGui.GetTime() end

-- get global imgui frame count. incremented by 1 every frame.
---@return number
function ImGui.GetFrameCount() end

-- you may use this when creating your own ImDrawList instances.
---@return ImDrawListSharedData
function ImGui.GetDrawListSharedData() end

-- get a string corresponding to the enum value (for display, saving, etc.).
---@param idx ImGuiCol
---@return string
function ImGui.GetStyleColorName(idx) end


--
-- ## Text Utilities
--

-- // Calculate text size. Text can be multi-line. Optionally ignore text after a ## marker.
-- CalcTextSize("") should return ImVec2(0.0f, g.FontSize)
---@param text string
---@param hideTextAfterDoubleDash? boolean
---@param wrapWith? number
---@return ImVec2 size
function ImGui.CalcTextSizeVec(text, hideTextAfterDoubleDash, wrapWith) end

-- // Calculate text size. Text can be multi-line. Optionally ignore text after a ## marker.
-- CalcTextSize("") should return ImVec2(0.0f, g.FontSize)
---@param text string
---@param hideTextAfterDoubleDash? boolean
---@param wrapWith? number
---@return number x, number y
function ImGui.CalcTextSize(text, hideTextAfterDoubleDash, wrapWith) end


--
-- ## Color Utilities
--

-- Convert ImU32 BGRA encoded color number into four floats.
---@see ImVec4 to convert ImU32 to an ImVec4
---@param color ImU32
---@return number r, number g, number b, number a
function ImGui.ColorConvertU32ToFloat4(color) end

-- Convert four floats into ImU32 BGRA encoded color
---@see ImVec4.ToImU32 to do similar with ImVec4
---@param colors number[] Table of four numbers: r, g, b, a
---@return ImU32 color
function ImGui.ColorConvertFloat4ToU32(colors) end

-- Convert rgb floats ([0-1],[0-1],[0-1]) to hsv floats ([0-1],[0-1],[0-1]), from Foley & van Dam p592
-- Optimized http://lolengine.net/blog/2013/01/13/fast-rgb-to-hsv
---@param r number
---@param g number
---@param b number
---@return number h, number s, number v
function ImGui.ColorConvertRGBtoHSV(r, g , b) end

-- Convert hsv floats ([0-1],[0-1],[0-1]) to rgb floats ([0-1],[0-1],[0-1]), from Foley & van Dam p593
-- also http://en.wikipedia.org/wiki/HSL_and_HSV
---@param h number
---@param s number
---@param v number
---@return number r, number g, number b
function ImGui.ColorConvertHSVtoRGB(h, s, v) end


--
-- Inputs Utilities: Keyboard/Mouse/Gamepad
-- - the ImGuiKey enum contains all possible keyboard, mouse and gamepad inputs (e.g. ImGuiKey_A, ImGuiKey_MouseLeft, ImGuiKey_GamepadDpadUp...).
-- - before v1.87, we used ImGuiKey to carry native/user indices as defined by each backends. About use of those legacy ImGuiKey values:
--  - without IMGUI_DISABLE_OBSOLETE_KEYIO (legacy support): you can still use your legacy native/user indices (< 512) 
--    according to how your backend/engine stored them in io.KeysDown[], but need to cast them to ImGuiKey.
--  - with    IMGUI_DISABLE_OBSOLETE_KEYIO (this is the way forward): any use of ImGuiKey will assert with key < 512.
--    GetKeyIndex() is pass-through and therefore deprecated (gone if IMGUI_DISABLE_OBSOLETE_KEYIO is defined).
--
-- Note: IMGUI_DISABLE_OBSOLETE_KEYIO is not defined (legacy supprt is enabled).
--

-- Is key being held.
---@param key ImGuiKey
---@return boolean
function ImGui.IsKeyDown(key) end

-- was key pressed (went from !Down to Down)? if repeat=true, uses io.KeyRepeatDelay / KeyRepeatRate
---@param key ImGuiKey
---@return boolean
function ImGui.IsKeyPressed(key) end

-- was key released (went from Down to !Down)?
---@param key ImGuiKey
---@return boolean
function ImGui.IsKeyReleased(key) end

-- was key chord (mods + key) pressed, e.g. you can pass 'ImGuiMod_Ctrl | ImGuiKey_S' as a key-chord. This doesn't do
-- any routing or focus check, please consider using Shortcut() function instead.
---@param keyChord ImGuiKeyChord
---@return boolean
function ImGui.IsKeyChordPressed(keyChord) end

-- uses provided repeat rate/delay. return a count, most often 0 or 1 but might be >1 if RepeatRate is small enough that DeltaTime > RepeatRate
---@param key ImGuiKey
---@param repeatDelay number
---@param rate number
---@return number
function ImGui.GetKeyPressedAmount(key, repeatDelay, rate) end

-- [DEBUG] returns English name of the key. Those names a provided for debugging purpose and are not meant to be saved persistently not compared.
---@param key ImGuiKey
---@return string
function ImGui.GetKeyName(key) end

-- Override io.WantCaptureKeyboard flag next frame (said flag is left for your application to handle, typically when true it
-- instructs your app to ignore inputs). e.g. force capture keyboard when your widget is being hovered. This is equivalent to
-- setting `io.WantCaptureKeyboard = want_capture_keyboard`; after the next NewFrame() call.
---@param wantCaptureKeyboard bool
function ImGui.SetNextFrameWantCaptureKeyboard(wantCaptureKeyboard) end

-- map ImGuiKey.* values into legacy native key index. == io.KeyMap[key]
---@param key ImGuiKey
---@return number legacyKey
function ImGui.GetKeyIndex(key) end


--
-- Inputs Utilities: Mouse specific
-- - To refer to a mouse button, you may use named enums in your code e.g. ImGuiMouseButton_Left, ImGuiMouseButton_Right.
-- - You can also use regular integer: it is forever guaranteed that 0=Left, 1=Right, 2=Middle.
-- - Dragging operations are only reported after mouse has moved a certain distance away from the initial clicking position
--   (see 'lock_threshold' and 'io.MouseDraggingThreshold')
--

--- is mouse button held?
---@param button ImGuiMouseButton
---@return boolean
function ImGui.IsMouseDown(button) end

--- did mouse button get clicked? (went from !Down to Down)
---@param button ImGuiMouseButton
---@param repeated? boolean
---@return boolean
function ImGui.IsMouseClicked(button, repeated) end

--- did mouse button get released? (went from Down to !Down)
---@param button ImGuiMouseButton
---@return boolean
function ImGui.IsMouseReleased(button) end

--- did mouse button get double-clicked? (note that a double-click will also report IsMouseClicked() == true)
---@param button ImGuiMouseButton
---@return boolean
function ImGui.IsMouseDoubleClicked(button) end

---@param button ImGuiMouseButton
---@return number
function ImGui.GetMouseClickedCount(button) end

--- is mouse hovering given bounding rect (in screen space). clipped by current clipping settings,
--- but disregarding of other consideration of focus/window ordering/popup-block.
---@param min ImVec2
---@param max ImVec2
---@param clip? boolean
---@return boolean
function ImGui.IsMouseHoveringRect(min, max, clip) end
---@param minX number
---@param minY number
---@param maxX number
---@param maxY number
---@param clip? boolean
---@return boolean
function ImGui.IsMouseHoveringRect(minX, minY, maxX, maxY, clip) end

--- if pos is not provided, will use the current mouse pos
---@param pos? ImVec2
---@return boolean
function ImGui.IsMousePosValid(pos) end

-- [WILL OBSOLETE] is any mouse button held? This was designed for backends, but prefer having backend maintain a mask
-- of held mouse buttons, because upcoming input queue system will make this invalid.
---@return boolean
function ImGui.IsAnyMouseDown() end

-- shortcut to ImGui::GetIO().MousePos provided by user, to be consistent with other calls
---@return ImVec2 pos
function ImGui.GetMousePosVec() end

-- shortcut to ImGui::GetIO().MousePos provided by user, to be consistent with other calls
---@return number x, number y
function ImGui.GetMousePos() end

-- retrieve mouse position at the time of opening popup we have BeginPopup() into (helper to avoid user backing that value themselves)
---@return ImVec2 pos
function ImGui.GetMousePosOnOpeningCurrentPopupVec() end

-- retrieve mouse position at the time of opening popup we have BeginPopup() into (helper to avoid user backing that value themselves)
---@return float x, float y
function ImGui.GetMousePosOnOpeningCurrentPopup() end

-- is mouse dragging? (if lock_threshold < -1.0f, uses io.MouseDraggingThreshold)
-- Dragging operations are only reported after mouse has moved a certain distance
-- away from the initial clicking position. see lockThreshold.
---@param button ImGuiMouseButton
---@param lockThreshold? number @default: -1 (if lockThreshold < -1.0, uses io.MouseDraggingThreshold)
---@return boolean
function ImGui.IsMouseDragging(button, lockThreshold) end

-- return the delta from the initial clicking position while the mouse button is pressed or was
-- just released. This is locked and return 0.0 until the mouse moves past a distance threshold
-- at least once.
---@param button? ImGuiMouseButton  @default: ImGuiMouseButton.Left
---@param lockThreshold? number  @default: -1 (if lockThreshold < -1.0f, uses io.MouseDraggingThreshold)
---@return ImVec2
function ImGui.GetMouseDragDeltaVec(button, lockThreshold) end

-- return the delta from the initial clicking position while the mouse button is pressed or was
-- just released. This is locked and return 0.0 until the mouse moves past a distance threshold
-- at least once.
---@param button? ImGuiMouseButton  @default: ImGuiMouseButton.Left
---@param lockThreshold? number  @default: -1 (if lockThreshold < -1.0f, uses io.MouseDraggingThreshold)
---@return number, number
function ImGui.GetMouseDragDelta(button, lockThreshold) end

-- return the delta from the initial clicking position while the mouse button is pressed or was
-- just released. This is locked and return 0.0 until the mouse moves past a distance threshold
-- at least once.
---@param button? ImGuiMouseButton  @default: ImGuiMouseButton.Left
---@param lockThreshold? number  @default: -1 (if lockThreshold < -1.0f, uses io.MouseDraggingThreshold)
---@return ImVec2
function ImGui.GetMouseDragDeltaVec(button, lockThreshold) end

---@param button? ImGuiMouseButton  @default: ImGuiMouseButton.Left
function ImGui.ResetMouseDragDelta(button) end

-- get desired mouse cursor shape. Important: reset in ImGui::NewFrame(), this is updated during the frame.
-- valid before Render(). If you use software rendering by setting io.MouseDrawCursor ImGui will render those for you
---@return ImGuiMouseCursor
function ImGui.GetMouseCursor() end

-- set desired mouse cursor shape
---@param cursor ImGuiMouseCursor
function ImGui.SetMouseCursor(cursor) end

-- Override io.WantCaptureMouse flag next frame (said flag is left for your application to handle, typical when true
-- it instucts your app to ignore inputs). This is equivalent to setting `io.WantCaptureMouse = want_capture_mouse;`
-- after the next NewFrame() call.
---@param wantCaptureMouse boolean
function ImGui.SetNextFrameWantCaptureMouse(wantCaptureMouse) end


--
-- Clipboard Utilities
-- - Also see the LogToClipboard() function to capture GUI into clipboard, or easily output text data to the clipboard.
--

---@return string
function ImGui.GetClipboardText() end

---@param text string
function ImGui.SetClipboardText(text) end


--
-- OBSOLETE functions
-- All of these functions are deprecated and should be replaced with something else
--

---@deprecated Use PushTabStop instead
---@param allowKeyboardFocus boolean
function ImGui.PushAllowKeyboardFocus(allowKeyboardFocus) end

---@deprecated Use PopTabStop instead
function ImGui.PopAllowKeyboardFocus() end

---@deprecated Use BeginChild with ImGuiChildFlags.FrameStyle instead
---@param id number
---@param sizeX number
---@param sizeY number
---@param flags? ImGuiWindowFlags
---@return boolean
function ImGui.BeginChildFrame(id, sizeX, sizeY, flags) end

---@deprecated Use BeginChild with ImGuiChildFlags.FrameStyle instead
---@param id number
---@param size ImVec2
---@param flags? ImGuiWindowFlags
---@return boolean
function ImGui.BeginChildFrame(id, size, flags) end

---@deprecated Use EndChild instead
function ImGui.EndChildFrame() end

---@deprecated Use SetNextFrameWantCaptureKeyboard instead
---@param wantCaptureKeyboard? boolean
function ImGui.CaptureKeyboardFromApp(wantCaptureKeyboard) end

---@deprecated Use SetNextFrameWantCaptureMouse instead
---@param wantCaptureMouse? boolean
function ImGui.CaptureMouseFromApp(wantCaptureMouse) end


--
-- The end
--

return ImGui
