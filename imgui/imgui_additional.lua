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
---@param drawBorder? boolean
function ImGui.DrawTextureAnimation(texture, width, height, drawBorder) end

---@param texture CTextureAnimation
---@param size? ImVec2
---@param drawBorder? boolean
function ImGui.DrawTextureAnimation(texture, size, drawBorder) end

-- Get an EQ font as an imgui ImFont
---@param fontStyle number EQ font style (0-10)
---@return ImFont|nil font The font or nil
function ImGui.GetEQImFont(fontStyle) end

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
---Sets/Gets the the opacity of the console.
---@field public opacity number
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


--
-- Stencil Masking
--

---@enum AlphaMaskOp
AlphaMaskOp = {
    Intersect         = 0,  -- Visible inside ALL layers
    Union             = 1,  -- Visible inside ANY layer (default)
    Subtract          = 2,  -- Inside prevrious layers,  NOT the last
    Complement        = 3,  -- Outside ALL layers
}

-- Begins a new mask layer. Each call auto-assigns the next available stencil bit
-- (up to 8 per session). Draw mask image(s) after this call using AddImage or
-- other draw calls - only texels with alpha >= 0.5 write to the stencil.
-- Call up to 8 times before BeginMaskedDraw.
function ImDrawList:CreateMaskLayer() end

-- Commits all mask layers and begins the masked drawing scope. The given `op` controls
-- how multiple layers are combined. All draw calls between here and EndMaskedDraw are
-- clipped to the combined mask shape.
---@param op? AlphaMaskOp the op use to combine layers. Default us AlphaMaskOp.Union.
function ImDrawList:BeginMaskedDraw(op) end

-- Ends the masked drawing scope and restore default render state.
-- Stencil bits are reclaimed automatically at next frame star.t
function ImDrawList:EndMaskedDraw() end


--
-- Coverage Masking
--

-- Begins a coverage mask for the given screen region. Pushes a clip rect,
-- clears framebuffer alpha to 0 inside the region, and switches to alpha-write
-- mode. Draw the mask texture(s) after this call.
---@param p_min ImVec2 Clipoing rect minimum point
---@param p_max ImVec2 Clipping rect maximum point
function ImDrawList:CreateCoverageMaskLayer(p_min, p_max) end

-- Commits the mask and begins the coverage-masked drawing scope. Draw calls issued
-- between here and EndAlphaMaskedDraw are blended using the framebuffer alpha
-- written by the mask textures as per-pixel coverage.
function ImDrawList:BeginCoverageMaskedDraw() end

-- Ends the coverage-masked drawing scope, restores the default blend state, and
-- pops the clip rect pushed by CreateCoverageMaskLayer.
function ImDrawList:EndCoverageMaskedDraw() end


--
-- Nine-slice drawing
--

---@class NineSliceImageParams
---@field p_min ImVec2 pixel coordinates of the upper left corner of the image
---@field p_max ImVec2 pixel coordinates of the lower right corner of the image
---@field uv_min ImVec2 texture coordinates of the upper left corner of the image (0.0-1.0)
---@field uv_max ImVec2 texture coordinates of the lower right corner of the image (0.0-1.0)
---@field p_margins ImVec4 pixel sizes of the margins for cutting the image (left, top, right, bottom)
---@field uv_margins ImVec4 texel sizes of the margins for cutting the image (left, top, right, bottom) (0.0-1.0)
---@field texture_size ImVec2 size of the texture containing the image
NineSliceImageParams = {}

-- Create a NineSliceImageParams using texture coordinates
---@param texture_size ImVec2 Full size of the texture that contains the image being drawn.
---@param p_margins ImVec4 Pixel sizes of the margins from each edge used to slice the image in order (left, top, right, bottom).
---@param uv_min? ImVec2 The upper left corner of the image to draw in texture coordinates (defaults to upper left: 0.0)
---@param uv_max? ImVec2 The lower right corner of the image to draw in texture coordinates (defaults to full texture: 1.0)
function NineSliceImageParams.WithTextureCoords(texture_size, p_margins, uv_min, uv_max) end

-- Create a NineSliceImageParams using pixel coordinates
---@param texture_size ImVec2 Full size of the texture that contains the image being drawn.
---@param p_margins ImVec4 Pixel sizes of the margins from each edge used to slice the image in order (left, top, right, bottom).
---@param p_min? ImVec2 The upper left corner of the image to draw in pixels (defaults to upper left: 0.0)
---@param p_max? ImVec2 The lower right corner of the image to draw in pixels (defaults to full texture: -1.0)
function NineSliceImageParams.WithPixelCoords(texture_size, p_margins, p_min, p_max) end
