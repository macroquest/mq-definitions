--- @class spell
--- @field public AERange MQFloat # AE range (group spells use this for their range)
--- @field public BaseName MQString # Base name of the spell without rank information.
--- @field public CastOnAnother MQString # Message when cast on others
--- @field public CastOnYou MQString # Message when cast on yourself
--- @field public CastTime timestamp # Cast time (unadjusted)
--- @field public Category MQString # Spell category name
--- @field public CategoryID MQInt # Spell category id
--- @field public CounterType MQString # The resist counter. Will be one of "Disease", "Poison", "Curse" or "Corruption"
--- @field public CounterNumber MQInt # The number of counters that the spell adds
--- @field public Duration ticks # Duration of the spell (if any)
--- @field public DurationValue1 ticks # Duration of the spell (if any)
--- @field public Extra string # extra spell information
--- @field public FizzleTime timestamp # Time to recover after fizzle
--- @field public GemIcon MQInt # Icon number of the spell. Exmaple ${Spell[blah].GemIcon}
--- @field public HastePct MQFloat # Percentage of haste, example of use ${Me.Hasted.HastePct} or ${Spell[Speed of Milyex].HastePct}
--- @field public ID MQInt # Spell ID
--- @field public Inspect fun(): nil # Brings up in-game inspect window
--- @field public IsSkill MQBoolean # Is this spell a skill?
--- @field public IsSwarmSpell MQBoolean # Is this spell a Swarm spell?
--- @field public Level MQInt # Level
--- @field public Location MQFloat # Appears to be max distance
--- @field public Mana MQInt # Mana cost (unadjusted)
--- @field public EnduranceCost MQInt # Endurance cost (unadjusted)
--- @field public MyCastTime timestamp # Adjusted cast time
--- @field public MyRange MQFloat # Adjusted spell range, including focus effects, etc.
--- @field public Name MQString # Spell Name
--- @field public NumEffects MQInt # The number of effects the spell has
--- @field public PushBack MQFloat # Push back amount
--- @field public Range MQFloat # Maximum range to target (use AERange for AE and group spells)
--- @field public Rank MQInt # Returns either 1, 2 or 3 for spells and 4-30 for clickys and potions.
--- @field public RankName MQString # Returns the spell/combat ability name rank character has.
--- @field public RecastTime MQFloat #T ime to recast after successful cast
--- @field public RecoveryTime timestamp Same as FizzleTime
--- @field public ResistAdj MQInt # Resist adjustment
--- @field public ResistType MQString # See below for Resist Types
--- @field public Skill MQString # See below for Skill Types
--- @field public SlowPct MQFloat # Percentage of slow, example of use ${Target.Slowed.SlowPct} or ${Spell[Slowing Helix].SlowPct}
--- @field public SpellIcon MQInt # Icon number of the spell. Exmaple ${Spell[blah].SpellIcon}
--- @field public SpellType MQString # The spell type, Will be one of "Beneficial(Group)", "Beneficial", "Detrimental" or "Unknown"
--- @field public Beneficial MQBoolean # Is this spell a beneficial spell type
--- @field public Stacks MQBoolean # Does the selected spell stack with your current buffs (duration is in ticks)
--- @field public StacksSpawn fun(id: integer|string): MQBoolean # Does the selected spell stack with the spawns current buffs (duration is in ticks)
--- @field public StacksPet MQBoolean # Does the selected spell stack with your pet's current buffs (duration is in ticks)
--- @field public StacksTarget MQBoolean # Does the selected spell stack with your target's current buffs (duration is in ticks)
--- @field public StacksWith MQBoolean # Alias for .WillStack - see entry for more details
--- @field public StacksWithDiscs MQBoolean # Will this stack with active discs
--- @field public Subcategory MQString # Spell sub category name
--- @field public SubcategoryID MQInt # Spell sub category id
--- @field public NewStacks MQBoolean # See entry for more details
--- @field public TargetType MQString # See below for Target Types
--- @field public WearOff MQString # The "wear off" message
--- @field public ToString MQString # Same as Name
local spell = nil

---@param name string # The spell name
---@return boolean # Does the selected spell stack with the specific SPELL name, DOES NOT work with AAs.
function spell.WillStack(name) end

---@param index integer|string # The reagent index [1-4]
---@return MQInt # Number of reagents used for this spell in given [index]
function spell.ReagentCount(index) end

---@param index integer|string # The reagent index [1-4]
---@return MQInt # ID of the reagent item used for this spell in given [index]
function spell.ReagentID(index) end

---@param index integer|string # The reagent index [1-4]
---@return MQInt # ID of the reagent item used for this spell in given [index]
function spell.NoExpendReagentID(index) end

---@param index integer|string # The index to retrieve the spell attribute value of
---@return integer
function spell.Attrib(index) end

---@param index integer|string # The index to retrieve the trigger value of
---@return MQSpell
function spell.Trigger(index) end

---@param index integer|string # The index to retrieve the base value of
---@return integer
function spell.Base(index) end

---@param index integer|string # The index to retrieve the base2 value of
---@return integer
function spell.Base2(index) end

---@param index integer|string # The index to retrieve the max value of
---@return integer
function spell.Max(index) end

---@param spa integer|string # The SPA number to check against the spell attributes
---@return MQBoolean # Does the spell contain the specified SPA.
function spell.HasSPA(spa) end
