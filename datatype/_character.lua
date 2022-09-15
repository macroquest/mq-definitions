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
--- @field public Aura fun(n: integer): string The aura effect name
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
--- @field public Gold fun(): number Gold on character
--- @field public GoldBank fun(): number Gold in bank
--- @field public GroupAssistTarget spawn Current group assist target
--- @field public Grouped fun(): boolean Grouped?
--- @field public GroupLeaderExp fun(): number Group leadership experience (out of 330)
--- @field public GroupLeaderPoints fun(): number Group leadership points
--- @field public GroupList fun(): string Returns a string of your group members (excluding you)
--- @field public GroupSize fun(): number Size of group
--- @field public GukEarned fun(): number Total LDoN points earned in Deepest Guk
--- @field public GuildID fun(): number Returns the ID number of your guild
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
--- @field public Invulnerable fun(): string Returns the invulnerable spell name on you, can be used with spell data type ex. ${Me.Invulnerable.Spell.ID}
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
--- @field public Phosphenes fun(): number Phosphenes on your character
--- @field public Phosphites fun(): number Phosphites on your character
--- @field public Platinum fun(): number Platinum on your character
--- @field public PlatinumBank fun(): number Platinum in bank
--- @field public PlatinumShared fun(): number Platinum in shared bank
--- @field public Poisoned fun(): string Returns the name of any Poison spell
--- @field public RadiantCrystals fun(): number Number of Radiant Crystals on your character
--- @field public RaidLeaderExp fun(): number Raid leadership exp (out of 330)
--- @field public RaidLeaderPoints fun(): number Raid leadership points
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
--- @field public Spawn spawn The character's spawn
--- @field public SpellInCooldown fun(): boolean returns TRUE if you have a spell in cooldown and FALSE when not.
--- @field public SpellDamageBonus fun(): number Spell Damage bonus
--- @field public SpellRankCap fun(): number your characters spell rank cap. if it returns: 1 = Rk. I spells 2 = Rk. II spells 3 = Rk. III spells
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