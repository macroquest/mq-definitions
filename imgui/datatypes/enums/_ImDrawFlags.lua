---@meta

-- Flags for ImDrawList functions
---@enum ImDrawFlags
ImDrawFlags = {
    None                       = 0,
    Closed                     = 1,
    RoundCornersTopLeft        = 16,
    RoundCornersTopRight       = 32,
    RoundCornersBottomLeft     = 64,
    RoundCornersBottomRight    = 128,
    RoundCornersNone           = 256,
    RoundCornersTop            = 48,
    RoundCornersBottom         = 192,
    RoundCornersLeft           = 80,
    RoundCornersRight          = 160,
    RoundCornersAll            = 240,
}
