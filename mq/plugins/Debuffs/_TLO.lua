---@meta

--- Debuffs Lua Bindings
---@class TLO.Debuff
---@field Poisoned MQInt The number of poison counters on you.
---@field Diseased MQInt The number of disease counters on you.
---@field Cursed MQInt The number of curse counters counters on you.
---@field Corrupted MQInt The number of corruption counters on you.
---@field Poisons MQInt The number of poisonspells on you.
---@field Diseases MQInt The number of diseasespells on you.
---@field Curses MQInt The number of curse countersspells on you.
---@field Corruptions MQInt The number of curse spells affecting you.
---@field Count MQInt The number of debuffs that need cured, does not include snare.
---@field Slowed MQBoolean Are you slowed (melee attacks)?
---@field SpellSlowed MQBoolean Are you slowed (spell haste reduction)?
---@field ManaCost MQBoolean Is your Spell Mana Cost increased?
---@field CastingLevel MQBoolean Is your Effective Casting Level reduced?
---@field HealingEff MQBoolean Is your Healing Effectiveness reduced?
---@field SpellDmgEff MQBoolean Is your Spell Damage Effectiveness reduced?
---@field Blind MQBoolean Are you Blind?
---@field Charmed MQBoolean Are you Charmed?
---@field Feared MQBoolean Are you Feared?
---@field Silenced MQBoolean Are you Silenced?
---@field Invulnerable MQBoolean Are you Invulnerable?
---@field Detrimentals MQBoolean Are there any detrimental effects on you?
---@field Counters MQInt The of poison/disease/curse/corruption counters on you.
---@field Rooted MQBoolean Are you Rooted?
TLO.Debuff = {}

---@alias HasDebuff "TRUE"|"FALSE"
---@return HasDebuff "TRUE" if you have debuffs on that have counters on them, "FALSE" if not
function TLO.Debuff() end

---@param lookup "self"|"myself"|"pet"|"warder" Lookup type
---@return TLO.Debuff
function TLO.Debuff(lookup) end

---@alias DrainType "Disease"|"Poison"|"Curse"|"All"

---@param drain_type DrainType Drain type
---@return integer # The number of specific counters effecting HP for the given DrainType or the amount of HP you are losing per tick from all debuffs.
---@overload fun(): integer
function TLO.Debuff.HPDrain(drain_type) end

---@param drain_type DrainType Drain type
---@return integer # The number of specific counters effecting Mana for the given DrainType or the amount of Mana you are losing per tick from all debuffs.
---@overload fun():integer
function TLO.Debuff.ManaDrain(drain_type) end

---@param drain_type DrainType Drain type
---@return integer # The number of specific counters effecting Endurance for the given DrainType or the amount of Endurance you are losing per tick from all debuffs.
---@overload fun():integer
function TLO.Debuff.EnduranceDrain(drain_type) end