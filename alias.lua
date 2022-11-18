---@meta

--[[ Primitives ]]
---@alias MQBoolean fun(): boolean
---@alias MQInt fun(): integer
---@alias MQFloat fun(): number
---@alias MQString fun(): string

--[[ Userdata ]]
---@alias MQAltAbility altability | fun(): string|nil
---@alias MQBuff buff | fun(): string|nil
---@alias MQCachedBuff cachedbuff | fun(): string|nil
---@alias MQCharacter character | fun(): string|nil
---@alias MQFellowship fellowship | fun(): "TRUE" | "FALSE"
---@alias MQGround ground | fun(): string|nil
---@alias MQGroupMember groupmember | fun(): string|nil
---@alias MQHeading heading | fun(): string|nil
---@alias MQInvSlot invslot | fun(): string|nil
---@alias MQItem item | fun(): string|nil
---@alias MQMerchant merchant | fun(): string|nil
---@alias MQPet pet | fun(): string|'NO PET'
---@alias MQRaidMember raidmember | fun(): string|nil
---@alias MQSpawn spawn | fun(): string|nil
---@alias MQSpell spell | fun(): string|nil
---@alias MQSwitch switch | fun(): string|nil
---@alias MQTarget target | fun(): string|nil
---@alias MQWindow window | fun(): "TRUE" | "FALSE"
---@alias MQZone zone | fun(): string|nil