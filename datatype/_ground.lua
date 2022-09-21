--- @class ground
--- @field public ID number Ground item ID (not the same as item ID, this is like spawn ID)
--- @field public Distance number Distance from player to ground item
--- @field public X MQFloat X coordinate
--- @field public Y MQFloat Y coordinate
--- @field public Z MQFloat Z coordinate
--- @field public Heading heading Ground item is facing this heading
--- @field public Name string Name
--- @field public HeadingTo heading Direction player must move to meet this ground item
--- @field public LineOfSight boolean Returns TRUE if ground spawn is in line of sight
--- @field public Address number ???
--- @field public DisplayName MQFloat Displays name of the grounspawn
--- @field public Distance3D number Distance from player to ground item
--- @field public SubID number ???
--- @field public ZoneID number ???
--- @field public First MQSpawn
--- @field public Last MQSpawn
--- @field public Next MQSpawn
--- @field public Prev MQSpawn
--- @field public DoFace fun() Will cause the toon to face the called for spawn if it exists
--- @field public DoTarget fun() Will cause the toon to target the called for spawn if it exists
--- @field public Grab fun() Picks up the ground spawn
--- @field public W MQFloat X coordinate (Westward-positive)
--- @field public N MQFloat Y coordinate (Northward-positive)
--- @field public U MQFloat Z coordinate (Upward-positive)
--- @field public ToString string Same as ID