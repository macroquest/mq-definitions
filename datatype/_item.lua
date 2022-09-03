--- @class item
--- @field public AC number AC value on item
--- @field public AGI number AGI value on item
--- @field public Accuracy number Accuracy
--- @field public Attack number Attack value on item
--- @field public Attuneable boolean Attuneable?
--- @field public AugRestrictions number Augment Restrictions
--- @field public Augs number Number of augs on this item
--- @field public AugSlot1 number Aug slot 1
--- @field public AugSlot2 number Aug slot 2
--- @field public AugSlot3 number Aug slot 3
--- @field public AugSlot4 number Aug slot 4
--- @field public AugSlot5 number Aug slot 5
--- @field public AugType number Augment Type
--- @field public Avoidance number Avoidance
--- @field public BuyPrice number The cost to buy this item from active merchant
--- @field public CastTime float Spell effect's cast time (in seconds)
--- @field public CHA number CHA value on item
--- @field public Charges number Charges
--- @field public Clairvoyance number Clairvoyance
--- @field public Class string Returns the #th long class name of the listed classes on an item. Items suitable for ALL classes will effectively have all 17 classes listed.
--- @field public Classes number The number of classes that can use the item. Items suitable for ALL classes will return 16.
--- @field public Clicky itemspell Activatable spell effect, if any.
--- @field public CombatEffects number CombatEffects
--- @field public Container number Number of slots, if this is a container
--- @field public DamageShieldMitigation number Damage Shield Mitigation
--- @field public DamShield number Damage Shield value on item
--- @field public Deity string Returns the #th deity of the listed deities on an item. Items with no deity restrictions will return NULL for all values of #.
--- @field public Deities number The number of deities that can use the item. Items with no deity restrictions will return 0.
--- @field public DEX number DEX value on item
--- @field public DMGBonusType string "None", "Magic", "Fire", "Cold", "Poison", "Disease"
--- @field public DoTShielding number DoT Shielding
--- @field public EffectType string Spell effect type (see below for spell effect types)
--- @field public Endurance number Endurance
--- @field public EnduranceRegen number Endurance regen
--- @field public Evolving evolving Does this item have Evolving experience on?
--- @field public FreeStack number The number of items needed to fill all the stacks of the item you have (with a stacksize of 20).If you have 3 stacks (1, 10, 20 in those stacks), you have room for 60 total and you have 31 on you, so FreeStack would return 29.
--- @field public Haste number Haste value on item
--- @field public HealAmount number HealAmount (regen?)
--- @field public HeroicAGI number Heroic AGI value on item
--- @field public HeroicCHA number Heroic CHA value on item
--- @field public HeroicDEX number Heroic DEX value on item
--- @field public HeroicINT number Heroic INT value on item
--- @field public HeroicSTA number Heroic STA value on item
--- @field public HeroicSTR number Heroic STR value on item
--- @field public HeroicSvCold number Heroic SvCold value on item
--- @field public HeroicSvCorruption number Heroic SvCorruption value on item
--- @field public HeroicSvDisease number Heroic SvDisease value on item
--- @field public HeroicSvFire number Heroic SvFire value on item
--- @field public HeroicSvMagic number Heroic SvMagic value on item
--- @field public HeroicSvPoison number Heroic SvPoison value on item
--- @field public HeroicWIS number Heroic WIS value on item
--- @field public HP number HP value on item
--- @field public HPRegen number HPRegen value on item
--- @field public Icon number Item Icon
--- @field public ID number Item ID
--- @field public InstrumentMod float Instrument Modifier Value
--- @field public INT number INT value on item
--- @field public InvSlot number Inventory Slot Number (Historic and now deprecated, use ItemSlot and ItemSlot2)
--- @field public Item item Item in #th slot, if this is a container or has augs
--- @field public ItemDelay float Returns the delay of the weapon
--- @field public ItemLink item just prints the actual hexlink for an item (not clickable) unless [CLICKABLE] is included
--- @field public Items number Number of items, if this is a container.
--- @field public ItemSlot number Item Slot number see Slot Names
--- @field public ItemSlot2 number Item Slot subnumber see Slot Names
--- @field public LDoNTheme string "All", "Deepest Guk", "Miragul's", "Mistmoore", "Rujarkian", "Takish", "Unknown"
--- @field public Lore boolean Lore?
--- @field public Magic boolean Magic?
--- @field public Mana number Mana value on item
--- @field public ManaRegen number ManaRegen value on item
--- @field public MaxPower number Max power on an power source
--- @field public MerchQuantity number Quantity of item active merchant has
--- @field public Name string Name
--- @field public NoDrop boolean No Trade?
--- @field public NoRent boolean Temporary?
--- @field public Power number Power left on power source
--- @field public Purity number Purity of item
--- @field public Race string Returns the #th long race name of the listed races on an item. Items suitable for ALL races will effectively have all 15 races listed.
--- @field public Races number The number of races that can use the item. Items suitable for ALL races will return 15.
--- @field public RequiredLevel number Returns the Required Level of an item. Items with no required level will return 0.
--- @field public SellPrice number Price to sell this item at this merchant
--- @field public Shielding number Shielding
--- @field public Size number Item size:1 SMALL2 MEDIUM3 LARGE4 GIANT
--- @field public SizeCapacity number If item is a container, size of items it can hold:1 SMALL2 MEDIUM3 LARGE4 GIANT
--- @field public Spell spell Spell effect
--- @field public SpellDamage number Spell damage
--- @field public SpellShield number SpellShield
--- @field public STA number STA value on item
--- @field public Stack number Number of items in the stack
--- @field public Stacks number Number of stacks of the item in your inventory
--- @field public Stackable boolean Stackable?
--- @field public StackCount number The total number of the stackable item in your inventory
--- @field public StackSize number Maximum number if items that can be in the stack
--- @field public STR number STR value on item
--- @field public StrikeThrough number StrikeThrough
--- @field public StunResist number Stun resist
--- @field public svCold number svCold value on item
--- @field public svCorruption number svCorruption value on item
--- @field public svDisease number svDisease value on item
--- @field public svFire number svFire value on item
--- @field public svMagic number svMagic value on item
--- @field public svPoison number svPoison value on item
--- @field public Timer ticks Returns the number of ticks remaining on an item recast timer
--- @field public TimerReady number Returns the number of seconds remaining on an item recast timer
--- @field public Tradeskills boolean Tradeskills?
--- @field public Type string Type
--- @field public Tribute number Tribute value of the item
--- @field public Value number Item value in coppers
--- @field public Weight number Item weight
--- @field public WIS number WIS value on item
--- @field public WornSlot invslot The #th invslot this item can be worn in (fingers/ears count as 2 slots)
----@field public WornSlot boolean Can item be worn in invslot with this name? (worn slots only)
--- @field public WornSlots number The number of invslots this item can be worn in (fingers/ears count as 2 slots)
--- @field public ToString string Same as Name