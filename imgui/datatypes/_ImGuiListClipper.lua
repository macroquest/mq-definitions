---@meta

---@class ImGuiListClipper
---@field public DisplayStart number
---@field public DisplayEnd number
ImGuiListClipper = {}

---@param itemsCount number
---@param itemsHeight? number
function ImGuiListClipper:Begin(itemsCount, itemsHeight) end

function ImGuiListClipper:End() end

---@return boolean
function ImGuiListClipper:Step() end

---@return ImGuiListClipper
function ImGuiListClipper.new() end
