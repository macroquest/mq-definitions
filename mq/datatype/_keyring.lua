---@meta

---@class keyring # This datatype represents information about a keyring (a.k.a. a collection of mounts illusions, etc.)
---@field public Count MQInt The number of items in this keyring
---@field public Stat keyringitem|fun(): keyringitem The keyring item assigned as the stat item. 
