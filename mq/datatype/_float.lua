---@class float
---@field public Deci MQString The number as a string with one place of precision, i.e. ###.#
---@field public Centi MQString The number as a string with two places of precision, i.e. ###.##
---@field public Int MQInt Integer portion of the number truncated rather than rounded, e.g. 12.779 returns 12
---@field public Milli MQString The number as a string with three places of precision, i.e. ###.###
---@field public Precision MQString The number as a string with # places of precision
---@field public Raw MQInt The float pointer
local float = nil


---@param precision integer
---@return MQString The number as a string formatted with '%lld'
function float.Sharing(precision) end
