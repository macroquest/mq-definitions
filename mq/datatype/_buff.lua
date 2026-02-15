---@meta

---@class buff : spell
---@field public Caster MQString # Name of the caster who cast the buff, if available
---@field public Counters MQInt # The number of counters added by the buff
---@field public CountersCorruption MQInt # The number of corruption counters
---@field public CountersCurse MQInt # The number of curse counters
---@field public CountersDisease MQInt # The number of disease counters
---@field public CountersPoison MQInt # The number of poison counters
---@field public Dar MQInt # The remaining damage absorption of the buff (if any). This is not entirely accurate, it will only show you to the Dar of your spell when it was initially cast, or what it was when you last zoned (whichever is more recent).
---@field public Duration timestamp # The time remaining before the buff fades (not total duration)
---@field public HitCount MQInt # The hit count remaining on the buff
---@field public ID MQInt # The ID of the buff or shortbuff slot
---@field public Level MQInt # The level of the person that cast the buff on you (not the level of the spell)
---@field public Mod MQFloat # The modifier to a bard song
---@field public Spell spell # The spell
---@field public TotalCounters MQInt # The total number of counters on the buff
local buff = {}

--- Removes the named/partial name buff
function buff.Remove() end
