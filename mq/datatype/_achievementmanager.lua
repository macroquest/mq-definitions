---@meta

---@class achievementmgr
---@field AchievementByIndex fun(index:integer|string):achievement Find an achievement by its index
---@field AchievementCount MQInt #The number of achievements in the mananger
---@field CategoryByIndex fun(index:integer|string):achievementcat Find an achievement category by its index
---@field CategoryCount MQInt #The number of achievement categories in the mananger
---@field Points MQInt #The total number of accumulated achievement points
---@field CompletedAchievements MQInt #The number of completed achievements
---@field TotalAchievements MQInt #The number of available achievements
---@field Ready MQBoolean #Indicates that the manager has loaded all achievement data is ready to be used
achievementmgr = {}

---Find an achievement by its ID
---@param id integer|string
---@return achievement
function achievementmgr.Achievement(id) end

---Find an achievement by its Name
---@param name string
---@return achievement
function achievementmgr.Achievement(name) end

---Find an achievement category by its ID
---@param id integer|string
---@return achievementcat
function achievementmgr.Category(id) end

---Find an achivement category by its Name.
---Note: Using this method, only top-level categories are returned from the achievement manager
---@param name string
---@return achievementcat
function achievementmgr.Category(name) end
