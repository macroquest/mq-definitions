--- @class buff : spell
--- @field public Counters MQFloat # The number of counters added by the buff
--- @field public Dar MQFloat # The remaining damage absorption of the buff (if any). This is not entirely accurate, it will only show you to the Dar of your spell when it was initially cast, or what it was when you last zoned (whichever is more recent).
--- @field public Duration ticks The time remaining before the buff fades (not total duration)
--- @field public ID MQInt # The ID of the buff or shortbuff slot
--- @field public Level MQFloat # The level of the person that cast the buff on you (not the level of the spell)
--- @field public Mod MQFloat # The modifier to a bard song
--- @field public Spell MQSpell # The spell
--- @field public ToString MQString # Same as Name
local buff = nil

---Removes the named/partial name buff
function buff.Remove() end