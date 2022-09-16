---@class character : spawn
--- @field public AAExp MQFloat #AA exp as a raw number out of 10,000 (10,000=100%)
--- @field public AAPoints MQFloat #Unused AA points
--- @field public AAPointsSpent MQFloat #The number of points you have spent on AA abilities
--- @field public AAPointsTotal MQFloat #The total number of AA points you have
--- @field public AAVitality MQFloat #The total number of AA Vitality you have
--- @field public AccuracyBonus MQFloat #Accuracy bonus from gear and spells
--- @field public ActiveDisc spell Returns a spell if melee discipline is active.
--- @field public ActiveFavorCost MQFloat #If Tribute is active, how much it is costing you every 10 minutes. Returns NULL if tribute is inactive.
--- @field public AltTimerReady MQBoolean #Alternate timer ready? (Bash/Slam/Frenzy/Backstab). Note: ${AbilityReady} works fine with most of these.
--- @field public AGI MQFloat #Character Agility
--- @field public AggroLock spawn spawn info for aggro lock player
--- @field public AmIGroupLeader MQBoolean #Am I the group leader?
--- @field public AssistComplete MQBoolean #returns true/false if the assist is complete
--- @field public AttackBonus MQFloat #Attack bonus from gear and spells
--- @field public AttackSpeed MQFloat #Your Attack Speed. No haste spells/items = AttackSpeed of 100. A 41% haste item will result in an AttackSpeed of 141. This variable does not take into account spell or song haste.
--- @field public Aura fun(n: integer): string The aura effect name
--- @field public AutoFire MQBoolean #Is Autofire on?
--- @field public AvoidanceBonus MQFloat #Avoidance bonus from gear/spells
--- @field public BardSongPlaying MQBoolean #Is a bard song playing?
--- @field public Buyer MQBoolean #if you are an active buyer
--- @field public CanMount MQBoolean #for some indoor zones that where not flagged as nomount and added bazaar, nexus to zones where its ok to mount.
--- @field public CareerFavor MQFloat #Career favor/tribute
--- @field public Cash MQFloat #Total cash on your character, expressed in coppers (eg. if you are carrying 100pp, Cash will return 100000)
--- @field public CashBank MQFloat #Total cash in your bank, expressed in coppers
--- @field public CHA MQFloat #Character Charisma
--- @field public Chronobines MQFloat #Chronobines on your character
--- @field public ClairvoyanceBonus MQFloat #Clairvoyance Bonus
--- @field public Combat MQBoolean #In combat?
--- @field public CombatEffectsBonus MQFloat #Combat Effects bonus from gear and spells
--- @field public CombatState fun(): string Returns one of the following: COMBAT, DEBUFFED, COOLDOWN, ACTIVE, RESTING, UNKNOWN
--- @field public Copper MQFloat #Copper on your character
--- @field public CopperBank MQFloat #Copper in bank
--- @field public Corrupted spell Returns the name of the Corrupted debuff if you have one
--- @field public CountBuffs MQFloat #Number of buffs you have, not including short duration buffs
--- @field public CountersCurse MQFloat #Number of curse counters you have
--- @field public CountersDisease MQFloat #Number of disease counters you have
--- @field public CountersPoison MQFloat #Number of poison counters you have
--- @field public CountSongs MQFloat #Number of songs you have
--- @field public Counters MQFloat #Damage Absorption Counters Remaining
--- @field public CurrentEndurance MQFloat #Current endurance
--- @field public CurrentFavor MQFloat #Current favor/tribute
--- @field public CurrentHPs MQFloat #Current hit points
--- @field public CurrentMana MQFloat #Current mana
--- @field public CurrentWeight MQFloat #Current weight
--- @field public Cursed spell Returns the name of the Curse debuff if you are effected by one
--- @field public DamageShieldBonus MQFloat #Damage Shield bonus from gear and spells
--- @field public DamageShieldMitigationBonus MQFloat #Damage Shield Mitigation bonus from gear and spells
--- @field public Dar MQFloat #Damage absorption remaining (eg. from Rune-type spells)
--- @field public Diseased fun(): string Returns the name of any Disease spell
--- @field public DEX MQFloat #Character Dexterity
--- @field public Dotted fun(): string Returns name of first DoT on character.
--- @field public DoTShieldBonus MQFloat #DoT Shield bonus from gear and spells
--- @field public Doubloons MQFloat #Doubloons on your character
--- @field public Downtime ticks Downtime (Ticks left til combat timer end)
--- @field public Drunk MQFloat #Drunkenness level
--- @field public EbonCrystals MQFloat #Number of Ebon Crystals on your character
--- @field public EnduranceBonus MQFloat #Endurance bonus from gear and spells
--- @field public EnduranceRegen MQFloat #Endurance regen from the last tick
--- @field public EnduranceRegenBonus MQFloat #Endurance regen bonus
--- @field public Exp MQFloat #Experience (out of 10,000)
--- @field public ExpansionFlags MQFloat #Returns a numeric number representing which expansions your toon is flagged for
--- @field public Faycites MQFloat #Faycites on your character
--- @field public Fellowship fellowship Info about Fellowship
--- @field public FreeBuffSlots MQFloat #Number of open buff slots (not counting the short duration buff slots)
--- @field public Gold MQFloat #Gold on character
--- @field public GoldBank MQFloat #Gold in bank
--- @field public GroupAssistTarget spawn Current group assist target
--- @field public Grouped MQBoolean #Grouped?
--- @field public GroupLeaderExp MQFloat #Group leadership experience (out of 330)
--- @field public GroupLeaderPoints MQFloat #Group leadership points
--- @field public GroupList fun(): string Returns a string of your group members (excluding you)
--- @field public GroupSize MQFloat #Size of group
--- @field public GukEarned MQFloat #Total LDoN points earned in Deepest Guk
--- @field public GuildID MQFloat #Returns the ID number of your guild
--- @field public Haste MQFloat #Total Combined Haste (worn and spell) as shown in Inventory Window stats
--- @field public HealAmountBonus MQFloat #Total Heal Amount bonus from gear
--- @field public HeroicAGIBonus MQFloat #Total Heroic Agility bonus from gear
--- @field public HeroicCHABonus MQFloat #Total Heroic Charisma bonus from gear
--- @field public HeroicDEXBonus MQFloat #Total Heroic Dexterity bonus from gear
--- @field public HeroicINTBonus MQFloat #Total Heroic Intelligence bonus from gear
--- @field public HeroicSTABonus MQFloat #Total Heroic Stamina bonus from gear
--- @field public HeroicSTRBonus MQFloat #Total Heroic Strength bonus from gear
--- @field public HeroicWISBonus MQFloat #Total Heroic Wisdom bonus from gear
--- @field public HPBonus MQFloat #Hit point bonus from gear and spells
--- @field public HPRegen MQFloat #Hit point regeneration from last tick
--- @field public HPRegenBonus MQFloat #HP regen bonus from gear and spells
--- @field public Hunger MQFloat #Hunger level
--- @field public ID MQFloat #Spawn ID
--- @field public InInstance MQBoolean #Returns TRUE/FALSE if you are in an instance.
--- @field public INT MQFloat #Character Intelligence
--- @field public Invulnerable fun(): string Returns the invulnerable spell name on you, can be used with spell data type ex. ${Me.Invulnerable.Spell.ID}
--- @field public LADelegateMA MQFloat #Level of Delegate MA of the current group leader (not your own ability level)
--- @field public LADelegateMarkNPC MQFloat #Level of Delegate Mark NPC of the current group leader (not your own ability level)
--- @field public LAFindPathPC MQFloat #Level of Find Path PC of the current group leader (not your own ability level)
--- @field public LAHealthEnhancement MQFloat #Level of Health Enhancement of the current group leader (not your own ability level)
--- @field public LAHealthRegen MQFloat #Level of Health Regen of the current group leader (not your own ability level)
--- @field public LAHoTT MQFloat #Level of HoTT of the current group leader (not your own ability level)
--- @field public LAInspectBuffs MQFloat #Level of Inspect Buffs of the current group leader (not your own ability level)
--- @field public LAManaEnhancement MQFloat #Level of Mana Enhancement of the current group leader (not your own ability level)
--- @field public LAMarkNPC MQFloat #Level of Mark NPC of the current group leader (not your own ability level)
--- @field public LANPCHealth MQFloat #Level of NPC Health of the current group leader (not your own ability level)
--- @field public LAOffenseEnhancement MQFloat #Level of Offense Enhancement of the current group leader (not your own ability level)
--- @field public LASpellAwareness MQFloat #Level of Spell Awareness of the current group leader (not your own ability level)
--- @field public LargestFreeInventory MQFloat #Size of your largest free inventory space
--- @field public LastZoned timestamp Returns a timestamp of last time you zoned
--- @field public LDoNPoints MQFloat #Available LDoN points
--- @field public Level MQFloat #Character Level
--- @field public ManaBonus MQFloat #Mana bonus from gear and spells
--- @field public ManaRegen MQFloat #Mana regeneration from last tick
--- @field public ManaRegenBonus MQFloat #Mana regen bonus from gear and spells
--- @field public MaxBuffSlots MQFloat #Max number of buffs you can have on you. /echo ${Me.MaxBuffSlots}
--- @field public MaxEndurance MQFloat #Max endurance
--- @field public MaxHPs MQFloat #Max hit points
--- @field public MaxMana MQFloat #Max mana
--- @field public Mercenary fun(): string The state of your Mercenary, ACTIVE, SUSPENDED, or UNKNOWN (If it's dead). Returns NULL if you do not have a Mercenary.
--- @field public MercenaryStance fun(): string Current active mercenary stance as a string, default is NULL.
--- @field public MirEarned MQFloat #Total LDoN points earned in Miragul's
--- @field public MMEarned MQFloat #Total LDoN points earned in Mistmoore
--- @field public Moving MQBoolean #Moving? (including strafe)
--- @field public Name fun(): string First name
--- @field public NumGems MQFloat #Returns the amount of spell gems your toon has
--- @field public Orux MQFloat #Orux on your character
--- @field public PctAAExp MQFloat #AA exp as a %
--- @field public PctAAVitality MQFloat #Percentage of AA Vitality your toon has
--- @field public PctAggro MQFloat #Your aggro percentage
--- @field public PctEndurance MQFloat #Current endurance as a %
--- @field public PctExp MQFloat #Experience as a %
--- @field public PctGroupLeaderExp MQFloat #Group leadership exp as a %
--- @field public PctHPs MQFloat #Current HP as a %
--- @field public PctMana MQFloat #Current mana as a %
--- @field public PctRaidLeaderExp MQFloat #Raid leadership experience as a %
--- @field public PctVitality MQFloat #Percentage of Vitality the toon has
--- @field public Phosphenes MQFloat #Phosphenes on your character
--- @field public Phosphites MQFloat #Phosphites on your character
--- @field public Platinum MQFloat #Platinum on your character
--- @field public PlatinumBank MQFloat #Platinum in bank
--- @field public PlatinumShared MQFloat #Platinum in shared bank
--- @field public Poisoned fun(): string Returns the name of any Poison spell
--- @field public RadiantCrystals MQFloat #Number of Radiant Crystals on your character
--- @field public RaidLeaderExp MQFloat #Raid leadership exp (out of 330)
--- @field public RaidLeaderPoints MQFloat #Raid leadership points
--- @field public RangedReady MQBoolean #Ranged attack ready?
--- @field public RujEarned MQFloat #Total LDoN points earned in Rujarkian
--- @field public Running MQBoolean #Do I have auto-run turned on?
--- @field public SecondaryPctAggro MQFloat #Secondary Percentage aggro
--- @field public SecondaryAggroPlayer spawn spawninfo for secondary aggro player
--- @field public ShieldingBonus MQFloat #Shielding bonus from gear and spells
--- @field public Shrouded MQBoolean #Am I Shrouded?
--- @field public Silenced fun(): string Returns the name of the Silence type effect on you
--- @field public Silver MQFloat #Silver on your character
--- @field public SilverBank MQFloat #Silver in bank
--- @field public Sit fun() Causes toon to sit if not already
--- @field public Spawn spawn The character's spawn
--- @field public SpellInCooldown MQBoolean #returns TRUE if you have a spell in cooldown and FALSE when not.
--- @field public SpellDamageBonus MQFloat #Spell Damage bonus
--- @field public SpellRankCap MQFloat #your characters spell rank cap. if it returns: 1 = Rk. I spells 2 = Rk. II spells 3 = Rk. III spells
--- @field public SpellShieldBonus MQFloat #Spell Shield bonus from gear and spells
--- @field public STA MQFloat #Character Stamina
--- @field public Stand fun() causes toon to stand if not already
--- @field public StopCast fun() Causes toon to stop casting
--- @field public STR MQFloat #Character Strength
--- @field public StrikeThroughBonus MQFloat #Strikethrough bonus from gear and spells
--- @field public Stunned MQBoolean #Am I stunned?
--- @field public StunResistBonus MQFloat #Stun Resist bonus from gear and spells
--- @field public Subscription fun(): string Subscription type GOLD, FREE, (Silver?)
--- @field public SubscriptionDays MQFloat #Returns an intUsage: /echo I have ${Me.SubscriptionDays} left before my all access expires.
--- @field public Surname fun(): string Last name
--- @field public svChromatic MQFloat #Your character's lowest resist
--- @field public svCold MQFloat #Character Cold Resist
--- @field public svCorruption MQFloat #Character Corruption Resist
--- @field public svDisease MQFloat #Character Disease Resist
--- @field public svFire MQFloat #Character Fire Resist
--- @field public svMagic MQFloat #Character Magic Resist
--- @field public svPoison MQFloat #Character Poison Resist
--- @field public svPrismatic MQFloat #The average of your character's resists
--- @field public TakEarned MQFloat #Total LDoN points earned in Takish
--- @field public TargetOfTarget target Target of Target (will only work when group or raid Target of Target is active; if not, it will return NULL)
--- @field public Thirst MQFloat #Thirst level
--- @field public Trader MQBoolean #if you are an active Trader
--- @field public TributeActive MQBoolean #Tribute Active
--- @field public TributeTimer ticks Tribute Timer
--- @field public UseAdvancedLooting MQBoolean #TRUE/FALSE if using advanced looting
--- @field public WIS MQFloat #Character Wisdom
--- @field public Vitality MQFloat #Total amount of Vitality your toon has
Character = nil

---@param name string # Skill name
---@return integer # The doability button number that the skill name is on
function Character.Ability(name) end

---@param index integer # doability button number
---@return string # The skill name assigned to this doability button
function Character.Ability(index) end

---@param index integer # Ability button number
---@return boolean
function Character.AbilityReady(index) end

---@param name string 
---@return boolean
function Character.AbilityReady(name) end

---@param index integer # Alt ability #
---@return altability
function Character.AltAbility(index) end

---@param name string 
---@return altability
function Character.AltAbility(name) end

---@param index integer # Alt ability #
---@return boolean
function Character.AltAbilityReady(index) end

---@param name string 
---@return boolean
function Character.AltAbilityReady(name) end

---@param index integer # Alt ability #
---@return integer
function Character.AltAbilityTimer(index) end

---@param name string 
---@return integer
function Character.AltAbilityTimer(name) end

---@param name string 
---@return integer
function Character.AltCurrency(name) end

---@param slot integer # Bankslot number 
---@return item
function Character.Bank (slot) end

---@param name string 
---@return integer # Slot in your spell book assigned to spell name
function Character.Book(name) end

---@param slot integer # Slot number in book 
---@return spell
function Character.Book(slot) end

---@param bindPointIndex integer # Your bind points (0-4) 
---@return worldlocation
function Character.BoundLocation(bindPointIndex) end

---@param name string # Name of the buff
---@return buff
function Character.Buff(name) end

---@param slotNumber integer # Buff slot number
---@return buff
function Character.Buff(slotNumber) end

---The number of Combat ability name in your list (not the same as anyone else's list!)
---@param name string # Name of the combat ability
---@return integer
function Character.CombatAbility(name) end

---The name of Combat Ability # in your list (not the same as anyone else's list!)
---@param index integer # Combat Ability # in your list 
---@return spell
function Character.CombatAbility(index) end

---@param minSize? integer # spaces of at least [minSize] size (giant=4) 
---@return integer # Number of free inventory spaces
function Character.FreeInventory(minSize) end

---@param name string # Spell name
---@return integer # Returns the slot # with the spell name
function Character.Gem(name) end

---@param gemSlot integer 
---@return spell
function Character.Gem(gemSlot) end

---@param name string # Spell name
---@return ticks
function Character.GemTimer(name) end

---@param gemSlot integer 
---@return ticks
function Character.GemTimer(gemSlot) end

---@param index integer # Current group marked NPC (1-3)
---@return spawn
function Character.GroupMarkNPC(index) end

---@param expansionNumber integer
---@return boolean
function Character.HaveExpansion(expansionNumber) end

---@param name string # slotname (inventory slots only) [https://docs.macroquest.org/reference/general/slot-names/]
---@return item
function Character.Inventory(name) end

---@param slotNumber integer 
---@return item
function Character.Inventory(slotNumber) end

---@param name string 
---@return boolean # True/False on if the item is ready to cast.
function Character.ItemReady(name) end

---@param name string 
---@return integer # langauge number
function Character.Language(name) end

---@param languageNumber integer 
---@return string # The EQ language name of the language number specified.
function Character.Language(languageNumber) end

---@param language integer 
---@return integer # Your skill in language
function Character.LanguageSkill(language) end

---@param name string # Name of the buff
---@return buff
function Character.PetBuff(name) end

---@param slotNumber integer # PetBuff slot number
---@return buff
function Character.PetBuff(slotNumber) end

---@param index integer # Current raid assist target (1-3)
---@return spawn
function Character.RaidAssistTarget(index) end

---@param index integer # Current raid marked NPC (1-3)
---@return spawn
function Character.RaidMarkNPC(index) end

---@param name string 
---@return integer # Returns current skill level
function Character.Skill(name) end

---@param skillId integer 
---@return integer # Returns current skill level
function Character.Skill(skillId) end

---@param name string 
---@return integer 
function Character.SkillCap(name) end

---@param skillId integer 
---@return integer
function Character.SkillCap(skillId) end

---@param name string 
---@return buff 
function Character.Song(name) end

---@param slotNumber integer 
---@return buff
function Character.Song(slotNumber) end

---Gem with this spell name ready to cast?
---@param name string 
---@return boolean 
function Character.SpellReady(name) end

---Gem in this gem # ready to cast?
---@param slotNumber integer 
---@return boolean
function Character.SpellReady(slotNumber) end

---Returns the number of AUTO-HATER mobs on the extended target window where your aggro is less than the optional parameter N. N must be between 1-100 inclusive or it will be set to 100 (the default value).
---@param n? integer # defaults to 100
---@return integer
function Character.XTAggroCount(n) end

---Returns the number of current extended targets.
---@return integer
function Character.XTarget() end

---Extended target data for the specified XTarget #.
---@param index integer 
---@return xtarget
function Character.XTarget(index) end