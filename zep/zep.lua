---@meta Zep

local Zep = {}

---@enum Zep.ConsoleCol
Zep.ConsoleCol = {
    Text                = 0,
    Link                = 1,
    LinkHover           = 2,
}

---@enum Zep.LineLocation
Zep.LineLocation = {
    None                = 0, -- Not any specific location
    LineFirstGraphChar  = 1, -- First non-blank character
    LineLastGraphChar   = 2, -- Last non-blank character
    LineLastNonCR       = 3, -- Last character before carraige return
    LineBegin           = 4, -- Beginning of line
    BeyondLineEnd       = 5, -- The line end of the buffer line (for wrapped lines)
    LineCRBegin         = 6, -- The first carraige return character
}

---@enum Zep.FileFlags
Zep.BufferFlags = {
    None                = 0x0000,
    WindowsLineEndings  = 0x0001, -- Buffer has windows line endings (CRLF)
    ReadOnly            = 0x0004, -- Buffer is read-only
    Locked              = 0x0008, -- Buffer is locked
    Dirty               = 0x0010, -- Buffer has been modified
    HasWarnings         = 0x0040, -- Buffer has warning markers
    HasErrors           = 0x0080, -- Buffer has error markers
    DefaultBuffer       = 0x0100, -- Buffer is the default buffer created when the editor is constructed
    InsertTabs          = 0x0800, -- Buffer is using tabs for indentation
}

---@enum Zep.WindowFlags
Zep.WindowFlags = {
    None                = 0x0000,
    ShowWhiteSpace      = 0x0001,
    ShowCR              = 0x0002,
    ShowLineNumbers     = 0x0004,
    ShowIndicators      = 0x0008,
    ShowLineBackground  = 0x0400,
    ShowWrappedLineNumbers = 0x0800,
}


-- A buffer holds the text contents that are edited in the editor. A buffer can
-- optionally be assigned a filename for Saving to disk and a buffer can also
-- be assigned a syntax for syntax highlighting.
---@class Zep.Buffer
---@field syntax string ID of the syntax provider used by this buffer
---@field name string Name of the buffer
---@field displayName string Name or filepath of the buffer used for display purposes
---@field filePath string Path to the file represented by this buffer, if any.
---@field fileExtension string Extension of the file being used to select syntax
local Buffer = {}

---Clear the buffer
function Buffer:Clear() end

---Replace the contents of the buffer with the provided string. This is
---an expensive operation and should be performed only when absolutely necessary.
---@param text string The new contents to place into the buffer
function Buffer:SetText(text) end

---Retrieves the text contents of the buffer into a string. This is an
---expensive operation and should only be performed when absolutely necessary.
---@return string
function Buffer:GetText() end

---Load the provided file into the buffer. If the path does not exist, an empty
---buffer will be loaded, and the file will be created on save.
function Buffer:Load(filePath) end

---Save the buffer to the file associated with the buffer. This action will
---fail and return false if the buffer is locked, readonly, or if the file write
---operation fails. Also returns the number of bytes written as a second return value.
---@return bool, int
function Buffer:Save() end


-- A Zep.GlyphIterator represents the location of a cursor in a buffer.
---@class Zep.GlyphIterator
---@field index integer Position of the iterator
---@field valid boolean Indicates the iterator is valid
---@operator add(integer): Zep.GlyphIterator
---@operator sub(integer): Zep.GlyphIterator
---@operator call: integer # Get the glyph at the current position
local GlyphIterator = {}

---Create a new iterator
---@param buffer? Zep.Buffer Buffer for the iterator. Iterator is not valid if no buffer is provided.
---@param index? integer Index of the iterator, or zero if not provided.
---@return Zep.GlyphIterator
function GlyphIterator.new(buffer, index) end

---Make the iterator invalid
function GlyphIterator:Invalidate() end

---Move the position of the current iterator
---@param count integer Number of characters to move the current iterator by
---@return Zep.GlyphIterator iterator The current iterator
function GlyphIterator:Move(count) end

---Move the position of the current iterator with clamping
---@param count integer Number of characters to move the current iterator by
---@param clamp? Zep.LineLocation Method to clamp the movement by. Defaults to LineLocation.LineLastNonCR
---@return Zep.GlyphIterator iterator The current iterator
function GlyphIterator:MoveClamped(count, clamp) end

---Clamp the position of the current iterator to within the boundaries of the current buffer.
---@return Zep.GlyphIterator iterator The current iterator
function GlyphIterator:Clamp() end

---Create a copy of this iterator
---@return Zep.GlyphIterator iterator The new iterator
function GlyphIterator.Copy() end

---Create a copy of this iterator and move its position by count characters.
---@param count integer Number of characters to move the new iterator by
---@return Zep.GlyphIterator iterator The new iterator
function GlyphIterator.Peek(count) end

---Create a copy of this iterator and move its position with clamping.
---@param count integer Number of characters to move the new iterator by
---@param clamp? Zep.LineLocation Method to clamp the movement by. Defaults to LineLocation.LineLastNonCR
---@return Zep.GlyphIterator iterator The new iterator
function GlyphIterator.PeekClamped(count, clamp) end

---Create a copy of this iterator and clamp it to within the boundaries of the current buffer.
---@return Zep.GlyphIterator iterator The new iterator
function GlyphIterator.Clamped() end


---A basic text editor with support for multiple buffers and syntax highlighting.
---@class Zep.Editor
---@field windowFlags Zep.WindowFlags Flags for the editor window.
---@field activeBuffer Zep.Buffer The current active buffer.
---@field buffers Zep.Buffer[] Readonly, the list of buffers created by this editor.
---@field beginPos Zep.GlyphIterator Readonly. An iterator pointing to the beginning of the active buffer.
---@field endPos Zep.GlyphIterator Readonly. An iterator pointing past the end of the active buffer.
---@field cursor Zep.GlyphIterator Current position of the cursor.
---@field cursorPos ImVec2 Current line and column of the cursor.
---@field mouseCursor Zep.GlyphIterator Current position of the mouse cursor.
local Editor = {}


---Creates a new Zep editor widget. `id` is a standard ImGui id and should be unique for
---the current scope. This `id` will be given to a Child frame (via `BeginChild`) and so
---it can be styled similarly.
---@param id? string Unique ImGui identifier for this editor. If not provided, one must be provided in the render function.
---@return Zep.Editor
function Editor.new(id) end

---Render the editor widget.
---
---`displaySize`: The default value is 0, 0. This will cause the widget to fill all
---available space. Specifying a non-zero height or width will limit the size of the
---widget in that dimension.
---
---This function should only be called from an ImGui update callback.
---@param id? string Id of this editor for ImGui.
---@param displaySize? ImVec2 Size of the widget.
function Editor:Render(id, displaySize) end

---Render the editor widget.
---
---`displaySize`: The default value is 0, 0. This will cause the widget to fill all
---available space. Specifying a non-zero height or width will limit the size of the
---widget in that dimension.
---
---This function should only be called from an ImGui update callback.
---@param displaySize? ImVec2  Size of the widget.
function Editor:Render(displaySize) end

---Initialize a new editor with a buffer created from a file. This replaces the initial buffer
---created by an empty editor and makes it the active buffer. The editor currently only supports
---calling any InitXXX function once.
---@param file string path to the file to open
---@return Zep.Buffer
function Editor:InitWithFile(file) end

---Initialize a new editor with an empty buffer and populate it with the provided string. This replaces
---the initial buffer created by an empty editor and makes it the active buffer. The editor currently
---only supports calling any InitXXX function once.
---@param name string Name of the buffer
---@param text string Text to put into the buffer
---@return Zep.Buffer
function Editor:InitWithText(name, text) end

---Create a new file buffer. The buffer will be added to the editor, but will not be made active unless it is
---assigned as the activeBuffer. If the file does not exist, an empty buffer will be created, and saving the
---buffer will attempt to create the file.
---@param file string The file to load.
function Editor:CreateFileBuffer(file) end

---Create a new empty buffer. The buffer will be added to the editor, but will not be made active unless it is
---assigned as the activeBuffer
---@param name string Name of the buffer
function Editor:CreateEmptyBuffer(name) end

---Remove the given buffer from the editor. The buffer should no longer be used after being removed.
---@param buffer Zep.Buffer
function Editor:RemoveBuffer(buffer) end

---Toggle a flag on the editor
---@param flag Zep.WindowFlags
function Editor:ToggleFlag(flag) end


---Event data provided to the event callback when a link is clicked
---@class Zep.EventCallbackLinkData
---@field button ImGuiMouseButton Mouse button used to click the link
---@field modifiers ImGuiMod Keyboard modifiers when the link was clicked
---@field data string Data associated with the link

---Identifier representing the type of event being sent
---@alias Zep.EventCallbackType
---| '"link"' # The event is a link event, see Zep.EventCallbackLinkData

---@alias Zep.EventCallbackData
---| Zep.EventCallbackLinkData

---Event callback used to receive events from the console. The value of `type` determines the structure
---of the event payload in `data`. Return `true` to indicate the event was handled. Return `false` or `nil` otherwise.
---@alias Zep.ConsoleEventCallback fun(type: Zep.EventCallbackType, data: Zep.EventCallbackData): boolean|nil

---A console widget which displays a console buffer of colored text in a scrollable
---view. The Render function may only be called from an ImGui update function. It is
---safe to call any other function from anywhere in the script.
---@class Zep.Console
---Controls autoscroll. If autoscroll is enabled, then
---the view will stick to the end if it is already scrolled to the end.
---@field public autoScroll boolean
---Sets/Gets the maximum number of lines held in the console buffer.
---@field public maxBufferLines number
---Sets/Gets the the opacity of the console.
---@field public opacity number
---Callback function used to receive events from the console
---@field public eventCallback Zep.ConsoleEventCallback
local Console = {}

---Creates a new Zep console widget. `id` is a standard ImGui id and should be unique for
---the current scope. This `id` will be given to a Child frame (via `BeginChild`) and so
---it can be styled similarly.
---@param id? string Id of the console widget
---@return Zep.Console
function Console.new(id) end

---Render the editor widget.
---
---`displaySize`: The default value is 0, 0. This will cause the widget to fill all
---available space. Specifying a non-zero height or width will limit the size of the
---widget in that dimension.
---
---This function should only be called from an ImGui update callback.
---@param id? string Id of this editor for ImGui.
---@param displaySize? ImVec2 Size of the widget.
function Console:Render(id, displaySize) end

---Render the console widget.
---
---`displaySize`: The default value is 0, 0. This will cause the widget to fill all
---available space. Specifying a non-zero height or width will limit the size of the
---widget in that dimension.
---
---This function should only be called from an ImGui update callback.
---@param displaySize? ImVec2  Size of the widget.
function Console:Render(displaySize) end

---Clears the console buffer.
function Console:Clear() end

---Returns true if the console is scrolled to the bottom of the buffer.
---@return boolean
function Console:IsCursorAtEnd() end

---Scrolls the view to the bottom of the buffer during the next render call.
function Console:ScrollToBottom() end

---Append a line of text to the buffer using the current text color.
---@param text string text string to append to the console buffer.
---@return Zep.Console
function Console:AppendText(text) end

---Append a line of text to the buffer using a format string and the current text color.
---Follows the same pattern of behavior as string.format.
---@param format string Format string to append to the console buffer.
---@vararg any
---@return Zep.Console
function Console:AppendText(format, ...) end

---Append a line of colored text to the buffer.
---@param color ImVec4|ImU32 The default color of the text.
---@param text string text string to append to the console buffer.
---@return Zep.Console
function Console.AppendText(color, text) end

---Append a line of colored, formatted text to the buffer.
---@param color ImVec4|ImU32 The default color of the text.
---@param format string Format string to append to the console buffer
---@vararg any
---@return Zep.Console
function Console:AppendText(color, format, ...) end

---Append unformatted text to the buffer. The line is not terminated, so multiple
---calls will continue on the same line.
---@param text string Text string to append to the buffer.
---@return Zep.Console
function Console.AppendTextUnformatted(text) end

---Append unformatted text to the buffer. The line is not terminated, so multiple
---calls will continue on the same line.
---@param color ImVec4|ImU32 Optional: The default color of the text.
---@param text string Text string to append to the buffer.
---@return Zep.Console
function Console.AppendTextUnformatted(color, text) end

---Append a hyperlink to the console buffer. Clicking the link will send an event through the
---`eventCallback` set on the Console with the provided data string. The color of the link can
---be modified with PushStyleColor.
---@param data string String of data to associate with the link.
---@param text string Text for the link
---@return Zep.Console
function Console:AppendHyperlink(data, text) end

---Append a hyperlink to the console buffer. Clicking the link will send an event through the
---`eventCallback` set on the Console with the provided data string. The color of the link can
---be modified with PushStyleColor.
---@param data string
---@param text string
---@vararg any
---@return Zep.Console
function Console:AppendHyperlink(data, text, ...) end

-- Modify a style color. Push a new value for the given style color index onto the stack
---@param idx Zep.ConsoleCol Style color index
---@param col ImVec4|ImU32 RGBA Color
function Console:PushStyleColor(idx, col) end

-- Modify a style color. Push a new value for the given style color index onto the stack
---@param idx Zep.ConsoleCol Style color index
---@param colR number Red
---@param colG number Green
---@param colB number Blue
---@param colA number Alpha
function Console:PushStyleColor(idx, colR, colG, colB, colA) end

-- Pop one or more style color changes off of the stack
---@param count? number Default = 1
function Console:PopStyleColor(count) end

Zep.Buffer = Buffer
Zep.Console = Console
Zep.Editor = Editor
Zep.GlyphIterator = GlyphIterator

return Zep