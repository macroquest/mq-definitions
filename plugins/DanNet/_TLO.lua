---@meta

--- DanNet Lua Bindings
---@class TLO.DanNet
---@field Name fun(): string # Current node name (fully qualified)
---@field Version fun(): string # Current build version
---@field Debug fun(): string # Debugging flag
---@field LocalEcho fun(): string # Local echo flag (outgoing echo)
---@field CommandEcho fun(): string # Command echo (incoming commands)
---@field FullNames fun(): string # Print fully qualified names?
---@field FrontDelim fun(): string # Use a front | in arrays?
---@field Timeout fun(): string # Timeout for implicit delay in /dquery and /dobserve commands
---@field ObserveDelay fun(): string # Delay between observe broadcasts (in ms)
---@field Evasive fun(): string # Time to classify a peer as evasive (in ms)
---@field Expired fun(): string # Keepalive time for non-responding peers (in ms)
---@field Keepalive fun(): string # Keepalive time for local actor pipe (in ms)
---@field PeerCount fun(): string # Number of connected peers
---@field Peers fun(): string # List of connected peers
---@field GroupCount fun(): string # Number of all groups
---@field Groups fun(): string # List of all groups
---@field JoinedCount fun(): string # Number of joined groups
---@field Joined fun(): string # List of joined groups
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