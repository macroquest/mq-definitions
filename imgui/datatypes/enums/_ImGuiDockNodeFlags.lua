---@meta

---@enum ImGuiDockNodeFlags
ImGuiDockNodeFlags = {
  None                         = 0,
  KeepAliveOnly                = 1,   -- Don't display the dockspace node but keep it alive. Windows docked into this dockspace node won't be undocked.
  -- NoCentralNode              = 2,   -- Disable Central Node (the node which can stay empty)
  NoDockingInCentralNode       = 4,   -- Disable docking inside the Central Node, which will be always kept empty.
  PassthruCentralNode          = 8,   -- Enable passthru dockspace: 1) DockSpace() will render a ImGuiCol_WindowBg background covering everything excepted the Central Node when empty. Meaning the host window should probably use SetNextWindowBgAlpha(0.0f) prior to Begin() when using this. 2) When Central Node is empty: let inputs pass-through + won't display a DockingEmptyBg background. See demo for details.
  NoSplit                      = 16,   -- Disable splitting the node into smaller nodes. Useful e.g. when embedding dockspaces into a main root one (the root one may have splitting disabled to reduce confusion). Note: when turned off, existing splits will be preserved.
  NoResize                     = 32,   -- Disable resizing node using the splitter/separators. Useful with programmatically setup dockspaces.
  AutoHideTabBar               = 64    -- Tab bar will automatically hide when there is a single window in the dock node.
}