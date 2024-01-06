--- @class range
range = nil

----True if N is between the range of #1 and #2, inclusive.
----Is 50 between 33 and 66? ${Range.Between[33,66:50]} returns TRUE
---@param n integer|string
---@param range string
---@return boolean is n Between the range of #1 and #2 both numbers included
function range.Between(n, range) end

----True if N is within the range of #1 and #2, exclusive.
----Is 50 Inside 33 and 66? ${Range.Inside[33,66:50]} returns TRUE
---@param n integer|string
---@param range string
---@return boolean is n Inside the range of #1 and #2 both number excluded
function range.Inside(n, range) end
