---@meta

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
