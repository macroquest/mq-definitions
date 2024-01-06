--- @class math
--- @field public Abs fun(number: number|string): MQFloat The absolute value of the result of n
--- @field public Acos fun(degrees: number|string): MQFloat Arccosine of n (in degrees)
--- @field public Asin fun(degrees: number|string): MQFloat Arcsine of n (in degrees)
--- @field public Atan fun(degrees: number|string): MQFloat Arctangent of n (in degrees)
--- @field public Cos fun(degrees: number|string): MQFloat Cosine of n (in degrees)
--- @field public Dec number Decimal value of a hexidecimal string
--- @field public Hex string Returns hexidecimal value of int n
--- @field public Not number Bitwise complement of n
--- @field public Rand number Random integer. Rand[5] range 0 to 4. Rand[100,200] range 100 to 199
--- @field public Sin fun(degrees: number|string): MQFloat Sine of n (in degrees)
--- @field public Sqrt MQFloat Square root of n
--- @field public Tan fun(degrees: number|string): MQFloat Tangent of n (in degrees)
--- @field public ToString string NULL
local math = nil

---Calculates the distance between two points on the map; 1, 2, or 3 dimensions may be provided.
---Format is y1,x1,z1:y2,x2,z2
---Defaults to your character's current location
---@param coordinates string
---@return MQFloat
function math.Distance(coordinates) end

---Performs a mathematical calculation [expression]
---@param expression string 
---@return MQFloat
function math.Calc(expression) end