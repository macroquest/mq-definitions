---@meta

---@enum ImGuiTabBarFlags
ImGuiTabBarFlags = {
  None = 0,
  Reorderable = 0, -- Allow manually dragging tabs to re-order them + New tabs are appended at the end of list
  AutoSelectNewTabs = 0, -- Automatically select new tabs when they appear
  TabListPopupButton = 0, -- Disable buttons to open the tab list popup
  NoCloseWithMiddleMouseButton = 0, -- Disable behavior of closing tabs (that are submitted with p_open != NULL) with middle mouse button. You can still repro this behavior on user's side with if (IsItemHovered() && IsMouseClicked(2)) *p_open = false.
  NoTabListScrollingButtons = 0, -- Disable scrolling buttons (apply when fitting policy is ImGuiTabBarFlags_FittingPolicyScroll)
  NoTooltip = 0, -- Disable tooltips when hovering a tab
  FittingPolicyResizeDown = 0, -- Resize tabs when they don't fit
  FittingPolicyScroll = 0, -- Add scroll buttons when tabs don't fit
  FittingPolicyDefault_ = 64,
}