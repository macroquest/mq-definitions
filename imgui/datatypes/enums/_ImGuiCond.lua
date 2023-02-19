---@meta

---@enum ImGuiCond
ImGuiCond = {
  None           = 0,  -- No condition (always set the variable), same as _Always
  Always         = 1,  -- No condition (always set the variable)
  Once           = 2,  -- Set the variable once per runtime session (only the first call will succeed)
  FirstUseEver   = 4,  -- Set the variable if the object/window has no persistently saved data (no entry in .ini file)
  Appearing      = 8,  -- Set the variable if the object/window is appearing after being hidden/inactive (or the first time)
}
