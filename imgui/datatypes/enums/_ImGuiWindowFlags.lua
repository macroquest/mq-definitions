---@meta

--- @enum ImGuiWindowFlags
ImGuiWindowFlags = {
  None = 0,
  NoTitleBar = 2^0,
  NoResize = 2^1,
  NoMove = 2^2,
  NoScrollbar = 2^3,
  NoScrollWithMouse = 2^4,
  NoCollapse = 2^5,
  AlwaysAutoResize = 2^6,
  NoBackground = 2^7,
  NoSavedSettings = 2^8,
  NoMouseInputs = 2^9,
  MenuBar = 2^10,
  HorizontalScrollbar = 2^11,
  NoFocusOnAppearing = 2^12,
  NoBringToFrontOnFocus = 2^13,
  AlwaysVerticalScrollbar = 2^14,
  AlwaysHorizontalScrollbar = 2^15,
  AlwaysUseWindowPadding = 2^16,
  NoNavInputs = 2^18,
  NoNavFocus = 2^19,
  UnsavedDocument = 2^20,
  NoDocking = 2^21,
  NoNav = 7627724, -- ImGuiWindowFlags.NoNavInputs | ImGuiWindowFlags.NoNavFocus
  NoDecoration = 49, -- ImGuiWindowFlags.NoTitleBar | ImGuiWindowFlags.NoResize | ImGuiWindowFlags.NoScrollbar | ImGuiWindowFlags.NoCollapse
  NoInputs = 35378424, -- ImGuiWindowFlags.NoMouseInputs | ImGuiWindowFlags.NoNavInputs | ImGuiWindowFlags.NoNavFocus
  NavFlattened = 2^23,
  ChildWindow = 2^24,
  Tooltip = 2^25,
  Popup = 2^26,
  Modal = 2^27,
  ChildMenu = 2^28,
  DockNodeHost = 2^29
}
