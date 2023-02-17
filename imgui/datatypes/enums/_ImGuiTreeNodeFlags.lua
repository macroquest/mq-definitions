---@meta

---@enum ImGuiTreeNodeFlags
ImGuiTreeNodeFlags = {
  None = 0,
  Selected = 0, -- Draw as selected
  Framed = 0, -- Draw frame with background (e.g. for CollapsingHeader)
  AllowItemOverlap = 0, -- Hit testing to allow subsequent widgets to overlap this one
  NoTreePushOnOpen = 0, -- Don't do a TreePush() when open (e.g. for CollapsingHeader) = no extra indent nor pushing on ID stack
  NoAutoOpenOnLog = 0, -- Don't automatically and temporarily open node when Logging is active (by default logging will automatically open tree nodes)
  DefaultOpen = 0, -- Default node to be open
  OpenOnDoubleClick = 0, -- Need double-click to open node
  OpenOnArrow = 0, -- Only open when clicking on the arrow part. If ImGuiTreeNodeFlags_OpenOnDoubleClick is also set, single-click arrow or double-click all box to open.
  Leaf = 0, -- No collapsing, no arrow (use as a convenience for leaf nodes).
  Bullet = 0, -- Display a bullet instead of arrow
  FramePadding = 0, -- Use FramePadding (even for an unframed text node) to vertically align text baseline to regular widget height. Equivalent to calling AlignTextToFramePadding().
  SpanAvailWidth = 0, -- Extend hit box to the right-most edge, even if not framed. This is not the default in order to allow adding other items on the same line. In the future we may refactor the hit system to be front-to-back, allowing natural overlaps and then this can become the default.
  SpanFullWidth = 0, -- Extend hit box to the left-most and right-most edges (bypass the indented area).
  NavLeftJumpsBackHere = 0, -- (WIP) Nav: left direction may move to this TreeNode() from any of its child (items submitted between TreeNode and TreePop)
  CollapsingHeader = 0,
}
