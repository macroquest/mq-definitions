---@meta

---@alias cursorattachmenttype "ITEM" | "MONEY" | "MEMORIZE_SPELL" | "SOCIAL" | "MENU_BUTTON" | "ABILITY" | "COMBAT" | "INVSLOT" | "SPELL_GEM" | "PET_COMMAND" | "SKILL" | "MELEE_ABILITY" | "LEADERSHIP_ABILITY" | "ITEM_LINK" | "KRONO_SLOT" | "COMMAND" | "COMBAT_ABILITY" | "MOUNT_KEYRING" | "ILLUSION_KEYRING" | "FAMILIAR_KEYRING" | "TELEPORT_KEYRING"

---@class cursorattachment # This datatype deals strictly with information items on a keyring
---@field Index MQInt The index of the cursor attachment
---@field Type cursorattachmenttype Where on this keyring list
---@field Item MQItem The item attached to the cursor
---@field Spell MQSpell The spell attached to the cursor
---@field ButtonText string The Text of the button attached to the cursor
---@field Quanity MQInt The quantity of the item attached to the cursor
---@field ItemID MQInt The ID of the item attached to the cursor
---@field IconID MQInt The Icon ID of the item attached to the cursor
