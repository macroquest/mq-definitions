---@meta Cast

---@class Cast
---@field Active MQBoolean # Return TRUE if plugin is loaded and you are in-game.
---@field Effect MQSpell # Returns the name of the spell being cast, or a NULL string if not casting.
---@field Result MQString # Returns a string containing the result of the /casting command. Possible values: CAST_ABORTED, CAST_CANCELLED, CAST_CANNOTSEE, CAST_COLLAPSE, CAST_COMPONENTS, CAST_DISTRACTED, CAST_FIZZLE, CAST_IMMUNE, CAST_INTERRUPTED, CAST_INVISIBLE, CAST_NOTARGET, CAST_NOTREADY, CAST_OUTOFMANA, CAST_OUTOFRANGE, CAST_OUTDOORS, CAST_PENDING, CAST_RECOVER, CAST_RESIST, CAST_STANDING, CAST_STUNNED, CAST_SUCCESS, CAST_TAKEHOLD, CAST_UNKNOWN
---@field Return MQString # Returns the result of the casting/memorize/interrupt request.
---@field Status MQString # Returns a string containing all the pending events. Status codes: I=Idle and waiting, A=Advpath pause, F=Stick pause, S=Immobilize in progress, M=Memorize in progress, E=Item swapped, D=Ducking casting, T=Targeting, C=Spell casting in progress
---@field Stored MQSpell # Returns the last spell that was cast, or NULL if no spell has been cast.
---@field Taken MQBoolean # Return TRUE if last spell cast didn't take hold on target.
---@field Timing MQInt # Returns the estimated number of miliseconds remaining until the spell finished casting.
---@field Ready fun(parameter?: string): boolean # Returns TRUE if ready to cast. No param: ready for any cast. "M": ready to memorize. "#": gem number ready. Or spell/item/AA name/ID.
local Cast = {}
