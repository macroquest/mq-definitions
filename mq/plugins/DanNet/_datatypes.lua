---@class observer
---@field Received MQInt # The last received timestamp, or 0 for never received

---@class peer
peer = nil

---- Observe accessor
---@return string # List all queries that self has registered on peer
function peer.O() end

---- Observe accessor
---@return string # List all queries that self has registered on peer
function peer.Observe() end

---- Observe accessor
---@param query string
---@return string # attempt to retrieve the data specified on the remote peer
function peer.O(query) end

---- Observe accessor
---@param query string
---@return observer | fun(): string # Attempt to retrieve the data specified on the remote peer
function peer.Observe(query) end

---@return integer # Count observed data on peer
function peer.OCount() end

---@return integer # Count observed data on peer
function peer.ObserveCount() end

---@param query string
---@return boolean # Determine if query has been set as observed data on peer
function peer.OSet(query) end

---@param query string
---@return boolean # Determine if query has been set as observed data on peer
function peer.ObserveSet(query) end

---@param query string
---@return observer | fun(): string # Last executed query
function peer.Q(query) end

---@param query string
---@return observer | fun(): string # Last executed query
function peer.Query(query) end