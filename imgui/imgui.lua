---@meta

--- Macroquest ImGui Lua Binding
---@class ImGui
ImGui = {}

---@alias ImU32 number  Represents a color
---@alias ImTextureID number  Represents a texture

--
-- Main
--

---@return ImGuiIO
function ImGui.GetIO() end

---@return ImGuiStyle
function ImGui.GetStyle() end

--
-- Demo, Debug, Information
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
-- Styles
--

---@return ImGuiStyle
function ImGui.StyleColorsDark() end

---@return ImGuiStyle
function ImGui.StyleColorsLight() end

---@return ImGuiStyle
function ImGui.StyleColorsClassic() end


--
--
--

---@param r number
---@param g number
---@param b number
---@param a number
---@return number col
function IM_COL32(r, g, b, a) end

--- Windows

---@param name string
---@return boolean draw
function ImGui.Begin(name) end

---@param name string
---@param open boolean|nil
---@param flags? ImGuiWindowFlags
---@return boolean open, boolean draw
function ImGui.Begin(name, open, flags) end

function ImGui.End() end

--- ChildWindows

---@param name string
---@param sizeX? number
---@param sizeY? number
---@param border? boolean
---@param flags? ImGuiWindowFlags
function ImGui.BeginChild(name, sizeX, sizeY, border, flags) end

function ImGui.EndChild() end

--- Window Utilities

---@return boolean
function ImGui.IsWindowAppearing() end

---@return boolean
function ImGui.IsWindowCollapsed() end

---@param flags? ImGuiFocusedFlags
---@return boolean
function ImGui.IsWindowFocused(flags) end

---@param flags? ImGuiFocusedFlags
---@return boolean
function ImGui.IsWindowHovered(flags) end

---@return ImDrawList
function ImGui.GetWindowDrawList() end

---@return number
function ImGui.GetWindowDpiScale() end

---@return number posX, number posY
function ImGui.GetWindowPos() end

---@return ImVec2
function ImGui.GetWindowPosVec() end

---@return number width, number height
function ImGui.GetWindowSize() end

---@return ImVec2
function ImGui.GetWindowSizeVec() end

---@return number
function ImGui.GetWindowWidth() end

---@return number
function ImGui.GetWindowHeight() end

---@return ImGuiViewport
function ImGui.GetWindowViewport() end

---@param posX number
---@param posY number
---@param cond? ImGuiCond
---@param pivotX? number
---@param pivotY? number
function ImGui.SetNextWindowPos(posX, posY, cond, pivotX, pivotY) end

---@param pos ImVec2
---@param cond? ImGuiCond
---@param pivot? ImVec2
function ImGui.SetNextWindowPos(pos, cond, pivot) end

---@param sizeX number
---@param sizeY number
---@param cond? ImGuiCond
function ImGui.SetNextWindowSize(sizeX, sizeY, cond) end

---@param size ImVec2
---@param cond? ImGuiCond
function ImGui.SetNextWindowSize(size, cond) end

---@param min ImVec2
---@param max ImVec2
---@param customCallback? fun(pos: ImVec2, currentSize: ImVec2, desiredSize: ImVec2): ImVec2
function ImGui.SetNextWindowSizeConstraints(min, max, customCallback) end

---@param minX number
---@param minY number
---@param maxX number
---@param maxY number
function ImGui.SetNextWindowSizeConstraints(minX, minY, maxX, maxY) end

---@param sizeX number
---@param sizeY number
function ImGui.SetNextWindowContentSize(sizeX, sizeY) end

---@param collapsed boolean
---@param cond? ImGuiCond
function ImGui.SetNextWindowCollapsed(collapsed, cond) end

function ImGui.SetNextWindowFocus() end

---@param alpha number
function ImGui.SetNextWindowBgAlpha(alpha) end

---@param viewportID number
function ImGui.SetNextWindowViewport(viewportID) end

---@param name string
---@param posX number
---@param posY number
---@param cond? ImGuiCond
function ImGui.SetWindowPos(name, posX, posY, cond) end

---@param name string
---@param sizeX number
---@param sizeY number
---@param cond? ImGuiCond
function ImGui.SetWindowSize(name, sizeX, sizeY, cond) end

---@param sizeX number
---@param sizeY number
---@param cond? ImGuiCond
function ImGui.SetWindowSize(sizeX, sizeY, cond) end

---@param name string
---@param size ImVec2
---@param cond? ImGuiCond
function ImGui.SetWindowSize(name, size, cond) end

---@param size ImVec2
---@param cond? ImGuiCond
function ImGui.SetWindowSize(size, cond) end

---@param name string
---@param isCollapsed boolean
---@param cond? ImGuiCond
function ImGui.SetWindowCollapsed(name, isCollapsed, cond) end

---@param scale number
function ImGui.SetWindowFontScale(scale) end

---@param name? string
function ImGui.SetWindowFocus(name) end

--- Content Region
---@return number x, number y
function ImGui.GetContentRegionMax() end

---@return number x, number y
function ImGui.GetContentRegionAvail() end

---@return ImVec2 pos
function ImGui.GetContentRegionAvailVec() end

---@return number x, number y
function ImGui.GetWindowContentRegionMin() end
---@return number x, number y
function ImGui.GetWindowContentRegionMax() end
---@return number width
function ImGui.GetWindowContentRegionWidth() end

--- Windows Scrolling
---@return number x
function ImGui.GetScrollX() end
---@return number y
function ImGui.GetScrollY() end
---@return number x
function ImGui.GetScrollMaxX() end
---@return number y
function ImGui.GetScrollMaxY() end
---@param scrollX number
function ImGui.SetScrollX(scrollX) end
---@param scrollY number
function ImGui.SetScrollY(scrollY) end
---@param scrollX? number
function ImGui.SetScrollHereX(scrollX) end
---@param scrollY? number
function ImGui.SetScrollHereY(scrollY) end
---@param localX number
---@param centerXRatio? number
function ImGui.SetScrollFromPosX(localX, centerXRatio) end
---@param localY number
---@param centerYRatio? number
function ImGui.SetScrollFromPosY(localY, centerYRatio) end

--- Parameters Stacks (Shared)
function ImGui.PushFont(...) end
function ImGui.PopFont() end

---@param idx ImGuiCol
---@param col ImU32
function ImGui.PushStyleColor(idx, col) end

---@param idx ImGuiCol
---@param colR number
---@param colG number
---@param colB number
---@param colA number
function ImGui.PushStyleColor(idx, colR, colG, colB, colA) end

---@param idx ImGuiCol
---@param col ImVec4
function ImGui.PushStyleColor(idx, col) end

---@param count? number
function ImGui.PopStyleColor(count) end

---@param idx ImGuiStyleVar
---@param value number
function ImGui.PushStyleVar(idx, value) end

---@param idx ImGuiStyleVar
---@param value number
function ImGui.PushStyleVar(idx, value) end

---@param idx ImGuiStyleVar
---@param width number
---@param height number
function ImGui.PushStyleVar(idx, width, height) end

---@param idx ImGuiStyleVar
---@param val ImVec2
function ImGui.PushStyleVar(idx, val) end

---@param count? number
function ImGui.PopStyleVar(count) end

---@param idx ImGuiCol
---@return ImVec4 color
function ImGui.GetStyleColor(idx) end

function ImGui.GetFont() end

---@return number
function ImGui.GetFontSize() end

---@return number x, number y
function ImGui.GetFontTexUvWhitePixel() end

---@param idx number ImGuiCol value
---@param alphaMul? number Alpha multiplier
---@return number col ImU32
function ImGui.GetColorU32(idx, alphaMul) end

--- @param r number Red
--- @param g number Green
--- @param b number Blue
--- @param a number Alpha
--- @return number col ImU32
function ImGui.GetColorU32(r, g, b, a) end

--- @param col ImVec4
--- @return number col ImU32
function ImGui.GetColorU32(col) end

---@param idx ImGuiCol
---@return number x, number y,number z, number w
function ImGui.GetStyleColorVec4(idx) end

--- Parameters Stacks (Current Window)
---@param itemWidth number
function ImGui.PushItemWidth(itemWidth) end
function ImGui.PopItemWidth() end

---@param itemWidth number
function ImGui.SetNextItemWidth(itemWidth) end

---@return number
function ImGui.CalcItemWidth() end

---@param wrapLocalPosX number
function ImGui.PushTextWrapPos(wrapLocalPosX) end
function ImGui.PopTextWrapPos() end

---@param allowKeyboardFocus boolean
function ImGui.PushAllowKeyboardFocus(allowKeyboardFocus) end
function ImGui.PopAllowKeyboardFocus() end

---@param repeatButton boolean
function ImGui.PushButtonRepeat(repeatButton) end
function ImGui.PopButtonRepeat() end

--- Cursor/Layout
function ImGui.Separator() end

---@param offsetFromStartX? number
---@param spacing? number
function ImGui.SameLine(offsetFromStartX, spacing) end

function ImGui.NewLine() end

function ImGui.Spacing() end

---@param sizeX number
---@param sizeY number
function ImGui.Dummy(sizeX, sizeY) end

---@param indentW? number
function ImGui.Indent(indentW) end

---@param indentW? number
function ImGui.Unindent(indentW) end

function ImGui.BeginGroup() end
function ImGui.EndGroup() end

---@return number x, number y
function ImGui.GetCursorPos() end

---@return number
function ImGui.GetCursorPosX() end

---@return number
function ImGui.GetCursorPosY() end

---@param localX number
---@param localY number
function ImGui.SetCursorPos(localX, localY) end

---@param localX number
function ImGui.SetCursorPosX(localX) end

---@param localY number
function ImGui.SetCursorPosY(localY) end


---@return number x, number y
function ImGui.GetCursorStartPos() end

---@return number x, number y
function ImGui.GetCursorScreenPos() end

---@return ImVec2 pos
function ImGui.GetCursorScreenPosVec() end

---@param x number
---@param y number
function ImGui.SetCursorScreenPos(x, y) end

function ImGui.AlignTextToFramePadding() end

---@return number
function ImGui.GetTextLineHeight() end

---@return number
function ImGui.GetTextLineHeightWithSpacing() end

---@return number
function ImGui.GetFrameHeight() end

---@return number
function ImGui.GetFrameHeightWithSpacing() end

--- ID Stack/Scopes

---@param id any
function ImGui.PushID(id) end

function ImGui.PopID() end

---@param id any
---@return number
function ImGui.GetID(id) end

--- Widgets: Text

---@param text string
function ImGui.TextUnformatted(text) end

---convenience version of ImGui.Text which wraps string.format
---@param format string
---@vararg any
function ImGui.Text(format, ...) end

---@param text string
function ImGui.Text(text) end


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

---@param text string
---@varargs any
function ImGui.TextDisabled(text, ...) end

---@param text string
---@varargs any
function ImGui.TextWrapped(text, ...) end

---@param label string
---@param text string
function ImGui.LabelText(label, text) end

---@param text string
function ImGui.BulletText(text) end

--- Widgets: Main

---@param label string
---@param size? ImVec2
---@return boolean clicked
function ImGui.Button(label, size) end

---@param label string
---@param sizeX number
---@param sizeY number
---@return boolean # clicked
function ImGui.Button(label, sizeX, sizeY) end

---@param label string
function ImGui.SmallButton(label) end

---@param label string
---@param sizeX number
---@param sizeY number
---@return boolean clicked
function ImGui.InvisibleButton(label, sizeX, sizeY) end

---@param label string
---@param size ImVec2
---@param flags? ImGuiButtonFlags
---@return boolean # clicked
function ImGui.InvisibleButton(label, size, flags) end

---@param label string
---@param dir ImGuiDir
---@return boolean clicked
function ImGui.ArrowButton(label, dir) end

---@param textureId ImTextureID
---@param size ImVec2
---@param uv0? ImVec2
---@param uv1? ImVec2
---@param tintCol? ImVec4
---@param borderCol? ImVec4
function ImGui.Image(textureId, size, uv0, uv1, tintCol, borderCol) end

---@param textureId ImTextureID
---@param size ImVec2
---@param uv0? ImVec2
---@param uv1? ImVec2
---@param framePadding? number
---@param bgCol? ImVec4
---@param tintCol? ImVec4
function ImGui.Image(textureId, size, uv0, uv1, framePadding, bgCol, tintCol) end

---@param textureId ImTextureID
---@param size ImVec2
---@param uv0? ImVec2
---@param uv1? ImVec2
---@param framePadding? number
---@param tintCol? ImVec4
---@param borderCol? ImVec4
function ImGui.ImageButton(textureId, size, uv0, uv1, framePadding, tintCol, borderCol) end

---@param label string
---@param value boolean
---@return boolean value, boolean pressed
function ImGui.Checkbox(label, value) end

---@param label string
---@param flags number
---@param flagsValue number
---@return number flags, boolean pressed
function ImGui.CheckboxFlags(label, flags, flagsValue) end

---@param label string
---@param active boolean
---@return boolean active
function ImGui.RadioButton(label, active) end

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

function ImGui.Bullet() end

--- Widgets: Combo Box

---@param label string
---@param previewValue string
---@param flags? ImGuiComboFlags
function ImGui.BeginCombo(label, previewValue, flags) end

function ImGui.EndCombo() end

---@param label string
---@param currentItem number
---@param items string[]
---@param itemsCount number
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

--- Widgets: Drags

---@param label string
---@param value number
---@param valueSpeed? number
---@param valueMin? number
---@param valueMax? number
---@param format? string
---@param power? number
---@return number value, boolean used
function ImGui.DragFloat(label, value, valueSpeed, valueMin, valueMax, format, power) end

---@param label string
---@param value number[]  List of 2 values
---@param valueSpeed? number
---@param valueMin? number
---@param valueMax? number
---@param format? string
---@param power? number
---@return number[] value, boolean used
function ImGui.DragFloat2(label, value, valueSpeed, valueMin, valueMax, format, power) end

---@param label string
---@param value number[]  List of 3 values
---@param valueSpeed? number
---@param valueMin? number
---@param valueMax? number
---@param format? string
---@param power? number
---@return number[] value, boolean used
function ImGui.DragFloat3(label, value, valueSpeed, valueMin, valueMax, format, power) end

---@param label string
---@param value number[]  List of 4 values
---@param valueSpeed? number
---@param valueMin? number
---@param valueMax? number
---@param format? string
---@param power? number
---@return number[] value, boolean used
function ImGui.DragFloat4(label, value, valueSpeed, valueMin, valueMax, format, power) end

---@param label string
---@param value integer
---@param valueSpeed? number
---@param valueMin? integer
---@param valueMax? integer
---@param format? string
---@return integer value, boolean used
function ImGui.DragInt(label, value, valueSpeed, valueMin, valueMax, format) end

---@param label string
---@param value integer
---@param valueSpeed? number
---@param valueMin? integer
---@param valueMax? integer
---@param format? string
---@return integer[] value, boolean used
function ImGui.DragInt2(label, value, valueSpeed, valueMin, valueMax, format) end

---@param label string
---@param value integer
---@param valueSpeed? number
---@param valueMin? integer
---@param valueMax? integer
---@param format? string
---@return integer[] value, boolean used
function ImGui.DragInt3(label, value, valueSpeed, valueMin, valueMax, format) end

---@param label string
---@param value integer
---@param valueSpeed? number
---@param valueMin? integer
---@param valueMax? integer
---@param format? string
---@return integer[] value, boolean used
function ImGui.DragInt4(label, value, valueSpeed, valueMin, valueMax, format) end

--- Widgets: Sliders

---@param label string
---@param value number
---@param valueSpeed? number
---@param valueMin? number
---@param valueMax? number
---@param format? string
---@param power? number
---@return number value, boolean used
function ImGui.SliderFloat(label, value, valueSpeed, valueMin, valueMax, format, power) end

---@param label string
---@param value number
---@param valueSpeed? number
---@param valueMin? number
---@param valueMax? number
---@param format? string
---@param power? number
---@return number[] value, boolean used
function ImGui.SliderFloat2(label, value, valueSpeed, valueMin, valueMax, format, power) end

---@param label string
---@param value number
---@param valueSpeed? number
---@param valueMin? number
---@param valueMax? number
---@param format? string
---@param power? number
---@return number[] value, boolean used
function ImGui.SliderFloat3(label, value, valueSpeed, valueMin, valueMax, format, power) end

---@param label string
---@param value number
---@param valueSpeed? number
---@param valueMin? number
---@param valueMax? number
---@param format? string
---@param power? number
---@return number[] value, boolean used
function ImGui.SliderFloat4(label, value, valueSpeed, valueMin, valueMax, format, power) end

---@param label string
---@param v_rad number
---@param v_degrees_min number
---@param v_degrees_max number
---@param format string
---@return number v_rad, boolean used
function ImGui.SliderAngle(label, v_rad, v_degrees_min, v_degrees_max, format) end

---@param label string
---@param v integer
---@param v_min integer
---@param v_max integer
---@param format? string
---@return integer value, boolean selected
function ImGui.SliderInt(label, v, v_min, v_max, format) end


---@param label string
---@param v table
---@param v_min integer
---@param v_max integer
---@param format? string
---@return integer[] values, boolean selected
function ImGui.SliderInt2(label, v, v_min, v_max, format) end

---@param label string
---@param v table
---@param v_min integer
---@param v_max integer
---@param format? string
---@return integer[] values, boolean selected
function ImGui.SliderInt3(label, v, v_min, v_max, format) end

---@param label string
---@param v table
---@param v_min integer
---@param v_max integer
---@param format? string
---@return integer[] values, boolean selected
function ImGui.SliderInt4(label, v, v_min, v_max, format) end

---@param label string
---@param size_x number
---@param size_y number
---@param value number
---@param valueMin number
---@param valueMax number
---@param format? string
---@param power? number
---@return number value, boolean used
function ImGui.VSliderFloat(label, size_x, size_y, value, valueMin, valueMax, format, power) end

---@param label string
---@param size_x number
---@param size_y number
---@param value integer
---@param valueMin integer
---@param valueMax integer
---@param format? string
---@return integer value, boolean used
function ImGui.VSliderInt(label, size_x, size_y, value, valueMin, valueMax, format) end

--- Widgets: Input with Keyboard

---@param label string
---@param text string
---@param imGuiInputTextFlags? ImGuiInputTextFlags
--- @return string text, boolean selected
function ImGui.InputText(label, text, imGuiInputTextFlags) end

---@param label string
---@param text string
---@param size_x number
---@param size_y number
---@param imGuiInputTextFlags? ImGuiInputTextFlags
--- @return string text, boolean selected
function ImGui.InputTextMultiline(label, text, size_x, size_y, imGuiInputTextFlags) end

--- @param label string
--- @param hint string
--- @param text string
--- @param imGuiInputTextFlags? ImGuiInputTextFlags
--- @return string text, boolean selected
function ImGui.InputTextWithHint(label, hint, text, imGuiInputTextFlags) end

function ImGui.InputFloat(...) end
function ImGui.InputFloat2(...) end
function ImGui.InputFloat3(...) end
function ImGui.InputFloat4(...) end
function ImGui.InputInt(...) end
function ImGui.InputInt2(...) end
function ImGui.InputInt3(...) end
function ImGui.InputInt4(...) end
function ImGui.InputDouble(...) end

--- Widgets: Color Editor / Picker

---@param label string
---@param col number[] Color as list of 3 numbers 0.0 to 1.0
---@param flags? ImGuiColorEditFlags
---@return number[] col, boolean changed
function ImGui.ColorEdit3(label, col, flags) end

---@param label string
---@param col ImVec4
---@param flags? ImGuiColorEditFlags
---@return ImVec4 col, boolean changed
function ImGui.ColorEdit3(label, col, flags) end

---@param label string
---@param col number[]  Color as list of 4 numbers 0.0 to 1.0
---@param flags? number
---@return number[] col, boolean changed
function ImGui.ColorEdit4(label, col, flags) end

---@param label string
---@param col ImVec4
---@param flags? number
---@return ImVec4 col, boolean changed
function ImGui.ColorEdit4(label, col, flags) end

function ImGui.ColorPicker3(...) end
function ImGui.ColorPicker4(...) end
function ImGui.ColorButton(...) end
function ImGui.SetColorEditOptions(...) end

--- Widgets: Trees
function ImGui.TreeNode(label) end
function ImGui.TreeNode(strId, label) end

function ImGui.TreeNodeEx(...) end

---@param id? any
function ImGui.TreePush(id) end

function ImGui.TreePop() end

---@return number
function ImGui.GetTreeNodeToLabelSpacing() end

---@param label string
---@param flags? ImGuiTreeNodeFlags
function ImGui.CollapsingHeader(label, flags) end

---@param label string
---@param open boolean|nil
---@param flags? ImGuiTreeNodeFlags
---@return boolean open, boolean show
function ImGui.CollapsingHeader(label, open, flags) end

---@param isOpen boolean
---@param cond? ImGuiCond
function ImGui.SetNextItemOpen(isOpen, cond) end

--- Widgets: Selectables

---@param label string
---@return boolean clicked
function ImGui.Selectable(label) end

---@param label string
---@param selected boolean
---@param flags? ImGuiSelectableFlags
---@param size? ImVec2
---@return boolean selected, boolean clicked
function ImGui.Selectable(label, selected, flags, size) end

---@param label string
---@param selected boolean
---@param flags ImGuiSelectableFlags
---@param sizeX number
---@param sizeY number
---@return boolean selected, boolean clicked
function ImGui.Selectable(label, selected, flags, sizeX, sizeY) end

--- Widgets: List Boxes

---@param label string
---@param size? ImVec2
---@return boolean changed
function ImGui.BeginListBox(label, size) end

function ImGui.EndListBox() end

---@param label string
---@param current_item integer
---@param items table
---@param items_count integer
---@param height_in_items? integer
---@return integer current_item, boolean clicked
function ImGui.ListBox(label, current_item, items, items_count, height_in_items) end

---@param label string
---@param size_x number
---@param size_y number
function ImGui.ListBoxHeader(label, size_x, size_y) end


---@param label string
---@param items_count integer
---@param height_in_items? integer
function ImGui.ListBoxHeader(label, items_count, height_in_items) end

function ImGui.ListBoxFooter() end

--- Widgets: Value() Helpers
---@param text string
---@param value boolean|number
---@param float_format? string # format only available with float
function ImGui.Value(text, value, float_format) end

--- Widgets: Menus

---@return boolean
function ImGui.BeginMenuBar() end

function ImGui.EndMenuBar() end

---@return boolean
function ImGui.BeginMainMenuBar() end

function ImGui.EndMainMenuBar() end

---@param label string
---@param enabled? boolean
---@return boolean
function ImGui.BeginMenu(label, enabled) end

function ImGui.EndMenu() end

---@param label string
---@param shortcut? string|nil
---@param selected? boolean|nil @if the menu item is activated, this value will be toggled and returned back as 2nd param
---@param enabled? boolean
---@return boolean activated, boolean selected
function ImGui.MenuItem(label, shortcut, selected, enabled) end

--- Tooltips
function ImGui.BeginTooltip() end
function ImGui.EndTooltip() end
function ImGui.SetTooltip(...) end

--
-- Popups, Modals
--

--- return true if the popup is open, and you can start outputting to it.
---@param strId string
---@param flags? ImGuiWindowFlags
---@return boolean
function ImGui.BeginPopup(strId, flags) end


--- If no open param is provided, or if it is nil, then only the boolean
--- result from BeginPopupModal is returned.
---@param name string
---@param open? nil
---@param flags? ImGuiWindowFlags
---@return boolean
function ImGui.BeginPopupModal(name, open, flags) end

--- If open is provided as a boolean argument, then the updated value for
--- open is returned first, and then the result from BeginPopupModal.
---@param name string
---@param open boolean
---@param flags? ImGuiWindowFlags
---@return boolean open, boolean show
function ImGui.BeginPopupModal(name, open, flags) end

function ImGui.EndPopup() end

--- call to mark popup as open (don't call every frame!).
---@param strId string
---@param flags? ImGuiPopupFlags
function ImGui.OpenPopup(strId, flags) end

--- helper to open popup when clicked on last item. Default to ImGuiPopupFlags.MouseButtonRight == 1.
--- (note: actually triggers on the mouse _released_ event to be consistent with popup behaviors)
---@param strId string
---@param flags? ImGuiPopupFlags
function ImGui.OpenPopupOnItemClick(strId, flags) end

function ImGui.CloseCurrentPopup() end

---@param strId? string
---@param flags? ImGuiPopupFlags
---@return boolean
function ImGui.BeginPopupContextItem(strId, flags) end

---@param strId? string
---@param flags? ImGuiPopupFlags
---@return boolean
function ImGui.BeginPopupContextWindow(strId, flags) end

---@param strId? string
---@param flags? ImGuiPopupFlags
---@return boolean
function ImGui.BeginPopupContextVoid(strId, flags) end

---@param strId string
---@param flags? ImGuiPopupFlags
function ImGui.IsPopupOpen(strId, flags) end

--
-- Columns
--

---@param count? integer
---@param text? string
---@param border? boolean
function ImGui.Columns(count, text, border) end

function ImGui.NextColumn() end

---@return integer # Column index
function ImGui.GetColumnIndex() end

---@param columnIndex? integer
---@return number
function ImGui.GetColumnWidth(columnIndex) end

---@param columnIndex integer
---@param width integer
function ImGui.SetColumnWidth(columnIndex, width) end

---@param columnIndex? integer
---@return number 
function ImGui.GetColumnOffset(columnIndex) end

---@param columnIndex integer
---@param offset integer
function ImGui.SetColumnOffset(columnIndex, offset) end

---@return integer
function ImGui.GetColumnsCount() end

--- Tab Bars, Tabs

---@param strId string
---@param flags? number
---@return boolean
function ImGui.BeginTabBar(strId, flags) end

function ImGui.EndTabBar() end

---@param label string
---@return boolean
function ImGui.BeginTabItem(label) end

---@param label string
---@param open boolean
---@param flags? number
---@return boolean open, boolean boolean
function ImGui.BeginTabItem(label, open, flags) end

function ImGui.EndTabItem() end

---@param tabOrDockedWindowLabel string
function ImGui.SetTabItemClosed(tabOrDockedWindowLabel) end

--
-- Docking
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

--- Logging
function ImGui.LogToTTY(...) end
function ImGui.LogToFile(...) end
function ImGui.LogToClipboard(...) end
function ImGui.LogFinish() end
function ImGui.LogButtons() end
function ImGui.LogText(...) end

-- Disabling

---@param disabled? boolean
function ImGui.BeginDisabled(disabled) end

function ImGui.EndDisabled() end

--- Clipping
function ImGui.PushClipRect(...) end
function ImGui.PopClipRect() end

--- Focus, Activation
function ImGui.SetItemDefaultFocus() end
function ImGui.SetKeyboardFocusHere(...) end

--- Item / Widgets Utilities

---@param flags? ImGuiHoveredFlags
---@return boolean
function ImGui.IsItemHovered(flags) end

---@return boolean
function ImGui.IsItemActive() end

---@return boolean
function ImGui.IsItemFocused() end

---@param button? ImGuiMouseButton
---@return boolean
function ImGui.IsItemClicked(button) end

---@return boolean
function ImGui.IsItemVisible() end

---@return boolean
function ImGui.IsItemEdited() end

---@return boolean
function ImGui.IsItemActivated() end

---@return boolean
function ImGui.IsItemDeactivated() end

---@return boolean
function ImGui.IsItemDeactivatedAfterEdit() end

---@return boolean
function ImGui.IsItemToggledOpen() end

---@return boolean
function ImGui.IsAnyItemHovered() end

---@return boolean
function ImGui.IsAnyItemActive() end

---@return boolean
function ImGui.IsAnyItemFocused() end

---@return number, number
function ImGui.GetItemRectMin() end

---@return number, number
function ImGui.GetItemRectMax() end

---@return number, number
function ImGui.GetItemRectSize() end

---@return boolean
function ImGui.SetItemAllowOverlap() end


--- Viewports

---@return ImGuiViewport
function ImGui.GetMainViewport() end


--- Miscellaneous Utilities
function ImGui.IsRectVisible(...) end
function ImGui.GetTime() end
function ImGui.GetFrameCount() end

---@return ImDrawList
function ImGui.GetBackgroundDrawList() end

---@param viewport ImGuiViewport
---@return ImDrawList
function ImGui.GetBackgroundDrawList(viewport) end

---@return ImDrawList
function ImGui.GetForegroundDrawList() end

---@param viewport ImGuiViewport
---@return ImDrawList
function ImGui.GetForegroundDrawList(viewport) end

---@return ImDrawListSharedData
function ImGui.GetDrawListSharedData() end

function ImGui.GetStyleColorName(...) end

---@param id number
---@param sizeX number
---@param sizeY number
---@param flags? ImGuiWindowFlags
---@return boolean
function ImGui.BeginChildFrame(id, sizeX, sizeY, flags) end

---@param id number
---@param size ImVec2
---@param flags? ImGuiWindowFlags
---@return boolean
function ImGui.BeginChildFrame(id, size, flags) end


function ImGui.EndChildFrame() end

--- Text Utilities

---@param text string
---@param textEnd? string
---@param hideTextAfterDoubleDash? boolean
---@param wrapWith? number
---@return number x, number y
function ImGui.CalcTextSize(text, textEnd, hideTextAfterDoubleDash, wrapWith) end

--- Color Utilities

---@param r number
---@param g number
---@param b number
---@return number h, number s, number v
function ImGui.ColorConvertRGBtoHSV(r, g , b) end

---@param h number
---@param s number
---@param v number
---@return number r, number g, number b
function ImGui.ColorConvertHSVtoRGB(h, s, v) end

--- Inputs Utilities: Keyboard
function ImGui.GetKeyIndex(...) end
function ImGui.IsKeyDown(...) end
function ImGui.IsKeyPressed(...) end
function ImGui.IsKeyReleased(...) end
function ImGui.GetKeyPressedAmount(...) end
function ImGui.CaptureKeyboardFromApp(...) end

--- Inputs Utilities: Mouse

--- is mouse button held?
---@param button? ImGuiMouseButton
---@return boolean
function ImGui.IsMouseDown(button) end

--- did mouse button get clicked? (went from !Down to Down)
---@param button? ImGuiMouseButton
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

--- is mouse hovering given bounding rect (in screen space). clipped by current clipping settings,
--- but disregarding of other consideration of focus/window ordering/popup-block.
---@param minX number
---@param minY number
---@param maxX number
---@param maxY number
---@param clip? boolean
---@return boolean
function ImGui.IsMouseHoveringRect(minX, minY, maxX, maxY, clip) end

--- is mouse hovering given bounding rect (in screen space). clipped by current clipping settings,
--- but disregarding of other consideration of focus/window ordering/popup-block.
---@param min ImVec2
---@param max ImVec2
---@param clip? boolean
---@return boolean
function ImGui.IsMouseHoveringRect(min, max, clip) end

--- if pos is not provided, will use the current mouse pos
---@param pos? ImVec2
function ImGui.IsMousePosValid(pos) end

---@return boolean
function ImGui.IsAnyMouseDown() end

---@return number x, number y
function ImGui.GetMousePos() end

---@return ImVec2 pos
function ImGui.GetMousePosVec() end

function ImGui.GetMousePosOnOpeningCurrentPopup() end

--- is mouse dragging?
--- Dragging operations are only reported after mouse has moved a certain distance
--- away from the initial clicking position. see lockThreshold.
---@param button ImGuiMouseButton
---@param lockThreshold? number @default: -1 (if lockThreshold < -1.0, uses io.MouseDraggingThreshold)
---@return boolean
function ImGui.IsMouseDragging(button, lockThreshold) end

--- return the delta from the initial clicking position while the mouse button is pressed or was
--- just released. This is locked and return 0.0 until the mouse moves past a distance threshold
--- at least once.
---@param button? ImGuiMouseButton  @default: ImGuiMouseButton.Left
---@param lockThreshold? number  @default: -1 (if lockThreshold < -1.0f, uses io.MouseDraggingThreshold)
---@return number, number
function ImGui.GetMouseDragDelta(button, lockThreshold) end

--- return the delta from the initial clicking position while the mouse button is pressed or was
--- just released. This is locked and return 0.0 until the mouse moves past a distance threshold
--- at least once.
---@param button? ImGuiMouseButton  @default: ImGuiMouseButton.Left
---@param lockThreshold? number  @default: -1 (if lockThreshold < -1.0f, uses io.MouseDraggingThreshold)
---@return ImVec2
function ImGui.GetMouseDragDeltaVec(button, lockThreshold) end

function ImGui.ResetMouseDragDelta(...) end
function ImGui.GetMouseCursor() end
function ImGui.SetMouseCursor(...) end
function ImGui.CaptureMouseFromApp() end

--- Clipboard Utilities
function ImGui.GetClipboardText() end
function ImGui.SetClipboardText(...) end

--- Uncategorized

---@param name string
---@param render fun()
function ImGui.Register(name, render) end

--- Tables
---@param name string
---@param columnsCount integer
---@param tableFlags? ImGuiTableFlags
---@return boolean
function ImGui.BeginTable(name, columnsCount, tableFlags, outerSize, innerWidth) end

---@param name string
---@param columnsCount integer
---@param tableFlags ImGuiTableFlags
---@param outer_sizeX number
---@param outer_sizeY number
---@param innerWidth? number
---@return boolean
function ImGui.BeginTable(name, columnsCount, tableFlags, outer_sizeX, outer_sizeY, innerWidth) end

function ImGui.EndTable() end

---@return integer # Return hovered column. return -1 when table is not hovered. return columns_count if the unused space at the right of visible columns is hovered.
function ImGui.TableGetHoveredColumn() end

---@param label string
---@param flags? ImGuiTableColumnFlags
---@param init_width_or_weight? number
---@param user_id? integer
function ImGui.TableSetupColumn(label, flags, init_width_or_weight, user_id)  end

---@param bg_target integer
---@param colR number
---@param colG number
---@param colB number
---@param colA number
---@param column_n? integer
function ImGui.TableSetBgColor(bg_target, colR, colG, colB, colA, column_n) end

---@param cols integer
---@param rows integer
function ImGui.TableSetupScrollFreeze(cols, rows) end

---@param column_n integer
---@return boolean
function ImGui.TableSetColumnIndex(column_n) end

function ImGui.TableGetSortSpecs() end

function ImGui.TableHeadersRow() end

---@param row_flags? integer
---@param min_row_height? number
function ImGui.TableNextRow(row_flags, min_row_height) end

function ImGui.TableNextColumn() end

---@return boolean
function ImGui.BeginDragDropSource() end

---@param label string
---@param payload any
function ImGui.SetDragDropPayload(label, payload) end

function ImGui.EndDragDropSource() end

---@return boolean
function ImGui.BeginDragDropTarget() end

---@return userdata #LuaImGuiPayload
function ImGui.AcceptDragDropPayload(label) end

function ImGui.EndDragDropTarget() end

---@param texture userdata #CTextureAnimation
---@param width number
---@param height number
function ImGui.DrawTextureAnimation(texture, width, height) end

--- Custom additions
---@param label string
---@param width? number
---@param font? ImFont
function ImGui.HelpMarker(label, width, font) end
