---@meta

---@class Mq
---@field public TLO TLO # Top Level Object (TLO) Binding
---@field public imgui IMGUI # sol2 ImGui Binding
mq = {}

---Performs an ingame slash action provided as a string. Any arguments passed to it are stringified (in lua), concatenated (with a space delimiter), and sent as part of the command.
---@vararg string # An in-game slash command (including the slash) (e.g. '/keypress DUCK')
function mq.cmd(...) end

---Simular to mq.cmd() but provides C/C++ string formatting
---@param command string # An in-game slash command (including the slash) (e.g. '/keypress %s')
---@param ...? any # Variables that provide input the formated string
function mq.cmdf(command, ...) end

---Provides a Timing delay
---@param delayValue number|string # A number (milliseconds) or string ending in s, m, or ms (e.g. '2s' or '1m')
---@param condition? function # An optional condition that can end the delay early with a return of true
function mq.delay(delayValue, condition) end

---Joins a number of string-convertable parameters into a single string
---@vararg string
---@return string
function mq.join(...) end

---Force exits the script, ignoring the normal Lua return flow
function mq.exit() end

---Binds a command to an in-game slash prompt
---@param command string # The command including the slash.  '/healme'
---@param callback function # The Lua function to call when the command is entered in-game
function mq.bind(command, callback) end

---Unbinds a previously assigned function from a command
---@param command string e.g /burn
function mq.unbind(command) end

---Creates an event that will execute a Lua function when the provided matcher text is seen in game
---Note: this needs to be paried with #doevents() to actually process the events during the script execution.
---@param name string Name of the Event
---@param matcherText string # This needs an example and reference
---@param callback function # Function to call when text is matched
function mq.event(name, matcherText, callback) end

---Unregisters the event by name so that it will no longer react
---@param name string # Name of the Event
function mq.unevent(name) end

---Process queued events
---@param name? string # Optional name of a single Event to process
function mq.doevents(name) end

---Flush events
---@param name? string # Optional name of a single Event to flush
function mq.flushevents(name) end

---Returns all spawns
---@return spawn[] # The spawns
function mq.getAllSpawns() end

---Returns all spawns by predicate.
---@param predicate fun(spawn: spawn): bool # The filter predicate
---@return spawn[] # The spawns
function mq.getFilteredSpawns(predicate) end

---@param type any # The variable we want to check type of
---@return mqtype
function mq.gettype(type) end

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
---@param name string # The name of the callback
---@param callback function # The callback function
function mq.imgui.init(name, callback) end

---Does a a registered ImGui callback exist?
---@param name string # The name of registered callback
---@return boolean
function mq.imgui.exists(name) end

---Destroy a registered ImGui callback.
---@param name string # The name of registered callback
function mq.imgui.destroy(name) end

---MQ2 Top Level Object Accssor
---@class TLO
---@field Achievement Achievement
---@field AdvLoot AdvLoot
---@field Alias fun(name:string):boolean # True if alias exists
---@field AltAbility altability
---@field Bandoliler fun(name:string) bandolier
---@field Corpse corpse|fun():corpse|nil # Corpse you are looting
---@field Cursor MQItem
---@field DisplayItem fun(): MQItem # Access to all the information in the Item Display window
---@field DoorTarget MQSpawn # Information on your doortarget
---@field DynamicZone dynamiczone
---@field Event any
---@field EverQuest everquest # Access information about the current Everquest session
---@field Familiar any
---@field Float float
---@field FPS userdata
---@field FrameLimiter framelimiter
---@field Friends userdata
---@field GameTime time
---@field Ground ground # References the ground spawn item you have targeted.
---@field Group group
---@field GroupLeader any
---@field GroupLeaderName any
---@field If any
---@field Illusion any
---@field Ini any
---@field Int any
---@field InvSlot any
---@field Irc any
---@field ItemTarget ground # Gives access to the ground item that is previously targeted using /itemtarget.
---@field LastSpawn any
---@field LineOfSight fun(query: string):boolean # Query is a string with the syntax of "y,x,z:y2,x2,z2"
---@field Lua Lua
---@field Macro Macro
---@field MacroQuest macroquest
---@field Math math
---@field Me MQCharacter
---@field Menu any
---@field Mercenary mercenary
---@field Merchant MQMerchant # Interacts with the currently active merchant
---@field Mount keyring
---@field Pet pet
---@field PointMerchant any
---@field Raid raid
---@field Range range
---@field Select fun(target: string, ...): integer # Finds number of matches in [target]
---@field SelectedItem item # Returns information on the object that is selected in your own inventory while using a merchant.
---@field String any
---@field SubDefined any
---@field Switch switch
---@field SwitchTarget any
---@field Target MQTarget
---@field Task fun(index?: integer): task|nil # Returns the first task, or the current shared task if one exists.
---@field Time time
---@field Type  fun(type: string): mqtype # Information on data types
---@field Window fun(name: string): MQWindow # Information on a particular UI window
TLO = {}

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

---@param index integer
---@param filter string
---@return MQSpawn
---@overload fun(filter: string): MQSpawn
function TLO.NearestSpawn(index, filter)end

---Finds an Item by the item ID
---@param id integer
---@return MQItem
function mq.TLO.FindItem(id)end

---Finds an Item by the partial item Name (use of '=' infront of name forces exact match)
---@param name string
---@return MQItem
function mq.TLO.FindItem(name)end

---Finds an Item in the bank by the item ID
---@param id integer
---@return MQItem
function mq.TLO.FindItemBank(id)end

---Finds an Item in the bank by the partial item Name (use of '=' infront of name forces exact match)
---@param name string
---@return MQItem
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

---@diagnostic disable: duplicate-set-field
----Creates a heading object using degrees (clockwise)
---@param degrees integer # Degrees (clockwise)
---@return heading
function TLO.Heading(degrees) end

----Creates a heading object using the heading to this y,x location
---@param y integer # Y location
---@param x integer # X location
---@return heading
function TLO.Heading(y, x) end

----Creates a heading object using the heading to this north,west location
---@param north integer # North location
---@param west integer # West location
---@return heading
function TLO.Heading(north, west) end
---@diagnostic enable: duplicate-set-field

---Returns a Plugin by index, starting with 1 and stopping whenever the list runs out of plugins.
---@param index integer
---@return plugin
function mq.TLO.Plugin(index)end

----Returns a Plugin by Name
---@param name string
---@return plugin
function mq.TLO.Plugin(name)end

---Returns a Spawn by ID
---@param id integer
---@return MQSpawn
function mq.TLO.Spawn(id)end

----Returns a Spawn by use of a [Spawn Search](https://docs.macroquest.org/reference/general/spawn-search/) filter
---@param filter string
---@return MQSpawn
function mq.TLO.Spawn(filter)end

---Number of items on the ground in this zone (filter is optional)
---@param filter string
---@return integer
function mq.TLO.GroundItemCount(filter)end

---Retrieves the item in your mount keyring by index
---@param index integer
---@return keyringitem
function mq.TLO.Mount(index) end

---Retrieves the item in your mount keyring by name.  A = can be prepended for an exact name match.
---@param name string
---@return keyringitem
function mq.TLO.Mount(name) end

----Returns a count of Spawns by use of a [Spawn Search](https://docs.macroquest.org/reference/general/spawn-search/) filter
---@param filter string
---@return integer
function mq.TLO.SpawnCount(filter)end

---Returns a Spell by ID
---@param id integer
---@return MQSpell
function mq.TLO.Spell(id)end

----Returns a Spell by Name
---@param name string
---@return MQSpell
function mq.TLO.Spell(name)end

---Returns a Skill by number
---@param number integer
---@return skill
function mq.TLO.Skill(number)end

----Returns a Skill by Name
---@param name string
---@return skill
function mq.TLO.Skill(name)end

----The current zone information
---@type zone
TLO.Zone = nil

---@diagnostic disable: duplicate-set-field
---@diagnostic disable: assign-type-mismatch
----Retrieves information about a zone by zone ID. If this zone is the current zone, then this will return currentzone.
---@param id integer Zone ID
---@return MQZone
function TLO.Zone(id) end

----Retrieves information about a zone by short name. If this zone is the current zone, then this will return currentzone.
---@param shortName string Zone Short Name
---@return MQZone
function TLO.Zone(shortName) end
---@diagnostic enable: assign-type-mismatch
---@diagnostic enable: duplicate-set-field

return mq