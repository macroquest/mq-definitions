---@meta

---@class menu : window
---@field public NumVisibleMenus MQInt # Number of currently visible menus (ordinarily 1 if a menu is showing, 0 if not)
---@field public CurrMenu MQInt # Index for the currently visible menu (ordinarily 0 if a menu is open, -1 if not)
---@field public Name MQString # Name of the menu or the first item's name
---@field public NumItems MQInt # Number of items in the currently open menu
local menu = {}

--- Returns the item name specified by index
---@param index integer
---@return string
function menu.Items(index) end

--- Clicks a menu item
---@param itemName string
function menu.Select(itemName) end
