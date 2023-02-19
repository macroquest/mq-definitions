---@meta

---@enum ImGuiSelectableFlags
ImGuiSelectableFlags = {
    None               = 0,
    DontClosePopups    = 1,  -- Clicking this don't close parent popup window
    SpanAllColumns     = 2,  -- Selectable frame can span all columns (text will still fit in current column)
    AllowDoubleClick   = 4,  -- Generate press events on double clicks too
    Disabled           = 8,  -- Cannot be selected, display grayed out text
    AllowItemOverlap   = 16, -- (WIP) Hit testing to allow subsequent widgets to overlap this one
}
