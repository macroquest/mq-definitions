---@meta

--- MoveUtils Lua Bindings
---@class TLO.MoveUtils
---@field Command MQString #Returns the currently active command. MAKECAMP returns if a camp is setup but no other command is currently in use ["NONE", "STICK", "MOVETO", "MAKECAMP", "CIRCLE"]
---@field Stuck MQBoolean #Returns true if plugin stucklogic has determined you are currently stuck
---@field Summoned MQBoolean #Returns true if BreakOnSummon is enabled and has fired due to your character being summoned beyond breakonsummon distance
---@field StuckLogic MQBoolean #Returns TRUE if stucklogic is enabled
---@field Verbosity MQBoolean #Returns TRUE if verbosity is enabled
---@field FullVerbosity MQBoolean #Returns TRUE if fullverbosity is enabled
---@field TotalSilence MQBoolean #Returns TRUE if totalsilence is enabled
---@field Aggro MQBoolean #Returns TRUE if you are facing your target and your target is facing you
---@field TryToJump MQBoolean #Returns TRUE if stucklogic trytojump is enabled
---@field PauseMinDelay MQInt #Returns the min delay for mousepause and mpause to resume command in ms
---@field PauseMaxDelay MQInt #Returns the max delay for mousepause and mpause to resume command in ms
---@field PulseCheck MQInt #Returns the number of pulses used to average movement rate for stucklogic
---@field PulseUnstuck MQInt #Returns the number of pulses successfully moved forward after being stuck to be considered unstuck
---@field DistStuck MQFloat #Returns the amount of distance needed to have moved \(compared against pulse average\) or else considered stuck by stucklogic
---@field Version MQFloat #Returns the version number of the plugin
---@field MovePause MQBoolean #Returns TRUE if mpause \(PauseKB\) is enabled
---@field GM MQBoolean #Returns TRUE if BreakOnGM fired
TLO.MoveUtils = {}

--- Stick Lua Bindings
---@class Stick
---@field Status MQString #Returns ON if any form of stick is active ["OFF", "PAUSED" or "ON"]
---@field Active MQBoolean #Returns TRUE if any form of stick is active
---@field Broken MQBoolean #Returns TRUE if BreakOnHit event has halted stick prematurely
---@field Distance MQFloat #Returns current distance used by stick
---@field MoveBehind MQBoolean #Returns TRUE if stick behind is active
---@field MoveBack MQBoolean #Returns TRUE if moveback is active
---@field Loose MQBoolean #Returns TRUE if loose sticking is enabled
---@field Paused MQBoolean #Returns TRUE if plugin is paused
---@field Behind MQBoolean #Returns TRUE if currently behind target \(regardless of _/stick behind_\), false if outside of stick dist or not behind
---@field Stopped MQBoolean #Returns TRUE if stick is within stick distance
---@field Pin MQBoolean #Returns TRUE if stick pin is active
---@field StickTarget MQInt #Returns spawnid of stick target if stick id/hold used, else spawnid of current target, 0 if no target and id/hold not used
---@field StickTargetName MQString #Returns DisplayedName of stick target if stick id/hold used, else current target or NONE if no target and hold/id not used
---@field DistMod MQFloat #Returns current stickdist modifier
---@field DistModPercent MQFloat #Returns current stickdist percent modifier
---@field Always MQBoolean #Returns TRUE if /stick always is active
TLO.Stick = {}

--- MoveTo Lua Bindings
---@class TLO.MoveTo
---@field Moving MQBoolean #Returns TRUE if moveto or camp return is active
---@field Stopped MQBoolean #Returns TRUE if the last moveto command completed successfully
---@field CampStopped MQBoolean #Returns TRUE if within moveto distance of makecamp Y X location
---@field UseWalk MQBoolean #Returns TRUE if UseWalk is enabled
---@field ArrivalDist MQFloat #Returns acceptable arrival distance
---@field ArrivalDistY MQFloat #Returns acceptable arrival distance for precisey
---@field ArrivalDistX MQFloat #Returns acceptable arrival distance for precisex
---@field Broken MQBoolean #Returns TRUE if BreakOnAggro or BreakOnHit event have halted moveto prematurely
TLO.MoveTo = {}

--- MakeCamp Lua Bindings
---@class TLO.MakeCamp
---@field Status MQString #Returns status of MakeCamp command. AltCamp returns OFF ["OFF", "PAUSED" or "ON"]
---@field Leash MQBoolean #Returns TRUE if plugin stucklogic has determined you are currently stuck
---@field AnchorX MQFloat #Returns location of current camp X anchor
---@field AnchorY MQFloat #Returns location of current camp Y anchor
---@field LeashLength MQFloat #Returns size of Leash Length
---@field CampRadius MQFloat #Returns size of camp radius
---@field MinDelay MQInt #Returns the min delay for auto-returning to camp in ms
---@field MaxDelay MQInt #Returns the max delay for auto-returning to camp in ms
---@field Returning MQBoolean #Returns TRUE if /makecamp return issued
---@field AltAnchorX MQFloat #Returns location of current altcamp X anchor
---@field AltAnchorY MQFloat #Returns location of current altcamp Y anchor
---@field CampDist MQFloat #Returns distance to camp anchor from your current location. Returns 0.00 if camp is disabled
---@field AltCampDist MQFloat #Returns distance to altcamp anchor from your current location. Returns 0.00 if camp is disabled
---@field AltRadius MQFloat #Returns size of altcamp radius
---@field Scatter MQBoolean #Returns TRUE if camp scattering enabled
---@field ReturnNoAggro MQBoolean #Returns TRUE if ReturnNoAggro is enabled
---@field ReturnNotLooting MQBoolean #Returns TRUE if ReturnNotLooting is enabled
---@field ReturnHaveTarget MQBoolean #Returns TRUE if ReturnHaveTarget is enabled
---@field Bearing MQFloat #Returns the bearing \(heading\) of camp scattering
---@field ScatDist MQFloat #Returns the distance from anchor to perform scatter
---@field ScatSize MQFloat #Returns the size of scattering radius
TLO.MakeCamp = {}

--- Circle Lua Bindings
---@class TLO.Circle
---@field Status MQString #Returns ON if circling ["OFF", "PAUSED" or "ON"]
---@field CircleY MQFloat #Returns the location of circle center Y
---@field CircleX MQFloat #Returns the location of circle center X
---@field Drunken MQBoolean #Returns TRUE if drunken
---@field Rotation MQString #Returns CCW if reverse circling ["CW" or "CCW"]
---@field Direction MQString #Returns movement direction of current circle ["FORWARDS" or "BACKWARDS"]
---@field Clockwise MQBoolean #Returns FALSE if reverse circling
---@field Backwards MQBoolean #Returns TRUE if movement direction backwards
---@field Radius MQFloat #Returns the radius size of circle
TLO.Circle = {}
