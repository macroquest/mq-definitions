---@meta

--- MoveUtils Lua Bindings
---@class TLO.MoveUtils
---@field Command fun(): string Returns the currently active command. MAKECAMP returns if a camp is setup but no other command is currently in use ["NONE", "STICK", "MOVETO", "MAKECAMP", "CIRCLE"]
---@field Stuck fun(): boolean Returns true if plugin stucklogic has determined you are currently stuck
---@field Summoned fun(): boolean Returns true if BreakOnSummon is enabled and has fired due to your character being summoned beyond breakonsummon distance
---@field StuckLogic fun(): boolean Returns TRUE if stucklogic is enabled
---@field Verbosity fun(): boolean Returns TRUE if verbosity is enabled
---@field FullVerbosity fun(): boolean Returns TRUE if fullverbosity is enabled
---@field TotalSilence fun(): boolean Returns TRUE if totalsilence is enabled
---@field Aggro fun(): boolean Returns TRUE if you are facing your target and your target is facing you
---@field TryToJump fun(): boolean Returns TRUE if stucklogic trytojump is enabled
---@field PauseMinDelay fun(): integer Returns the min delay for mousepause and mpause to resume command in ms
---@field PauseMaxDelay fun(): integer Returns the max delay for mousepause and mpause to resume command in ms
---@field PulseCheck fun(): integer Returns the number of pulses used to average movement rate for stucklogic
---@field PulseUnstuck fun(): integer Returns the number of pulses successfully moved forward after being stuck to be considered unstuck
---@field DistStuck fun(): number Returns the amount of distance needed to have moved \(compared against pulse average\) or else considered stuck by stucklogic
---@field Version fun(): number Returns the version number of the plugin
---@field MovePause fun(): boolean Returns TRUE if mpause \(PauseKB\) is enabled
---@field GM fun(): boolean Returns TRUE if BreakOnGM fired
mq.TLO.MoveUtils = {}

--- Stick Lua Bindings
---@class Stick
---@field Status fun(): string Returns ON if any form of stick is active ["OFF", "PAUSED" or "ON"]
---@field Active fun(): boolean Returns TRUE if any form of stick is active
---@field Broken fun(): boolean Returns TRUE if BreakOnHit event has halted stick prematurely
---@field Distance fun(): number Returns current distance used by stick
---@field MoveBehind fun(): boolean Returns TRUE if stick behind is active
---@field MoveBack fun(): boolean Returns TRUE if moveback is active
---@field Loose fun(): boolean Returns TRUE if loose sticking is enabled
---@field Paused fun(): boolean Returns TRUE if plugin is paused
---@field Behind fun(): boolean Returns TRUE if currently behind target \(regardless of _/stick behind_\), false if outside of stick dist or not behind
---@field Stopped fun(): boolean Returns TRUE if stick is within stick distance
---@field Pin fun(): boolean Returns TRUE if stick pin is active
---@field StickTarget fun(): integer Returns spawnid of stick target if stick id/hold used, else spawnid of current target, 0 if no target and id/hold not used
---@field StickTargetName fun(): string Returns DisplayedName of stick target if stick id/hold used, else current target or NONE if no target and hold/id not used
---@field DistMod fun(): number Returns current stickdist modifier
---@field DistModPercent fun(): number Returns current stickdist percent modifier
---@field Always fun(): boolean Returns TRUE if /stick always is active
mq.TLO.Stick = {}

--- MoveTo Lua Bindings
---@class TLO.MoveTo
---@field Moving fun(): boolean Returns TRUE if moveto or camp return is active
---@field Stopped fun(): boolean Returns TRUE if the last moveto command completed successfully
---@field CampStopped fun(): boolean Returns TRUE if within moveto distance of makecamp Y X location
---@field UseWalk fun(): boolean Returns TRUE if UseWalk is enabled
---@field ArrivalDist fun(): number Returns acceptable arrival distance
---@field ArrivalDistY fun(): number Returns acceptable arrival distance for precisey
---@field ArrivalDistX fun(): number Returns acceptable arrival distance for precisex
---@field Broken fun(): boolean Returns TRUE if BreakOnAggro or BreakOnHit event have halted moveto prematurely
mq.TLO.MoveTo = {}

--- MakeCamp Lua Bindings
---@class TLO.MakeCamp
---@field Status fun(): string Returns status of MakeCamp command. AltCamp returns OFF ["OFF", "PAUSED" or "ON"]
---@field Leash fun(): boolean Returns TRUE if plugin stucklogic has determined you are currently stuck
---@field AnchorX fun(): number Returns location of current camp X anchor
---@field AnchorY fun(): number Returns location of current camp Y anchor
---@field LeashLength fun(): number Returns size of Leash Length
---@field CampRadius fun(): number Returns size of camp radius
---@field MinDelay fun(): integer Returns the min delay for auto-returning to camp in ms
---@field MaxDelay fun(): integer Returns the max delay for auto-returning to camp in ms
---@field Returning fun(): boolean Returns TRUE if /makecamp return issued
---@field AltAnchorX fun(): number Returns location of current altcamp X anchor
---@field AltAnchorY fun(): number Returns location of current altcamp Y anchor
---@field CampDist fun(): number Returns distance to camp anchor from your current location. Returns 0.00 if camp is disabled
---@field AltCampDist fun(): number Returns distance to altcamp anchor from your current location. Returns 0.00 if camp is disabled
---@field AltRadius fun(): number Returns size of altcamp radius
---@field Scatter fun(): boolean Returns TRUE if camp scattering enabled
---@field ReturnNoAggro fun(): boolean Returns TRUE if ReturnNoAggro is enabled
---@field ReturnNotLooting fun(): boolean Returns TRUE if ReturnNotLooting is enabled
---@field ReturnHaveTarget fun(): boolean Returns TRUE if ReturnHaveTarget is enabled
---@field Bearing fun(): number Returns the bearing \(heading\) of camp scattering
---@field ScatDist fun(): number Returns the distance from anchor to perform scatter
---@field ScatSize fun(): number Returns the size of scattering radius
mq.TLO.MakeCamp = {}

--- Circle Lua Bindings
---@class TLO.Circle
---@field Status fun(): string Returns ON if circling ["OFF", "PAUSED" or "ON"]
---@field CircleY fun(): number Returns the location of circle center Y
---@field CircleX fun(): number Returns the location of circle center X
---@field Drunken fun(): boolean Returns TRUE if drunken
---@field Rotation fun(): string Returns CCW if reverse circling ["CW" or "CCW"] 
---@field Direction fun(): string Returns movement direction of current circle ["FORWARDS" or "BACKWARDS"] 
---@field Clockwise fun(): boolean Returns FALSE if reverse circling
---@field Backwards fun(): boolean Returns TRUE if movement direction backwards
---@field Radius fun(): number Returns the radius size of circle
mq.TLO.Circle = {}