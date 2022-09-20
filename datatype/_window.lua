--- @class window
--- @field public BGColor argb # Background color
--- @field public Checked MQBoolean # Returns TRUE if the button has been checked
--- @field public Children MQBoolean # Returns TRUE if the window has children
--- @field public Enabled MQBoolean # Returns TRUE if the window is enabled
--- @field public FirstChild MQWindow # First child window
--- @field public Height MQFloat # Height in pixels
--- @field public Highlighted MQBoolean # Returns TRUE if the window is highlighted
--- @field public HisTradeReady MQBoolean # Has the other person clicked the Trade button?
--- @field public HScrollMax MQFloat # Horizontal scrollbar range
--- @field public HScrollPos MQFloat # Horizontal scrollbar position
--- @field public HScrollPct MQFloat # Horizontal scrollbar position in % to range from 0 to 100
--- @field public Items MQFloat # Number of items in a Listbox or Combobox
--- @field public Minimized MQBoolean # Returns TRUE if the window is minimized
--- @field public MouseOver MQBoolean # Returns TRUE if the mouse is currently over the window
--- @field public MyTradeReady MQBoolean # Have I clicked the Trade button?
--- @field public Name MQString # Name of window piece, e.g. "ChatWindow" for top level windows, or the piece name for child windows. Note: this is Custom UI dependent
--- @field public Next MQWindow # Next sibling window
--- @field public Open MQBoolean #R eturns TRUE if the window is open
--- @field public Parent MQWindow Parent window
--- @field public ScreenID MQString # ScreenID of window piece. Note: This is not Custom UI dependent, it must be the same on all UIs
--- @field public Siblings MQBoolean # Returns TRUE if the window has siblings
--- @field public Style MQFloat # Window style code
--- @field public Text MQString # Window's text
--- @field public Tooltip MQString #T ooltipReference text
--- @field public Type MQString # Type of window piece (Screen for top level windows, or Listbox, Button, Gauge, Label, Editbox, Slider, etc)
--- @field public VScrollMax MQFloat # Vertical scrollbar range
--- @field public VScrollPct MQFloat # Vertical scrollbar position in % to range from 0 to 100
--- @field public VScrollPos MQFloat # Vertical scrollbar position
--- @field public Width MQFloat # Width in pixels
--- @field public X MQFloat # Screen X position
--- @field public Y MQFloat # Screen Y position
--- @field public ToString MQBoolean # TRUE if window exists, FALSE if not
local window = nil

---@param name string # Child with this name
---@return MQWindow
function window.Child(name) end

---Does the action of closing a window
function window.DoClose() end

---Does the action of opening a window
function window.DoOpen() end

---Does the action of clicking the left mouse button down
function window.LeftMouseDown() end

---Does the action of holding the left mouse button
function window.LeftMouseHeld() end

---Does the action of holding the left mouse button up
function window.LeftMouseHeldUp() end

---Does the action of clicking the left mouse button up
function window.LeftMouseUp() end

---Does the action of clicking the right mouse button
function window.RightMouseDown() end

---Does the action of holding the right mouse button
function window.RightMouseHeld() end

---Does the action of holding the right mouse button up
function window.RightMouseHeldUp() end

---Does the action of clicking the right mouse button up
function window.RightMouseUp() end

---Selects the specified window
function window.Select() end

---@diagnostic disable: duplicate-set-field
---Get the text for the Nth item in a list box. Only works on list boxes. Use of y is optional and allows selection of the column of the window to get text from.
---@param nthItem integer
---@param column? integer
---@return string
function window.List(nthItem, column) end

---Find an item in a list box by partial match (use window.List[=text] for exact). Only works on list boxes. Use of y is optional and allows selection of the column of the window to search in.
---@param text string
---@param column? integer
---@return integer
function window.List(text, column) end
---@diagnostic enable: duplicate-set-field