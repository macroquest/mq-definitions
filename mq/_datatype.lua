---@meta
---@module 'mq'

--- Macro DataType and TLO related APIs

---Represents the value held by an instance of the DataType
---@alias TypeVar any

---Represents the type of return value from a member. Can be either the name of the
---type, or an instance of the DataType.
---@alias MQType string|DataType

---Instance of a DataType created with `DataType.new`
---@class DataType
---DataType.ToString: Convert a value of the datatype into a string. The contents
---held by `value` are defined by the implementation of the datatype.
---@field public TypeName string The name of the data type.
local DataType = {}


---A function matching the signature of a datatype member:
---
--- * `index` is an optional text string passed in by the caller.
---
--- * `value` is the current value of the instance of the datatype this method belongs to. Its value
--- is defined by the implementation of the custom datatype.
---@alias DataTypeMemberFunction fun(index?: string, var?: TypeVar): type: MQType, var: TypeVar|nil

---A function matching the signature of a datatype method:
---
--- * `index` is an optional text string passed in by the caller.
---
--- * `value` is the current value of the instance of the datatype this method belongs to. Its value
--- is defined by the implementation of the custom datatype.
---@alias DataTypeMethodFunction fun(index?: string, var?: TypeVar): nil

---@class DataTypeParameters
---@field public Members table<string, DataTypeMemberFunction> | nil
---@field public Methods table<string, DataTypeMethodFunction> | nil
---@field public ToString? fun(var?: TypeVar): string Function used to convert datatype to a string


mq.DataType = {}

---Create a new DataType object
--- 
---@see DataTypeParameters
---@param name string Name of the datatype to create
---@param params DataTypeParameters Parameters that define the datatype.
---@return DataType type The definition of the datatype that is created.
function mq.DataType.new(name, params) end

---The callback function that is the implementation of the TLO.
---
--- * `index` is an optional text string that is passed in by the caller.
---
---The return value is the same for TLOs as it is for DataType members: The function
---should return both the datatype and the value of the datatype. The datatype can be
---represented as either an instance of the datatype (`DataType`) or a string
---which is the name of the datatype.
---@alias TopLevelObjectFunction fun(index?: string): type: MQType, value: TypeVar|nil

---Register a new TLO function with MacroQuest.
--- 
---@see TopLevelObjectFunction for details of the callback type.
---@param name string
---@param callback TopLevelObjectFunction
function mq.AddTopLevelObject(name, callback) end

---Remove a TLO that was previously added with AddTopLevelObject
---@param name string
---@return boolean
function mq.RemoveTopLevelObject(name) end
