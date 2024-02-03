---@meta

---@class social # This datatype accesses you EQ Social Buttons
---@field Name string # The Label of the Social
---@field TimerBegin integer # Timer Begin of the Social
---@field TimerEnd integer # Timer End of the Social
---@field Color integer # Social Color code index
local social = {}

---@param index integer # 0-4 index of the cmd line you want
---@return MQString
function social.Cmd(index) end
