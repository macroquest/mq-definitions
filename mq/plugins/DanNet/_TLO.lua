---@meta

--- DanNet Lua Bindings
---@class TLO.DanNet
---@field Name MQString # Current node name (fully qualified)
---@field Version MQString # Current build version
---@field Debug MQBoolean # Debugging flag
---@field LocalEcho MQBoolean # Local echo flag (outgoing echo)
---@field CommandEcho MQBoolean # Command echo (incoming commands)
---@field FullNames MQBoolean # Print fully qualified names?
---@field FrontDelim MQBoolean # Use a front | in arrays?
---@field Timeout MQString # Timeout for implicit delay in /dquery and /dobserve commands
---@field ObserveDelay MQInt # Delay between observe broadcasts (in ms)
---@field Evasive MQInt # Time to classify a peer as evasive (in ms)
---@field EvasiveRefresh MQBoolean
---@field Expired MQInt # Keepalive time for non-responding peers (in ms)
---@field Keepalive MQInt # Keepalive time for local actor pipe (in ms)
---@field PeerCount MQInt # Number of connected peers
---@field Peers MQString # List of connected peers
---@field GroupCount MQInt # Number of all groups
---@field Groups MQString # List of all groups
---@field JoinedCount MQInt # Number of joined groups
---@field Joined MQString # List of joined groups
TLO.DanNet = {}

---@param peerName string
---@return peer|fun(): string|nil
function TLO.DanNet(peerName) end

---@diagnostic disable: redundant-parameter
---@param groupName string
---@return string # all peers in the [groupName] group
function TLO.DanNet.Peers(groupName) end

---@diagnostic enable: redundant-parameter



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
