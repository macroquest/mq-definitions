--- @class target : spawn
--- @field public Aego MQCachedBuff Returns the name of the Aego spell if the Target has one
--- @field public AggroHolder spawn|fun(): spawn Returns the target's current target.
--- @field public Beneficial MQCachedBuff Returns the name of the Beneficial spell if the Target has one. This will skip "player" casted buffs, but will show NPC Casted buffs and some AA buffs.
--- @field public BuffDuration timestamp|fun(val:string|integer): timestamp Returns the duration remaining on this target buff by index number or by spell name
--- @field public BuffsPopulated MQBoolean #Returns TRUE when the target's buffs are finished populating.
--- @field public Brells MQString #Returns the name of the Brells spell if the Target has one
--- @field public Charmed MQCachedBuff Returns the name of the Charmed spell if the Target has one
--- @field public Clarity MQCachedBuff Returns the name of the Clarity spell if the Target has one
--- @field public Corrupted MQCachedBuff Returns the name of any the Corruption spell if Target has one
--- @field public Cursed MQCachedBuff Returns the name of the Curse spell if Target has one
--- @field public Crippled MQCachedBuff Returns the name of the Cripple spell if the Target has one
--- @field public Diseased MQCachedBuff Returns the name of a Disease spell if the Target has one
--- @field public Dotted MQCachedBuff Returns the name of a DOT spell if the Target has one
--- @field public DSed MQCachedBuff Returns the name of the Damage Shield spell if the Target has one
--- @field public Focus MQCachedBuff Returns the name of the Focus spell if the Target has one
--- @field public Growth MQCachedBuff Returns the name of the Growth spell if the Target has one
--- @field public Hasted MQCachedBuff Returns the name of the Haste spell if the Target has one
--- @field public HybridHP MQCachedBuff Returns the name of the Hybrid HP spell if the Target has one
--- @field public Maloed MQCachedBuff Returns the name of the Malo spell if the Target has one
--- @field public Mezzed MQCachedBuff Returns the name of the Mez spell if the Target has one
--- @field public Poisoned MQCachedBuff Returns the name of a Poison spell if the Target has one
--- @field public Pred MQCachedBuff Returns the name of the Predator spell if the Target has one
--- @field public Rooted MQCachedBuff Returns the name of the Rooted spell if the Target has one
--- @field public Regen MQCachedBuff Returns the name of the Regen spell if the Target has one
--- @field public RevDSed MQCachedBuff Returns the name of the Reverse Damage Shield spell if the Target has one
--- @field public SE MQCachedBuff Returns the name of the Spiritual Enlightenment spell if the Target has one
--- @field public Shining MQCachedBuff Returns the name of the Shining spell if the Target has one
--- @field public Skin MQCachedBuff Returns the name of the Skin spell if the Target has one
--- @field public Slowed MQCachedBuff Returns the name of the Slow spell if the Target has one
--- @field public Snared MQCachedBuff Returns the name of the Snare spell if the Target has one
--- @field public Strength MQCachedBuff Returns the name of the Strength spell if the Target has one
--- @field public SV MQCachedBuff Returns the name of the Spiritual Vitality spell if the Target has one
--- @field public Symbol MQCachedBuff Returns the name of the Symbol spell if the Target has one
--- @field public Tashed MQCachedBuff Returns the name of the Tash spell if the Target has one
--- @field public ToString string Same as Name