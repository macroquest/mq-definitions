---@meta
---@class advlootitem # Represents a discrete item being looted in an AdvLoot window
---@field public AlwaysGreed MQBoolean # The Always Greed (AG) state of the item.
---@field public AlwaysNeed MQBoolean # The Always Need (AN) state of the item.
---@field public AutoRoll MQBoolean # The Auto Roll state (dice icon) of the item.
---@field public Corpse	MQSpawn The spawn representing the corpse that is being looted, if available.
---@field public Greed MQBoolean # The Greed (GD) state of the item.
---@field public IconID MQInt #	The ID of the icon for the item.
---@field public ID MQInt # The ID of the item.
---@field public Index MQInt The positional index of the item.
---@field public Name MQString # The name of the item.
---@field public Need MQBoolean # The Need (ND) state of the item.
---@field public Never MQBoolean # The Never (NV) state of the item.
---@field public No MQBoolean # No The No state of the item.
---@field public NoDrop MQBoolean # Indicates if the item is NO DROP.
---@field public StackSize MQInt # The size of the stack of items being looted.