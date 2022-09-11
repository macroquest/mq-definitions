---@meta

---@class Mq
---@field public TLO TLO Top Level Object (TLO) Binding
---@field public imgui IMGUI sol2 ImGui Binding
mq = {}

---Performs an ingame slash action provided as a string
---@param command string An in-game slash command (including the slash) (e.g. '/keypress DUCK')
function mq.cmd(command) end

---Simular to mq.cmd() but provides C/C++ string formatting
---@param command string An in-game slash command (including the slash) (e.g. '/keypress %s')
---@param ...? any Variables that provide input the formated string
function mq.cmdf(command, ...) end

---Provides a Timing delay
---@param delayValue number|string A number (milliseconds) or string ending in s, m, or ms (e.g. '2s' or '1m')
---@param condition? function An optional condition that can end the delay early with a return of true
function mq.delay(delayValue, condition) end

---Joins a number of string-convertable parameters into a single string
---@vararg ...
---@return string
function mq.join(...) end

---Force exits the script, ignoring the normal Lua return flow
function mq.exit() end

---Binds a command to an in-game slash prompt
---@param command string The command including the slash.  '/healme'
---@param callback function The Lua function to call when the command is entered in-game
function mq.bind(command, callback) end

---Unbinds a previously assigned function from a command
---@param command string e.g /burn
function mq.unbind(command) end

---Creates an event that will execute a Lua function when the provided matcher text is seen in game
---Note: this needs to be paried with #doevents() to actually process the events during the script execution.
---@param name string Name of the Event
---@param matcherText string This needs an example and reference
---@param callback function Function to call when text is matched
function mq.event(name, matcherText, callback) end

---Unregisters the event by name so that it will no longer react
---@param name string Name of the Event
function mq.unevent(name) end

---Process queued events
---@param name? string Optional name of a single Event to process
function mq.doevents(name) end

---Flush events
---@param name? string Optional name of a single Event to flush
function mq.flushevents(name) end

---Returns all spawns
---@return spawn[] The spawns
function mq.getAllSpawns() end

---Returns all spawns by predicate.
---@param predicate fun(spawn: spawn): bool The filter predicate
---@return spawn[] The spawns
function mq.getFilteredSpawns(predicate) end

---@class Cmd
---@field afk fun()
---@field alt fun()
---@field anon fun()
---@field autoinventory fun()
---@field cast fun()
---@field destroy fun()
---@field doability fun()
---@field echo fun()
---@field face fun()
---@field keypress fun()
---@field nav fun()
---@field removebuff fun()
---@field stand fun()
---@field target fun()


---Sol2 ImGui Binding
---@class IMGUI
---@field init fun(name: string, render: fun())

---Register the ImGui Callback.  Named function that will be called on every ImGui update, 
---usually bound to one function that renders the ImGui window interface in game.
---@param name string The name of the callback
---@param callback function The callback function
function mq.imgui.init(name, callback) end

---Destroy a registered ImGui callback.
---@param name string The name of registered callback
function mq.imgui.destory(name) end

---MQ2 Top Level Object Accssor
---@class TLO
---@field Achievement Achievement
---@field AdvLoot AdvLoot
---@field Alias fun(name:string):boolean True if alias exists
---@field AltAbility altability
---@field Bandoliler any
---@field Corpse corpse|fun():corpse|nil Corpse you are looting
---@field Cursor item|fun():string|nil
---@field DisplayItem fun():item
---@field DoorTarget fun():spawn
---@field DynamicZone dynamiczone
---@field Event any
---@field EverQuest any
---@field Familiar any
---@field Float float
---@field FPS userdata
---@field FrameLimiter userdata
---@field Friends userdata
---@field GameTime any
---@field Ground any
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
local TLO = {}

---@diagnostic disable: duplicate-set-field
---Returns a pipe | separated list of alert ids
---@return string
function TLO.Alert() end

---Retreive information for the laert category by its id
---@param id integer
---@return alert
function TLO.Alert(id) end
---@diagnostic enable: duplicate-set-field

---@deprecated Use Lua types
function TLO.Bool() end

---@param index  integer
---@param filter  string
---@return spawn
---@overload fun(filter: string): spawn
function TLO.NearestSpawn(index, filter)end

---Finds an Item by the item ID
---@param id integer
---@return item
function mq.TLO.FindItem(id)end

---Finds an Item by the item Name
---@param name string
---@return item
function mq.TLO.FindItem(name)end

---Finds an Item in the bank by the item ID
---@param id integer
---@return item
function mq.TLO.FindItemBank(id)end

---Finds an Item in the bank by the item Name
---@param name string
---@return item
function mq.TLO.FindItemBank(name)end

---Return a counts of Items by the item ID
---@param id integer
---@return integer
function mq.TLO.FindItemCount(id)end

---Return a counts of Items by the item Name
---@param name string
---@return integer
function mq.TLO.FindItemCount(name)end

---Return a counts of Items in the bank by the item ID
---@param id integer
---@return integer
function mq.TLO.FindItemBankCount(id)end

---Return a counts of Items in the bank by the item Name
---@param name string
---@return integer
function mq.TLO.FindItemBankCount(name)end

---Returns a Spawn by ID
---@param id integer
---@return spawn
function mq.TLO.Spawn(id)end

----Returns a Spawn by use of a [Spawn Search](https://docs.macroquest.org/reference/general/spawn-search/) filter
---@param filter string
---@return spawn
function mq.TLO.Spawn(filter)end

---Number of items on the ground in this zone (filter is optional)
---@param filter string
---@return integer
function mq.TLO.GroundItemCount(filter)end

----Returns a count of Spawns by use of a [Spawn Search](https://docs.macroquest.org/reference/general/spawn-search/) filter
---@param filter string
---@return integer
function mq.TLO.SpawnCount(filter)end

---Returns a Spell by ID
---@param id integer
---@return spell
function mq.TLO.Spell(id)end

----Returns a Spell by Name
---@param name string
---@return spell
function mq.TLO.Spell(name)end

return mq