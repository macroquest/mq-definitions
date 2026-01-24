---@meta

--- EQBC Lua Bindings
---@class TLO.EQBC
---@field Connected MQBoolean #Client connection status
---@field Names MQString #List of connected characters (space delmited)
---@field Port MQString #OFFLINE if not connected, port if connected
---@field Server MQString #Hostname or IP of server you connected to
---@field ToonName MQString #Character name as seen by EQBC \(may reflect YouPlayer\)
TLO.EQBC = {}

---#Option enabled/disabled status. \(see **/bccmd set** for complete list\)
---@param name string e.g. "localecho"
function TLO.EQBC.Setting(name) end
