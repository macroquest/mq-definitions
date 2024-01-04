--- @class group
--- @field public AnyoneMissing MQBoolean # TRUE if someone is missing in group, offline, in other zone or simply just dead
--- @field public CasterMercCount MQFloat # Count of how many Caster DPS mercenaries are in your group
--- @field public Cleric MQString # Will now return the cleric as a spawntype if a cleric is in the group (not a mercenary but a REAL cleric)
--- @field public GroupSize MQFloat # Number of members in your group, including yourself
--- @field public HealerMercCount MQFloat # Count of how many Healer mercenaries are in your group
--- @field public Injured fun(amount: integer): MQInt # Will return the numbers of people in the group that has a hp percent lower than [amount]
--- @field public Leader MQGroupMember # Data on the leader of the group
--- @field public LowMana fun(amount: integer): MQInt # Will return the number of people in the group that have a mana percent lower than [amount]
--- @field public MainAssist MQGroupMember # Data on the main assist of the group
--- @field public MainTank MQGroupMember # Data on the main tank of the group
--- @field public MarkNpc MQGroupMember # Data on the group member who can mark NPCs, if one is assigned
--- @field public MasterLooter MQGroupMember # Data on the Master Looter of the group, if one is assigned
--- @field public MeleeMercCount MQFloat # Count of how many Melee DPS mercenaries are in your group
--- @field public Members MQFloat # Total number of group members, excluding yourself
--- @field public MercenaryCount MQFloat # Count of how many Mercenaries are in the group
--- @field public MouseOver MQString # Returns the name of the group member your mouse is hovering over
--- @field public Offline MQBoolean # Will return a TRUE if offline, and FALSE if online
--- @field public OtherZone MQBoolean # Will return a Bool TRUE if online but in another zone and FALSE if online and in same zone as you.
--- @field public Puller MQGroupMember # Data on the puller of the group
--- @field public TankMercCount MQFloat # Count of how many Tank mercenaries are in your group
--- @field public ToString MQString # Same as Members
Group = nil

---Accesses #th member of your group; 0 is you, 1 is the first person in the group list, etc.
---@param index integer|string
---@return MQGroupMember
function Group.Member(index) end

---Which number in the group the PC with name is
---@param name string
---@return integer
function Group.Member(name) end