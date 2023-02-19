---@meta

---@enum ImGuiFocusedFlags
ImGuiFocusedFlags = {
  None                          = 0,
  ChildWindows                  = 1,   -- Return true if any children of the window is focused
  RootWindow                    = 2,   -- Test from root window (top most parent of the current hierarchy)
  AnyWindow                     = 4,   -- Return true if any window is focused. Important: If you are trying to tell how to dispatch your low-level inputs, do NOT use this. Use 'io.WantCaptureMouse' instead! Please read the FAQ!
  DockHierarchy                 = 6,   -- Consider docking hierarchy (treat dockspace host as parent of docked window)
  RootAndChildWindows           = 3    -- RootWindow | ChildWindows
}