---@class character : spawn
--- @field public AAExp fun(): number AA exp as a raw number out of 10,000 (10,000=100%)
--- @field public AAPoints fun(): number Unused AA points
--- @field public AAPointsSpent fun(): number The number of points you have spent on AA abilities
--- @field public AAPointsTotal fun(): number The total number of AA points you have
--- @field public AAVitality fun(): number The total number of AA Vitality you have
--- @field public AccuracyBonus fun(): number Accuracy bonus from gear and spells
--- @field public ActiveDisc spell Returns a spell if melee discipline is active.
--- @field public ActiveFavorCost fun(): number If Tribute is active, how much it is costing you every 10 minutes. Returns NULL if tribute is inactive.
--- @field public AltTimerReady fun(): boolean Alternate timer ready? (Bash/Slam/Frenzy/Backstab). Note: ${AbilityReady} works fine with most of these.
--- @field public AGI fun(): number Character Agility
--- @field public AggroLock spawn spawn info for aggro lock player
--- @field public AmIGroupLeader fun(): boolean Am I the group leader?
--- @field public AssistComplete fun(): boolean returns true/false if the assist is complete
--- @field public AttackBonus fun(): number Attack bonus from gear and spells
--- @field public AttackSpeed fun(): number Your Attack Speed. No haste spells/items = AttackSpeed of 100. A 41% haste item will result in an AttackSpeed of 141. This variable does not take into account spell or song haste.
--- @field public Aura fun(): string The aura effect name
--- @field public AutoFire fun(): boolean Is Autofire on?
--- @field public AvoidanceBonus fun(): number Avoidance bonus from gear/spells
--- @field public BardSongPlaying fun(): boolean Is a bard song playing?
--- @field public Buyer fun(): boolean if you are an active buyer
--- @field public CanMount fun(): boolean for some indoor zones that where not flagged as nomount and added bazaar, nexus to zones where its ok to mount.
--- @field public CareerFavor fun(): number Career favor/tribute
--- @field public Cash fun(): number Total cash on your character, expressed in coppers (eg. if you are carrying 100pp, Cash will return 100000)
--- @field public CashBank fun(): number Total cash in your bank, expressed in coppers
--- @field public CHA fun(): number Character Charisma
--- @field public Chronobines fun(): number Chronobines on your character
--- @field public ClairvoyanceBonus fun(): number Clairvoyance Bonus
--- @field public Combat fun(): boolean In combat?
--- @field public CombatAbility fun(): number The number of Combat ability name in your list (not the same as anyone else's list!)
--- @field public CombatAbilityReady fun(): boolean Is this Combat Ability ready?
--- @field public CombatAbilityTimer fun(): number The time remaining (in seconds) before the Combat Ability name is usable
--- @field public CombatEffectsBonus fun(): number Combat Effects bonus from gear and spells
--- @field public CombatState fun(): string Returns one of the following: COMBAT, DEBUFFED, COOLDOWN, ACTIVE, RESTING, UNKNOWN
--- @field public Copper fun(): number Copper on your character
--- @field public CopperBank fun(): number Copper in bank
--- @field public Corrupted spell Returns the name of the Corrupted debuff if you have one
--- @field public CountBuffs fun(): number Number of buffs you have, not including short duration buffs
--- @field public CountersCurse fun(): number Number of curse counters you have
--- @field public CountersDisease fun(): number Number of disease counters you have
--- @field public CountersPoison fun(): number Number of poison counters you have
--- @field public CountSongs fun(): number Number of songs you have
--- @field public Counters fun(): number Damage Absorption Counters Remaining
--- @field public CurrentEndurance fun(): number Current endurance
--- @field public CurrentFavor fun(): number Current favor/tribute
--- @field public CurrentHPs fun(): number Current hit points
--- @field public CurrentMana fun(): number Current mana
--- @field public CurrentWeight fun(): number Current weight
--- @field public Cursed spell Returns the name of the Curse debuff if you are effected by one
--- @field public DamageShieldBonus fun(): number Damage Shield bonus from gear and spells
--- @field public DamageShieldMitigationBonus fun(): number Damage Shield Mitigation bonus from gear and spells
--- @field public Dar fun(): number Damage absorption remaining (eg. from Rune-type spells)
--- @field public Diseased fun(): string Returns the name of any Disease spell
--- @field public DEX fun(): number Character Dexterity
--- @field public Dotted fun(): string Returns name of first DoT on character.
--- @field public DoTShieldBonus fun(): number DoT Shield bonus from gear and spells
--- @field public Doubloons fun(): number Doubloons on your character
--- @field public Downtime ticks Downtime (Ticks left til combat timer end)
--- @field public Drunk fun(): number Drunkenness level
--- @field public EbonCrystals fun(): number Number of Ebon Crystals on your character
--- @field public EnduranceBonus fun(): number Endurance bonus from gear and spells
--- @field public EnduranceRegen fun(): number Endurance regen from the last tick
--- @field public EnduranceRegenBonus fun(): number Endurance regen bonus
--- @field public Exp fun(): number Experience (out of 10,000)
--- @field public ExpansionFlags fun(): number Returns a numeric number representing which expansions your toon is flagged for
--- @field public Faycites fun(): number Faycites on your character
--- @field public Fellowship fellowship Info about Fellowship
--- @field public FreeBuffSlots fun(): number Number of open buff slots (not counting the short duration buff slots)
--- @field public FreeInventory fun(): number Number of free inventory spaces
--- @field public Gem fun(): number Returns the slot # with the spell name
--- @field public GemTimer spell The timer for the spell with this name or in this gem #
--- @field public Gold fun(): number Gold on character
--- @field public GoldBank fun(): number Gold in bank
--- @field public GroupAssistTarget spawn Current group assist target
--- @field public Grouped fun(): boolean Grouped?
--- @field public GroupLeaderExp fun(): number Group leadership experience (out of 330)
--- @field public GroupLeaderPoints fun(): number Group leadership points
--- @field public GroupList fun(): string Returns a string of your group members (excluding you)
--- @field public GroupMarkNPC spawn Current group marked NPC (1-3)
--- @field public GroupSize fun(): number Size of group
--- @field public GukEarned fun(): number Total LDoN points earned in Deepest Guk
--- @field public GuildID fun(): number Returns the ID number of your guild
--- @field public HaveExpansion fun(): boolean Returns TRUE/FALSE if you have that expansion #
--- @field public Haste fun(): number Total Combined Haste (worn and spell) as shown in Inventory Window stats
--- @field public HealAmountBonus fun(): number Total Heal Amount bonus from gear
--- @field public HeroicAGIBonus fun(): number Total Heroic Agility bonus from gear
--- @field public HeroicCHABonus fun(): number Total Heroic Charisma bonus from gear
--- @field public HeroicDEXBonus fun(): number Total Heroic Dexterity bonus from gear
--- @field public HeroicINTBonus fun(): number Total Heroic Intelligence bonus from gear
--- @field public HeroicSTABonus fun(): number Total Heroic Stamina bonus from gear
--- @field public HeroicSTRBonus fun(): number Total Heroic Strength bonus from gear
--- @field public HeroicWISBonus fun(): number Total Heroic Wisdom bonus from gear
--- @field public HPBonus fun(): number Hit point bonus from gear and spells
--- @field public HPRegen fun(): number Hit point regeneration from last tick
--- @field public HPRegenBonus fun(): number HP regen bonus from gear and spells
--- @field public Hunger fun(): number Hunger level
--- @field public ID fun(): number Spawn ID
--- @field public InInstance fun(): boolean Returns TRUE/FALSE if you are in an instance.
--- @field public INT fun(): number Character Intelligence
--- @field public Inventory item Item in this slot #
--- @field public Invulnerable fun(): string Returns the invulnerable spell name on you, can be used with spell data type ex. ${Me.Invulnerable.Spell.ID}
--- @field public ItemReady fun(): boolean True/False on if the item is ready to cast.
--- @field public LADelegateMA fun(): number Level of Delegate MA of the current group leader (not your own ability level)
--- @field public LADelegateMarkNPC fun(): number Level of Delegate Mark NPC of the current group leader (not your own ability level)
--- @field public LAFindPathPC fun(): number Level of Find Path PC of the current group leader (not your own ability level)
--- @field public LAHealthEnhancement fun(): number Level of Health Enhancement of the current group leader (not your own ability level)
--- @field public LAHealthRegen fun(): number Level of Health Regen of the current group leader (not your own ability level)
--- @field public LAHoTT fun(): number Level of HoTT of the current group leader (not your own ability level)
--- @field public LAInspectBuffs fun(): number Level of Inspect Buffs of the current group leader (not your own ability level)
--- @field public LAManaEnhancement fun(): number Level of Mana Enhancement of the current group leader (not your own ability level)
--- @field public LAMarkNPC fun(): number Level of Mark NPC of the current group leader (not your own ability level)
--- @field public LANPCHealth fun(): number Level of NPC Health of the current group leader (not your own ability level)
--- @field public LAOffenseEnhancement fun(): number Level of Offense Enhancement of the current group leader (not your own ability level)
--- @field public LASpellAwareness fun(): number Level of Spell Awareness of the current group leader (not your own ability level)
--- @field public Language fun(): number The EQ language number of the specified language. See below for language/number table.
--- @field public LanguageSkill fun(): number Your skill in language
--- @field public LargestFreeInventory fun(): number Size of your largest free inventory space
--- @field public LastZoned timestamp Returns a timestamp of last time you zoned
--- @field public LDoNPoints fun(): number Available LDoN points
--- @field public Level fun(): number Character Level
--- @field public ManaBonus fun(): number Mana bonus from gear and spells
--- @field public ManaRegen fun(): number Mana regeneration from last tick
--- @field public ManaRegenBonus fun(): number Mana regen bonus from gear and spells
--- @field public MaxBuffSlots fun(): number Max number of buffs you can have on you. /echo ${Me.MaxBuffSlots}
--- @field public MaxEndurance fun(): number Max endurance
--- @field public MaxHPs fun(): number Max hit points
--- @field public MaxMana fun(): number Max mana
--- @field public Mercenary fun(): string The state of your Mercenary, ACTIVE, SUSPENDED, or UNKNOWN (If it's dead). Returns NULL if you do not have a Mercenary.
--- @field public MercenaryStance fun(): string Current active mercenary stance as a string, default is NULL.
--- @field public MirEarned fun(): number Total LDoN points earned in Miragul's
--- @field public MMEarned fun(): number Total LDoN points earned in Mistmoore
--- @field public Moving fun(): boolean Moving? (including strafe)
--- @field public Name fun(): string First name
--- @field public NumGems fun(): number Returns the amount of spell gems your toon has
--- @field public Orux fun(): number Orux on your character
--- @field public PctAAExp fun(): number AA exp as a %
--- @field public PctAAVitality fun(): number Percentage of AA Vitality your toon has
--- @field public PctAggro fun(): number Your aggro percentage
--- @field public PctEndurance fun(): number Current endurance as a %
--- @field public PctExp fun(): number Experience as a %
--- @field public PctGroupLeaderExp fun(): number Group leadership exp as a %
--- @field public PctHPs fun(): number Current HP as a %
--- @field public PctMana fun(): number Current mana as a %
--- @field public PctRaidLeaderExp fun(): number Raid leadership experience as a %
--- @field public PctVitality fun(): number Percentage of Vitality the toon has
--- @field public PetBuff spell The spell in this PetBuff slot #
--- @field public Phosphenes fun(): number Phosphenes on your character
--- @field public Phosphites fun(): number Phosphites on your character
--- @field public Platinum fun(): number Platinum on your character
--- @field public PlatinumBank fun(): number Platinum in bank
--- @field public PlatinumShared fun(): number Platinum in shared bank
--- @field public Poisoned fun(): string Returns the name of any Poison spell
--- @field public RadiantCrystals fun(): number Number of Radiant Crystals on your character
--- @field public RaidAssistTarget spawn Current raid assist target (1-3)
--- @field public RaidLeaderExp fun(): number Raid leadership exp (out of 330)
--- @field public RaidLeaderPoints fun(): number Raid leadership points
--- @field public RaidMarkNPC spawn Current raid marked NPC (1-3)
--- @field public RangedReady fun(): boolean Ranged attack ready?
--- @field public RujEarned fun(): number Total LDoN points earned in Rujarkian
--- @field public Running fun(): boolean Do I have auto-run turned on?
--- @field public SecondaryPctAggro fun(): number Secondary Percentage aggro
--- @field public SecondaryAggroPlayer spawn spawninfo for secondary aggro player
--- @field public ShieldingBonus fun(): number Shielding bonus from gear and spells
--- @field public Shrouded fun(): boolean Am I Shrouded?
--- @field public Silenced fun(): string Returns the name of the Silence type effect on you
--- @field public Silver fun(): number Silver on your character
--- @field public SilverBank fun(): number Silver in bank
--- @field public Sit fun() Causes toon to sit if not already
--- @field public Skill fun(): number Skill level of skill with this name or ID #
--- @field public SkillCap fun(): number Skill cap of skill with this name or ID #
--- @field public Song buff Finds song with this name
--- @field public Spawn spawn The character's spawn
--- @field public SpellInCooldown fun(): boolean returns TRUE if you have a spell in cooldown and FALSE when not.
--- @field public SpellDamageBonus fun(): number Spell Damage bonus
--- @field public SpellRankCap fun(): number your characters spell rank cap. if it returns: 1 = Rk. I spells 2 = Rk. II spells 3 = Rk. III spells
--- @field public SpellReady fun(): boolean Gem with this spell name or in this gem # ready to cast?
--- @field public SpellShieldBonus fun(): number Spell Shield bonus from gear and spells
--- @field public STA fun(): number Character Stamina
--- @field public Stand fun() causes toon to stand if not already
--- @field public StopCast fun() Causes toon to stop casting
--- @field public STR fun(): number Character Strength
--- @field public StrikeThroughBonus fun(): number Strikethrough bonus from gear and spells
--- @field public Stunned fun(): boolean Am I stunned?
--- @field public StunResistBonus fun(): number Stun Resist bonus from gear and spells
--- @field public Subscription fun(): string Subscription type GOLD, FREE, (Silver?)
--- @field public SubscriptionDays fun(): number Returns an intUsage: /echo I have ${Me.SubscriptionDays} left before my all access expires.
--- @field public Surname fun(): string Last name
--- @field public svChromatic fun(): number Your character's lowest resist
--- @field public svCold fun(): number Character Cold Resist
--- @field public svCorruption fun(): number Character Corruption Resist
--- @field public svDisease fun(): number Character Disease Resist
--- @field public svFire fun(): number Character Fire Resist
--- @field public svMagic fun(): number Character Magic Resist
--- @field public svPoison fun(): number Character Poison Resist
--- @field public svPrismatic fun(): number The average of your character's resists
--- @field public TakEarned fun(): number Total LDoN points earned in Takish
--- @field public TargetOfTarget target Target of Target (will only work when group or raid Target of Target is active; if not, it will return NULL)
--- @field public Thirst fun(): number Thirst level
--- @field public Trader fun(): boolean if you are an active Trader
--- @field public TributeActive fun(): boolean Tribute Active
--- @field public TributeTimer ticks Tribute Timer
--- @field public UseAdvancedLooting fun(): boolean TRUE/FALSE if using advanced looting
--- @field public WIS fun(): number Character Wisdom
--- @field public XTarget xtarget Extended target data for the specified XTarget #. Note: Passing no index to this returns the fun(): number of current extended targets.
--- @field public Vitality fun(): number Total amount of Vitality your toon has
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