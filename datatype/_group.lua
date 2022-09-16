--- @class group
--- @field public AnyoneMissing MQBoolean #TRUE if someone is missing in group, offline, in other zone or simply just dead
--- @field public CasterMercCount MQFloat #count of how many Caster DPS mercenaries are in your group
--- @field public Cleric MQString #Will now return the cleric as a spawntype if a cleric is in the group (not a mercenary but a REAL cleric)
--- @field public GroupSize MQFloat #Number of members in your group, including yourself
--- @field public HealerMercCount MQFloat #count of how many Healer mercenaries are in your group
--- @field public Injured fun(amount: integer): number Will return the numbers of people in the group that has a hp percent lower than [amount]
--- @field public Leader fun(): groupmember Data on the leader of the group
--- @field public LowMana fun(amount: integer): number Will return the number of people in the group that have a mana percent lower than [amount]
--- @field public MainAssist fun(): groupmember Data on the main assist of the group
--- @field public MainTank fun(): groupmember Data on the main tank of the group
--- @field public MarkNpc fun(): groupmember Data on the group member who can mark NPCs, if one is assigned
--- @field public MasterLooter fun(): groupmember Data on the Master Looter of the group, if one is assigned
--- @field public MeleeMercCount MQFloat #count of how many Melee DPS mercenaries are in your group
--- @field public Members MQFloat #Total number of group members, excluding yourself
--- @field public MercenaryCount MQFloat #Count of how many Mercenaries are in the group
--- @field public MouseOver MQString #Returns the name of the group member your mouse is hovering over
--- @field public Offline MQBoolean #will return a TRUE if offline, and FALSE if online
--- @field public OtherZone MQBoolean #will return a Bool TRUE if online but in another zone and FALSE if online and in same zone as you.
--- @field public Puller groupmember Data on the puller of the group
--- @field public TankMercCount MQFloat #count of how many Tank mercenaries are in your group
--- @field public ToString MQString #Same as Members
Group = nil

---Accesses #th member of your group; 0 is you, 1 is the first person in the group list, etc.
---@param index integer
---@return groupmember
function Group.Member(index) end

---Which number in the group the PC with name is
---@param name string
---@return integer
function Group.Member(name) end