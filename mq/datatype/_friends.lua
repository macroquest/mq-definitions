---@meta

---@class friends
---@field public ToString MQString # Number of friends on your friends list
local friends = nil

---@diagnostic disable: duplicate-set-field
---@param name string
---@return boolean
function friends.Friend(name) end

---@param index integer|string
---@return string # Returns the name of friend list member at [index]
function friends.Friend(index) end
---@diagnostic enable: duplicate-set-field
