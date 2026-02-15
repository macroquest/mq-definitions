---@meta

--- Returns name of the indicated option if available; else NULL
--- Must specify reward, option, and item, e.g. ${Rewards.Reward[<#/name>].Item[#/name].Text}
---@class RewardOptionItem
---@field Text MQString # Returns name of the indicated option if available; else NULL
RewardOptionItem = nil

--- Returns information on reward options
--- Must specify reward and option, e.g. Rewards.Reward[1].Option[1].Text
---@class RewardOption
---@field Text MQString # Returns name of the indicated option if available; else NULL
---@field Selected MQBoolean # Returns TRUE if the indicated option is available and selected; otherwise FALSE
---@field Select MQBoolean # Selects the specified option. TRUE if available and able to select; otherwise FALSE
---@field ItemCount MQInt # Returns number of items (right-side list) for the specified reward and selected option if available. Otherwise NULL
RewardOption = nil

--- Returns the appropriate item by index or name; else returns NULL
---@param indexOrName integer|string
---@return RewardOptionItem
function RewardOption.Item(indexOrName) end

--- Gives information about the specified reward, including number of options, items, and availability
--- Must specify reward, e.g. Rewards.Reward[1].Text
---@class RewardItem
---@field Text MQString # Returns name of the indicated reward if available; else NULL
---@field Selected MQBoolean # Returns TRUE if indicated reward is available and selected; else FALSE
---@field Select MQBoolean # Selects the specified reward. TRUE if available and able to select; otherwise FALSE
---@field Claim MQBoolean # Claims the specified reward if available and option (if any) selected. TRUE if able to claim; otherwise FALSE
---@field Options MQInt # Returns number of options for the specified reward if available. Otherwise NULL
---@field Items MQInt # Returns number of items (right-side list) for the specified reward and selected option if available. Otherwise NULL
RewardItem = nil

--- Returns the appropriate option by index or name; else returns NULL
---@param indexOrName integer|string
---@return RewardOption
function RewardItem.Option(indexOrName) end

--- Returns the appropriate item by index or name; else returns NULL
---@param indexOrName integer|string
---@return RewardOptionItem
function RewardItem.Item(indexOrName) end

--- Information on the number of rewards, and their index or name
---@class Rewards
---@field Count MQInt # Returns number of currently pending rewards
Rewards = nil

--- Returns the reward by specified index
---@param index integer
---@return RewardItem
function Rewards.Reward(index) end

--- Returns the reward by name
---@param name string
---@return RewardItem
function Rewards.Reward(name) end
