---@meta

---@class Bit32
bit32 = {}

---Performs bitwise `or` across all provided values and returns the result
---@generic T:number
---@vararg T
---@return T
function bit32.bor(...) end

---Performs bitwise `and` across all provided values and returns the result
---@vararg number
---@return number
function bit32.band(...) end

---Performs bitwise `not` on the provided value and returns the result
---@param value number
---@return number
function bit32.bnot(value) end

---Performs bitwise `xor` (exclusive or) across the provided values and returns the result
---@vararg number
---@return number
function bit32.bxor(...) end

---Performs bitwise left shift on the provided value and returns the result
---@param value number
---@param shift number
---@return number
function bit32.lshift(value, shift) end

---Performs bitwise right shift on the provided value and returns the result
---@param value number
---@param shift number
---@return number
function bit32.rshift(value, shift) end

---Performs bitwise rotate left on the provided value and returns the result
---@param value number
---@param shift number
---@return number
function bit32.rol(value, shift) end

---Performs bitwise rotate right on the provided value and returns the result
---@param value number
---@param shift number
---@return number
function bit32.ror(value, shift) end

---Sets or clears a bit mask on the provided value, and returns the result.
---@param value number
---@param mask number
---@param enable boolean  If true, sets bits. Otherwise, clears bits.
---@return number
function bit32.setflag(value, mask, enable) end
