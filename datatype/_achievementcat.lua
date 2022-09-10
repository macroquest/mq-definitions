---@meta
---@class achievementcat
---@field ID fun():integer The unique ID for the category
---@field Name fun():string The category's display name
---@field Description fun():string The category's Description
---@field AchivementByIndex fun(index:integer):achievement Find an achievement by its index in this category
---@field AchivementCount fun():integer The number of achievements in this category
---@field CategoryByIndex fun(index:integer):integer Find a child category by its index in this category
---@field CategoryCount fun():integer The number of child categories in this category
---@field Points fun():integer The total earned points of achievements in this category
---@field CompletedAchievements fun():integer The number of achievements earned in this category and its subcategories
---@field TotalAchievements fun():integer The total number of achievements in this category and its subcategories
---@field ImageTextureName fun():string Name of the image texure that is used to represent this category in the Achievements Window
---@field Index fun():integer The index of the category in the achievement manager.  For more information see [Achievement Indices](https://docs.macroquest.org/reference/top-level-objects/tlo-achievement/#note-about-achievement-indices)
achievementcat = {}

---Find an achievement in this category by its ID
---@param id integer
---@return achievement
function achievementcat.Achievement(id) end

---Find an achievement in this category by its Name
---@param name string
---@return achievement
function achievementcat.Achievement(name) end

---Find a child category by its ID
---@param id integer
---@return achievementcat
function achievementcat.Category(id) end

---Find a child category by its Name
---@param name string
---@return achievementcat
function achievementcat.Category(name) end