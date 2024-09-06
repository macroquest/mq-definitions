---@meta

---@enum LinkTypes
mq.LinkTypes = {
    Item = 0,
    Player = 1,
    Spam = 2,
    Achievement = 3,
    Dialog = 4,
    Command = 5,
    Spell = 6,
    Faction = 7,
    Invalid = -1,
}


---@class TextTagInfo
---@field type LinkTypes
---@field link string
---@field text string
local TextTagInfo = {}


---@class DialogLinkInfo
---@field keyword string
---@field text string
local DialogLinkInfo = {}


---@class ItemLinkInfo
---@field itemID integer
---@field sockets integer[]
---@field socketLuck integer[]
---@field isEvolving boolean
---@field evolutionGroup integer
---@field evolutionLevel integer
---@field ornamentationIconID integer
---@field luck integer
---@field itemHash integer
---@field itemName string
local ItemLinkInfo = {}

---@return boolean
function ItemLinkInfo:IsSocketed() end


---@class SpellLinkInfo
---@field spellID integer
---@field spellName string
local SpellLinkInfo = {}


--- Extracts all links from the given string, returning them in an array
---@param line string The text line to extract links from
---@return TextTagInfo[]
function mq.ExtractLinks(line) end

--- Executes a link as if it has been clicked by the user
---@param link TextTagInfo
function mq.ExecuteTextLink(link) end

--- Format an achievement into an achievement link
---@param achievement achievement
---@param playerName string
---@return string
function mq.FormatAchievementLink(achievement, playerName) end

--- Format text into a dialog link
---@param keyword string
---@param text string
---@return string
function mq.FormatDialogLink(keyword, text) end

--- Format an item into an item link
---@param item item
---@return string
function mq.FormatItemLink(item) end

--- Format a spell into a spell link
---@param spell spell
---@param nameOverride? string Optional override for the spell name
---@return string
function mq.FormatSpellLink(spell, nameOverride) end

--- Parse a dialog link from a line of text
---@param line string
---@return DialogLinkInfo
function mq.ParseDialogLink(line) end

--- Parse an item link from a line of text
---@param line string
---@return ItemLinkInfo
function mq.ParseItemLink(line) end

--- Parse a spell link from a line of text
---@param line string
---@return SpellLinkInfo
function mq.ParseSpellLink(line) end

--- Strip links from a line of text
---@param line string
---@return string
function mq.StripTextLinks(line) end
