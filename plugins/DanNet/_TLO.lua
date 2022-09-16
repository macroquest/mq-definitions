---@meta

--- DanNet Lua Bindings
---@class TLO.DanNet
---@field Name MQString ## Current node name (fully qualified)
---@field Version MQString ## Current build version
---@field Debug MQString ## Debugging flag
---@field LocalEcho MQString ## Local echo flag (outgoing echo)
---@field CommandEcho MQString ## Command echo (incoming commands)
---@field FullNames MQString ## Print fully qualified names?
---@field FrontDelim MQString ## Use a front | in arrays?
---@field Timeout MQString ## Timeout for implicit delay in /dquery and /dobserve commands
---@field ObserveDelay MQString ## Delay between observe broadcasts (in ms)
---@field Evasive MQString ## Time to classify a peer as evasive (in ms)
---@field Expired MQString ## Keepalive time for non-responding peers (in ms)
---@field Keepalive MQString ## Keepalive time for local actor pipe (in ms)
---@field PeerCount MQString ## Number of connected peers
---@field Peers MQString ## List of connected peers
---@field GroupCount MQString ## Number of all groups
---@field Groups MQString ## List of all groups
---@field JoinedCount MQString ## Number of joined groups
---@field Joined MQString ## List of joined groups
TLO.DanNet = {}

---@param peerName string 
---@return peer|fun(): string|nil
function TLO.DanNet(peerName) end

---@param groupName string 
---@return string # all peers in the [groupName] group
function TLO.DanNet.Peers(groupName) end

---- Observe accessor
---@return string # List all queries observers have registered
function TLO.DanNet.O() end

---- Observe accessor
---@return string # List all queries that self has registered on peer
function TLO.DanNet.Observe() end

---- Observe accessor
---@param query string
---@return string # Lists all peers that have registered that query as an observer on self
function TLO.DanNet.O(query) end

---- Observe accessor
---@param query string
---@return string # Lists all peers that have registered that query as an observer on self
function TLO.DanNet.Observe(query) end

---@return integer # Count observed data on self
function TLO.DanNet.OCount() end

---@return integer # Count observed data on self
function TLO.DanNet.ObserveCount() end

---@return boolean # Determine if query has been set as observed data on self
function TLO.DanNet.OSet() end

---@return boolean # Determine if query has been set as observed data on self
function TLO.DanNet.ObserveSet() end

---@return observer # Last executed query
function TLO.DanNet.Q() end

---@return observer # Last executed query
function TLO.DanNet.Query() end