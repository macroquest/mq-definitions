---@meta

--- AdvPath Lua Bindings
---@class TLO.AdvPath
---@field public Active MQBoolean # Plugin Loaded and ready
---@field public Fleeing MQBoolean
---@field public Following MQBoolean # Following spawn
---@field public Paused MQBoolean
---@field public Playing MQBoolean
---@field public Pulling MQBoolean
---@field public Recording MQBoolean
---@field public WaitingWarp MQBoolean
---@field public Length MQFloat #  Estimated length off the follow path
---@field public CustomPaths MQInt # Gives a count filtered by CustomSearch
---@field public Idle MQInt # Idle time when following and not moving
---@field public NextWaypoint MQInt # Number of NextWayPoint
---@field public State MQInt # FollowState, 0 = off, 1 = Following, 2 = Playing, 3 = Recording
---@field public Status MQInt # Status 0 = off , 1 = on , 2 = paused
---@field public Waypoints MQInt # Total Number of Waypoints
---@field public Monitor MQSpawn # spawn you are following
---@field public CheckPoint MQString # Checkpoint name
---@field public CustomSearch MQString # contains value used for filtering CustomPaths and /play listcustom
---@field public Direction MQString # N/R, Normal or Reverse
---@field public Flag1 MQString # Can access flags 1 through 9
---@field public Flag2 MQString # Can access flags 1 through 9
---@field public Flag3 MQString # Can access flags 1 through 9
---@field public Flag4 MQString # Can access flags 1 through 9
---@field public Flag5 MQString # Can access flags 1 through 9
---@field public Flag6 MQString # Can access flags 1 through 9
---@field public Flag7 MQString # Can access flags 1 through 9
---@field public Flag8 MQString # Can access flags 1 through 9
---@field public Flag9 MQString # Can access flags 1 through 9
---@field public Path MQString # Returns closest path
TLO.AdvPath = {}

---@param name string # Checkpoint name
---@return string # returns LOC
function TLO.AdvPath.X(name) end

---@param waypoint integer # Waypoint number
---@return string # Checkpoint name
function TLO.AdvPath.X(waypoint) end

---@param name string # Checkpoint name
---@return string # returns LOC
function TLO.AdvPath.Y(name) end

---@param waypoint integer # Waypoint number
---@return string # Checkpoint name
function TLO.AdvPath.Y(waypoint) end

---@param name string # Checkpoint name
---@return string # returns LOC
function TLO.AdvPath.Z(name) end

---@param waypoint integer # Waypoint number
---@return string # Checkpoint name
function TLO.AdvPath.Z(waypoint) end
