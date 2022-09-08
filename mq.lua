--- Macroquest Lua Binding
--- @class Mq
--- @field public TLO TLO Top Level Object (TLO) Binding
--- @field public cmd CMD Command Binding
--- @field public cmdf CMD Command Binding
--- @field public imgui IMGUI sol2 ImGui Binding
local mq = {}

---Base MQ Functions

---Timing delay.
---@param delayValue number|string A number or string ending in s, m, or ms (seconds, minutes, milliseconds).
---@param cancelCallback? fun(): boolean an optional lua function which evaluates to true or false to decide whether to end the delay early
function mq.delay(delayValue, cancelCallback) end

---Joins a number of string-convertable parameters into a single string
---@vararg ...
---@return string
function mq.join(...) end

---Force Exits the Script, ignoring the normal Lua return flow.
function mq.exit() end

---Binds a command to an in-game slash prompt.
---@param command string The command including the slash.  '/healme'
---@param callback function The Lua function to call when the command is entered in-game
function mq.bind(command, callback) end

---Unbinds a previously assigned function from a command.
---@param command string e.g /burn
function mq.unbind(command) end

---Creates an event that will execute a Lua function when the provided matcher text is seen in game.
---
---Note: this needs to be paried with #doevents() to actually process the events during the script execution.
---@param name string Name of the Event
---@param matcherText string This needs an example and reference
---@param callback function Function to call when text is matched
function mq.event(name, matcherText, callback) end

---Unregisters the event by name so that it will not longer react.
---@param name string Name of the Event
function mq.unevent(name) end

---Process queued events.
---@param name? string Name of the Event to do
function mq.doevents(name) end

---Flush events.
---@param name? string Name of the Event to flush
function mq.flushevents(name) end

---Returns all spawns.
---@return spawn[] The spawns
function mq.getAllSpawns() end

---Returns all spawns by predicate.
---@param predicate fun(spawn: spawn): bool The filter predicate
---@return spawn[] The spawns
function mq.getFilteredSpawns(predicate) end

-- Misc classes that are needed for completion

-- Define the action class - has no members but takes an action such as click or open in game.
--- @class action

-- Define the Invoke class - has no members but will invote the action portion of some of the new TLO additions.
--- @class Invoke

---EQ Game Command Binding
---@class CMD
---@field afk fun()
---@field alt any
---@field anon fun()
---@field autoinventory fun()
---@field cast any
---@field destroy fun()
---@field doability any
---@field echo any
---@field face fun()
---@field keypress any
---@field nav any
---@field removebuff any
---@field stand fun()
---@field target any

---Sol2 ImGui Binding
---@class IMGUI
---@field init fun(name: string, render: fun())

function mq.imgui.init(s, f) end

---MQ2 Top Level Object Accssor
---@class TLO
---@field AdvLoot AdvLoot
---@field Alert Alert
---@field Alias boolean
---@field AltAbility altability
---@field Bandoliler any
---@field Bool bool
---@field Corpse corpse
---@field Cursor any
---@field Defined any
---@field DisplayItem any
---@field DoorTarget spawn
---@field DynamicZone any
---@field Event any
---@field EverQuest any
---@field Familiar any
---@field FindItem  fun(idOrName: integer|string):item
---@field FindItemBank  fun(idOrName: integer|string):item
---@field FindItemBankCount fun(filter: string): int
---@field FindItemCount fun(filter: string): int
---@field Float float
---@field FPS any
---@field FrameLimiter any
---@field Friends any
---@field GameTime any
---@field Ground any
---@field GroundItemCount fun(filter: string): int Number of items on the ground in this zone (filter is optional).
---@field Group any
---@field GroupLeader any
---@field GroupLeaderName any
---@field Heading heading
---@field If any
---@field Illusion any
---@field Ini any
---@field Int any
---@field InvSlot any
---@field Irc any
---@field ItemTarget any
---@field LastSpawn any
---@field LineOfSight any
---@field Lua Lua
---@field Macro Macro
---@field MacroQuest macroquest
---@field Math math
---@field Me character
---@field Menu any
---@field Mercenary mercenary
---@field Merchant merchant
---@field Mount any
---@field Navigation Navigation
---@field Pet pet
---@field Plugin plugin
---@field PointMerchant any
---@field Raid raid
---@field Range any
---@field Select any
---@field SelectedItem item
---@field Skill skill
---@field Spawn fun(idOrFilter: integer|string): spawn
---@field SpawnCount fun(filter: integer|string): int
---@field Spell fun(idOrName: integer|string): spell
---@field String any
---@field SubDefined any
---@field Switch any
---@field SwitchTarget any
---@field Target target
---@field Task any
---@field Time any
---@field Type type
---@field Window window
---@field Zone zone
---@field EQBC EQBC EQBC TLO bindings
---@field NetBots NetBots|fun(name: string): netbot|"NULL" NetBots TLO bindings
---@field Twist Twist|fun(): boolean Twist TLO binding
---@field MoveUtils MoveUtils|fun(): string MoveUtils TLO binding
---@field Stick Stick|fun(): string Stick TLO binding
---@field MoveTo MoveTo|fun(): string MoveTo TLO binding
---@field MakeCamp MakeCamp|fun(): string MakeCamp TLO binding
---@field Circle Circle|fun(): string Circle TLO binding
local TLO = {}

---@param index  integer
---@param filter  string
---@return spawn
---@overload fun(filter: string): spawn
function TLO.NearestSpawn(index, filter)end