---@meta

---Flags for DragFloat(), DragInt(), SliderFloat(), SliderInt() etc.
---We use the same sets of flags for DragXXX() and SliderXXX() functions as the features are the same and it makes it easier to swap them.
---@enum ImGuiSliderFlags
ImGuiSliderFlags = {
    None               = 0,
    AlwaysClamp        = 16,  -- Clamp value to min/max bounds when input manually with CTRL+Click. By default CTRL+Click allows going out of bounds.
    Logarithmic        = 32,  -- Make the widget logarithmic (linear otherwise). Consider using ImGuiSliderFlags_NoRoundToFormat with this if using a format-string with small amount of digits.
    NoRoundToFormat    = 64,  -- Disable rounding underlying value to match precision of the display format string (e.g. %.3f values are rounded to those 3 digits)
    NoInput            = 128, -- Disable CTRL+Click or Enter key allowing to input text directly into the widget
}
