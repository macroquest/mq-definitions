---@class merchant
---@field public Buy fun(num_of_items:integer) Buys # of whatever is selected with Merchant.SelectItem[xxx]
---@field public Full MQBoolean #Returns TRUE if the merchant's inventory is full
---@field public Item item Item MQFloat # on the merchant's list
---@field public Items MQFloat #Number of items on the merchant
---@field public ItemsReceived MQBoolean #True if the merchants itemlist has been filled in.
---@field public Markup MQFloat The MQFloat #used to calculate the buy and sell value for an item (this is what is changed by charisma and ffun()). This value is capped at 1.05Markup*Item Value = Amount you buy item forItem Value*(1/Markup) = Amount you sell item for
---@field public Open MQBoolean #Returns TRUE if merchant is open
---@field public OpenWindow fun() Will open the merchant closest to you, or if you have a merchant target
---@field public SelectedItem item The currently selected item in the merchant window, and item type
---@field public SelectItem fun(item:string) Select item specified or partial match that fits. Use SelectItem[=xxx] for EXACT match(its not case sensitive)
---@field public Sell fun(num_of_items:integer|string) Sell # of whatever is selected with /seletitem. See examples
---@field public ToString MQBoolean #Same as Open