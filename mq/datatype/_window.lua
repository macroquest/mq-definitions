---@meta

--- Window type for HotButton windows
---@class hotbuttonwindow
---@field public ToString MQString

--- Window type for InvSlot windows
---@class invslotwindow
---@field public ToString MQString

---@class window
---@field public BGColor argb # Background color of the window
---@field public Checked MQBoolean # Returns TRUE if the button has been checked
---@field public Children MQBoolean # Returns TRUE if the window has children
---@field public CurrentTab MQWindow # [TabBox] Returns the Page window associated with the currently selected tab
---@field public CurrentTabIndex MQInt # [TabBox] Returns the index of the currently selected tab
---@field public Enabled MQBoolean # Returns TRUE if the window is enabled
---@field public FirstChild MQWindow # Returns the first child window in the window hierarchy
---@field public GetCurSel MQInt # @deprecated Use SelectedIndex instead. [Combobox, Listbox, TreeView] Index of the currently selected/highlighted item
---@field public Height MQInt # Height of the window in pixels
---@field public Highlighted MQBoolean # Returns TRUE if the window is the currently focused window
---@field public HisTradeReady MQBoolean # Has the other person clicked the Trade button?
---@field public HotButton hotbuttonwindow # [HotButton] Returns the HotButton associated with this window object
---@field public HScrollMax MQInt # Horizontal scrollbar maximum position
---@field public HScrollPct MQInt # Horizontal scroll bar current position as a percentage of the maximum position as a value from 0 to 100
---@field public HScrollPos MQInt # Horizontal scroll bar current position
---@field public InvSlot invslotwindow # [InvSlot] Returns the InvSlot associated with this window object
---@field public Items MQInt # [Combobox, Listbox, TreeView] Number of items in the list
---@field public Minimized MQBoolean # Returns TRUE if the window is minimized
---@field public MouseOver MQBoolean # Returns TRUE if the mouse is currently over the window
---@field public MyTradeReady MQBoolean # Have I clicked the Trade button?
---@field public Name MQString # Name of window piece. Note: this is Custom UI dependent
---@field public Next MQWindow # Next sibling window in the window hierarchy
---@field public Open MQBoolean # Returns TRUE if the window is open
---@field public Parent MQWindow # Returns the parent of this window, or NULL if this is a top level window
---@field public ScreenID MQString # ScreenID of the window piece. Note: This is not Custom UI dependent, it must be the same on all UIs
---@field public SelectedIndex MQInt # [Combobox, Listbox, TreeView] Index of the currently selected/highlighted item
---@field public Siblings MQBoolean # Returns TRUE if the window has siblings
---@field public Size MQString # Returns the size of the window in the form of "width,height"
---@field public Style MQInt # Returns an integer representing the window style bit flags
---@field public TabCount MQInt # [TabBox] The number of tabs present in the TabBox
---@field public Text MQString # The text of the window. STMLbox: Returns the contents of the STML. Page: Returns the name of the page's Tab
---@field public Tooltip MQString # The tooltip text for the window (from TooltipReference)
---@field public Type MQString # The window's type (Screen, Listbox, Gauge, SpellGem, InvSlot, Editbox, Slider, Label, STMLbox, TreeView, Combobox, Page, TabBox, LayoutBox, HorizontalLayoutBox, VerticalLayoutBox, FinderBox, TileLayoutBox, HotButton)
---@field public Value MQFloat # Value of the window
---@field public VScrollMax MQInt # Vertical scrollbar maximum position
---@field public VScrollPct MQInt # Vertical scroll bar current position as a percentage of the maximum position as a value from 0 to 100
---@field public VScrollPos MQInt # Vertical scroll bar current position
---@field public Width MQInt # Width of the window in pixels
---@field public X MQInt # The X coordinate of the window's position, in pixels
---@field public Y MQInt # The Y coordinate of the window's position, in pixels
---@field public ToString MQBoolean # TRUE if the window is open, FALSE if not, matching Open
local window = nil

--- Find a child window with the provided name
---@param name string # Name of a child window
---@return MQWindow
function window.Child(name) end

--- Close the window. Has the effect of hiding the window if it closed
function window.DoClose() end

--- Open the window. Has the effect of showing the window if it is hidden
function window.DoOpen() end

--- Send a leftmousedown event to the window
function window.LeftMouseDown() end

--- Send a leftmouseheld event to the window
function window.LeftMouseHeld() end

--- Send a leftmouseheldup event to the window
function window.LeftMouseHeldUp() end

--- Send a leftmouseup event to the window
function window.LeftMouseUp() end

--- Move or resize the window
---@param x integer # X position
---@param y integer # Y position
---@param width integer # Width
---@param height integer # Height
function window.Move(x, y, width, height) end

--- Send a rightmousedown event to the window
function window.RightMouseDown() end

--- Send a rightmouseheld event to the window
function window.RightMouseHeld() end

--- Send a rightmouseheldup event to the window
function window.RightMouseHeldUp() end

--- Send a rightmouseup event to the window
function window.RightMouseUp() end

---@diagnostic disable: duplicate-set-field

--- [Combobox, Listbox, TreeView] Selects the specified item in the list
---@param index integer # The number index of the item to select
function window.Select(index) end

--- Set the alpha value for the window
---@param alpha integer # The alpha value, a number between 0 and 255
function window.SetAlpha(alpha) end

--- Set the background color
---@param color string # A hex string in the form "AARRGGBB"
function window.SetBGColor(color) end

--- [TabBox] Changes the current tab of the tab box
---@param indexOrText integer|string # Either the text or the index of the tab to select. If text is provided, it is case insensitive
function window.SetCurrentTab(indexOrText) end

--- Set the faded alpha value for the window
---@param alpha integer # The alpha value, a number between 0 and 255
function window.SetFadeAlpha(alpha) end

--- [EditBox] Changes the current text value of the edit box
---@param text string # The text to set to the edit box
function window.SetText(text) end

--- [TabBox] Looks up the Page window that matches the provided tab index in the TabBox
---@param index integer # Tab index
---@return MQWindow
function window.Tab(index) end

--- [TabBox] Looks up the Page window that matches the provided tab text in the TabBox
---@param text string # Tab text
---@return MQWindow
function window.Tab(text) end

--- [Combobox, Listbox, TreeView] Get text for an item in the list by the specified row and column
---@param row integer # Row index of the item in the list
---@param col? integer # Column index of the item in the list (default: first column)
---@return string
function window.List(row, col) end

--- [Combobox, Listbox, TreeView] Search a list for an item by text. Returns the index of the first element that matches. Prefix with = for exact match
---@param text string # Text to search for. Partial match is performed. Prefix with = for exact match
---@param col? integer # Column index to search (default: first column)
---@return integer
function window.List(text, col) end

---@diagnostic enable: duplicate-set-field
