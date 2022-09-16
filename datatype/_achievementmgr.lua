---@meta
---@class achievementmgr
---@field AchievementByIndex fun(index:integer):achievement Find an achievement by its index
---@field AchievementCount fun():integer The number of achievements in the mananger
---@field CategoryByIndex fun(index:integer):achievementcat Find an achievement category by its index
---@field CategoryCount fun():integer The number of achievement categories in the mananger
---@field Points fun():integer The total number of accumulated achievement points
---@field CompletedAchievements fun():integer The number of completed achievements
---@field TotalAchievements fun():integer The number of available achievements
---@field Ready MQBoolean #Indicates that the manager has loaded all achievement data is ready to be used
achievementmgr = {}

---Find an achievement by its ID
---@param id integer
---@return achievement
function achievementmgr.Achievement(id) end

---Find an achievement by its Name
---@param name string
---@return achievement
function achievementmgr.Achievement(name) end

---Find an achievement category by its ID
---@param id integer
---@return achievementcat
function achievementmgr.Category(id) end

---Find an achivement category by its Name.
---Note: Using this method, only top-level categories are returned from the achievement manager
---@param name string
---@return achievementcat
function achievementmgr.Category(name) end
