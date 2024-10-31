--- @class netbot
--- @field public Name MQString #Name of Name.
--- @field public Zone MQInt #Zone ID of Name.
--- @field public Instance MQInt #Instance ID of Name.
--- @field public ID MQInt #Spawn ID of Name.
--- @field public Class class #Class of Name.
--- @field public Level MQInt #Level of Name.
--- @field public PctExp MQFloat #Percent Experience of Name.
--- @field public PctAAExp MQFloat #Percent AA Experience of Name.
--- @field public PctGroupLeaderExp MQFloat #Percent Group Leader Experience of Name. EMU servers only.
--- @field public CurrentHPs MQInt #Current Hitpoints of Name.
--- @field public MaxHPs MQInt #Total Hitpoints of Name
--- @field public PctHPs MQInt #Current Hitpoints percentage of Name.
--- @field public CurrentEndurance MQInt #Current Endurace of Name. Requires Extended=1 in the ini.
--- @field public MaxEndurance MQInt #Total Endurance of Name. Requires Extended=1 in the ini.
--- @field public PctEndurace MQInt #Current Endurance percentage of Name. Requires Extended=1 in the ini.
--- @field public CurrentMana MQInt #Current Mana of Name.
--- @field public MaxMana MQInt #Total Mana of Name.
--- @field public PctMana MQInt #Current Mana percentage of Name.
--- @field public PetID MQInt #Spawn ID of Name's pet.
--- @field public PetHP MQInt #Hitpoints of Name's pet.
--- @field public TargetID MQInt #Spawn ID of Name's target.
--- @field public TargetHP MQInt #Hitpoints of Name's target.
--- @field public Casting MQSpell Spell Name is casting.
--- @field public State MQString #State of Name (STUN STAND SIT DUCK BIND FEIGN DEAD UNKNOWN).
--- @field public Attacking MQBoolean #Is Name Attacking?
--- @field public AFK MQBoolean #Is Name AFK?
--- @field public Binding MQBoolean #Is Name kneeling?
--- @field public Ducking MQBoolean #Is Name ducking?
--- @field public Feigning MQBoolean #Is Name feigning?
--- @field public Grouped MQBoolean #Is Name in a group? (not necessarily your own group)
--- @field public Invis MQBoolean #Is Name invis?
--- @field public Levitating MQBoolean #Is Name levitating?
--- @field public LFG MQBoolean #Is Name LFG?
--- @field public Mounted MQBoolean #Is Name on a mount?
--- @field public Moving MQBoolean #Is Name moving?
--- @field public Detrimentals MQInt #Total of detrimental counts for Name.
--- @field public Detrimental MQString #A string list of all detrimental types affecting Name.
--- @field public Raid MQBoolean #Is Name in a raid?
--- @field public Sitting MQBoolean #Is Name sitting?
--- @field public Standing MQBoolean #Is Name standing?
--- @field public Stunned MQBoolean #Is Name stunned?
--- @field public FreeBuffSlots MQInt #Total free buff slots Name has.
--- @field public InZone MQBoolean #Is Name in the same zone as you?
--- @field public InGroup MQBoolean #Is Name in your group?
--- @field public Leader MQString #Is Name the group leader?
--- @field public Note MQString #Is Name the group leader?
--- @field public Updated MQInt #Timestamp of last NetBots update from Name.
--- @field public Stacks fun(buffId: integer): boolean Returns true if the buffId will stack on netbot.
--- @field public TotalAA MQInt #Total AAs Name has.
--- @field public UsedAA MQInt #Total spend AAs of Name.
--- @field public UnusedAA MQInt #Total unspent AAs of Name.
--- @field public CombatState MQInt #Combat State of Name.
--- @field public Counters MQInt #Cursed,etc. counters for Name.
--- @field public Cursed MQInt #Cursed counters for Name.
--- @field public Diseased MQInt #Diseased counters for Name.
--- @field public Poisoned MQInt #Poisoned counters for Name.
--- @field public Corrupted MQInt #Corrupted counters for Name.
--- @field public EnduDrain MQInt #Endurance drain counters for Name.
--- @field public LifeDrain MQInt #HP drain counters for Name.
--- @field public ManaDrain MQInt #Mana drain counters for Name.
--- @field public Blinded MQInt #Blinded counters for Name.
--- @field public CastingLevel MQInt #CastingLevel counters for Name.
--- @field public Charmed MQInt #Charmed counters for Name.
--- @field public Feared MQInt #Feared counters for Name.
--- @field public Healing MQInt #Healing counters for Name.
--- @field public Invulnerable MQInt #Invulnerable counters for Name.
--- @field public Mesmerized MQInt #Mesmerized counters for Name.
--- @field public Rooted MQInt #Rooted counters for Name.
--- @field public Silenced MQInt #Silenced counters for Name.
--- @field public Slowed MQInt #Slowed counters for Name.
--- @field public Snared MQInt #Snared counters for Name.
--- @field public SpellCost MQInt #SpellCost counters for Name.
--- @field public SpellSlowed MQInt #SpellSlowed counters for Name.
--- @field public SpellDamage MQInt #SpellDamage counters for Name.
--- @field public Trigger MQInt #Trigger counters for Name.
--- @field public Resistance MQInt #Resistance counters for Name.
--- @field public NoCure MQInt #NoCure counters for Name.
--- @field public Location MQString #The Y,X,Z location of Name.
--- @field public Heading MQString #The Heading of Name.
--- @field public MacroName MQString #The running macro of Name, empty string if none running.
--- @field public MacroState MQInt #The macro state for Name. 0=No macro running, 1=Running, 2=Paused
--- @field public NavigationActive MQBoolean #If running a MQ2Nav path for Name.
--- @field public NavigationPaused MQBoolean #If a MQ2Nav path is paused for Name.
local netbot = {}

---@return string Space delmited string with all buff spell IDs
---@overload fun(buffIndex: integer): spell
function netbot.Buff() end

---@return string Space delmited string with all buff spell IDs
---@overload fun(buffIndex: integer): spell
function netbot.PetBuff() end

---@return string Space delmited string with all buff spell IDs
---@overload fun(buffIndex: integer): spell
function netbot.ShortBuff() end