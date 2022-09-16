--- @class invslot
--- @field public ID MQInt #ID of this item slot (usable directly by /itemnotify)
--- @field public Item MQItem Item data for the item in this slot
--- @field public Name MQString #For inventory slots not inside packs, the slot name, otherwise NULL
--- @field public Pack invslot Container that must be opened to access the slot with /itemnotify
--- @field public Slot MQInt #Slot number inside the pack which holds the item, otherwise NULL
--- @field public ToString MQString #Same as ID