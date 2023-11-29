---@meta ImGui

--
-- MQ Additions to ImGui
--

-- Register a callback with the ImGui subsystem to be called every frame
---@param name string
---@param render fun()
function ImGui.Register(name, render) end

-- Unregister a call back with the ImGui subsystem. The named callback will no longer
-- be called every frame
---@param name string
function ImGui.Unregister(name) end

-- Draw an EverQuest CTextureAnimation
---@param texture CTextureAnimation
---@param width? number
---@param height? number
---@param drawBorder? bool
function ImGui.DrawTextureAnimation(texture, width, height, drawBorder) end
---@param texture CTextureAnimation
---@param size? ImVec2
---@param drawBorder? bool
function ImGui.DrawTextureAnimation(texture, size, drawBorder) end

-- Draw a help marker with tooltip text
---@param text string
---@param width? number
---@param font? ImFont
function ImGui.HelpMarker(text, width, font) end


--
-- MQ Console Widget
--

---A console widget which displays a console buffer of colored text in a scrollable
---view. The Render function may only be called from an ImGui update function. It is
---safe to call any other function from anywhere in the script.
---@class ConsoleWidget
---Controls autoscroll. If autoscroll is enabled, then
---the view will stick to the end if it is already scrolled to the end.
---@field public autoScroll boolean
---Sets/Gets the maximum number of lines held in the console buffer.
---@field public maxBufferLines number
ImGui.ConsoleWidget = {}

---Creates a new console widget. `id` is a standard ImGui id and shoudl be unique for
---the current scope. This `id` will be given to a Child frame (via `BeginChild`) and so
---it can be styled similarly.
---@param id string Id of the console widget
---@return ConsoleWidget
function ImGui.ConsoleWidget.new(id) end

---Render the console widget.
---
---`displaySize`: The default value is 0, 0. This will cause the widget to fill all
---available space. Specifying a non-zero height or width will limit the size of the
---widget in that dimension.
---
---This function should only be called from an ImGui update callback.
---@param displaySize? ImVec2 Size of the console widget.
function ImGui.ConsoleWidget:Render(displaySize) end

---Clears the console buffer.
function ImGui.ConsoleWidget:Clear() end

---Returns true if the console is scrolled to the bottom of the buffer.
---@return boolean
function ImGui.ConsoleWidget:IsCursorAtEnd() end

---Scrolls the view to the bottom of the buffer during the next render call.
function ImGui.ConsoleWidget:ScrollToBottom() end

---Append a line of text to the buffer using the default color.
---@param text string text string to append to the console buffer.
function ImGui.ConsoleWidget:AppendText(text) end

---Append a line of text to the buffer using a format string and the default color.
---Follows the same pattern of behavior as string.format.
---@param format string Format string to append to the console buffer.
---@vararg any
function ImGui.ConsoleWidget:AppendText(format, ...) end

---Append a line of colored text to the buffer.
---@param color ImVec4|ImU32 The default color of the text.
---@param text string text string to append to the console buffer.
function ImGui.ConsoleWidget.AppendText(color, text) end

---Append a line of colored, formatted text to the buffer.
---@param color ImVec4|ImU32 The default color of the text.
---@param format string Format string to append to the console buffer
---@vararg any
function ImGui.ConsoleWidget:AppendText(color, format, ...) end

---Append unformatted text to the buffer. The line is not terminated, so multiple
---calls will continue on the same line.
---@param text string Text string to append to the buffer.
function ImGui.ConsoleWidget.AppendTextUnformatted(text) end

---Append unformatted text to the buffer. The line is not terminated, so multiple
---calls will continue on the same line.
---@param color ImVec4|ImU32 Optional: The default color of the text.
---@param text string Text string to append to the buffer.
function ImGui.ConsoleWidget.AppendTextUnformatted(color, text) end
