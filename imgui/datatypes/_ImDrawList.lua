---@meta

---@class ImDrawList
---@field public Flags ImDrawListFlags
ImDrawList = {}


---@class ImDrawListSharedData
---@field public TexUvWhitePixel ImVec2
---@field public Font ImFont
---@field public FontSize number
---@field public CurveTessellationTol number
---@field public CircleSegmentMaxError number
---@field public ClipRectFullscreen ImVec4
---@field public InitialFlags ImDrawListFlags
ImDrawListSharedData = {}

--- Constructs a new ImDrawList from ImDrawListSharedData
---@param sharedData ImDrawListSharedData
---@return ImDrawList
function ImDrawList.new(sharedData) end

--- Render-level scissoring. This is passed down to your render function but not used
--- for CPU-side coarse clipping. Prefer using higher-level ImGui.PushClipRect() to affect
--- logic (hit-testing and widget culling)
---@param clipRectMin ImVec2
---@param clipRectMax ImVec2
---@param intersectWithCurrentClipRect? boolean default: false
function ImDrawList:PushClipRect(clipRectMin, clipRectMax, intersectWithCurrentClipRect) end

function ImDrawList:PushClipRectFullScreen() end

function ImDrawList:PopClipRect() end

---@param textureId ImTextureID
function ImDrawList:PushTextureID(textureId) end

function ImDrawList:PopTextureID() end

---@return ImVec2
function ImDrawList:GetClipRectMin() end

---@return ImVec2
function ImDrawList:GetClipRectMax() end

---@param p1 ImVec2
---@param p2 ImVec2
---@param col ImU32
---@param thickness? number default: 1.0
function ImDrawList:AddLine(p1, p2, col, thickness) end

---@param pMin ImVec2
---@param pMax ImVec2
---@param col ImU32
---@param rounding? number default: 0.0
---@param flags? ImDrawFlags default: 0
---@param thickness? number default: 1.0
function ImDrawList:AddRect(pMin, pMax, col, rounding, flags, thickness) end

---@param pMin ImVec2
---@param pMax ImVec2
---@param col ImU32
---@param rounding? number default: 0.0
---@param flags? ImDrawFlags default: 0
function ImDrawList:AddRectFilled(pMin, pMax, col, rounding, flags) end

---@param pMin ImVec2
---@param pMax ImVec2
---@param colUpperLeft number
---@param colUpperRight number
---@param colBottomRight number
---@param colBottomLeft number
function ImDrawList:AddRectFilledMultiColor(pMin, pMax, colUpperLeft, colUpperRight, colBottomRight, colBottomLeft) end

---@param p1 ImVec2
---@param p2 ImVec2
---@param p3 ImVec2
---@param p4 ImVec2
---@param col ImU32
---@param thickness? number default: 1.0
function ImDrawList:AddQuad(p1, p2, p3, p4, col, thickness) end

---@param p1 ImVec2
---@param p2 ImVec2
---@param p3 ImVec2
---@param p4 ImVec2
---@param col ImU32
function ImDrawList:AddQuadFilled(p1, p2, p3, p4, col) end

---@param p1 ImVec2
---@param p2 ImVec2
---@param p3 ImVec2
---@param col ImU32
---@param thickness? number default: 1.0
function ImDrawList:AddTriangle(p1, p2, p3, col, thickness) end

---@param p1 ImVec2
---@param p2 ImVec2
---@param p3 ImVec2
---@param col ImU32
function ImDrawList:AddTriangleFilled(p1, p2, p3, col) end

---@param center ImVec2
---@param radius number
---@param col ImU32
---@param numSegments? number @default: 0 (automatic)
---@param thickness? number @default: 1.0
function ImDrawList:AddCircle(center, radius, col, numSegments, thickness) end

---@param center ImVec2
---@param radius number
---@param col ImU32
---@param numSegments? number @default: 0 (automatic)
function ImDrawList:AddCircleFilled(center, radius, col, numSegments) end

---@param center ImVec2
---@param radius number
---@param col ImU32
---@param numSegments number
---@param thickness? number @default: 1.0
function ImDrawList:AddNgon(center, radius, col, numSegments, thickness) end

---@param center ImVec2
---@param radius number
---@param col ImU32
---@param numSegments number
function ImDrawList:AddNgonFilled(center, radius, col, numSegments) end

---@param pos ImVec2
---@param col ImU32
---@param text string
function ImDrawList:AddText(pos, col, text) end

function ImDrawList:AddText(font, fontSize, pos, col, text) end

---@param points ImVec2[]
---@param col ImU32
---@param flags ImDrawFlags
---@param thickness number
function ImDrawList:AddPolyline(points, col, flags, thickness) end

---@param points ImVec2[]
---@param col ImU32
function ImDrawList:AddConvexPolyFilled(points, col) end

---@param p1 ImVec2
---@param p2 ImVec2
---@param p3 ImVec2
---@param p4 ImVec2
---@param col ImU32
---@param thickness number
---@param numSegments? number
function ImDrawList:AddBezierCubic(p1, p2, p3, p4, col, thickness, numSegments) end

---@param p1 ImVec2
---@param p2 ImVec2
---@param p3 ImVec2
---@param col ImU32
---@param thickness number
---@param numSegments? number
function ImDrawList:AddBezierQuadratic(p1, p2, p3, col, thickness, numSegments) end

---@param userTextureID ImTextureID
---@param pMin ImVec2
---@param pMax ImVec2
---@param uvMin? ImVec2  @min texture coordinate, default: (0, 0)
---@param uvMax? ImVec2  @max texture coordinate, default: (1, 1)
---@param col? ImU32  @color, default: White
function ImDrawList:AddImage(userTextureID, pMin, pMax, uvMin, uvMax, col) end

---@param userTextureID ImTextureID
---@param p1 ImVec2
---@param p2 ImVec2
---@param p3 ImVec2
---@param p4 ImVec2
---@param uv1? ImVec2  @texture coordinate 1, default: (0, 0)
---@param uv2? ImVec2  @texture coordinate 2, default: (1, 0)
---@param uv3? ImVec2  @texture coordinate 3, default: (1, 1)
---@param uv4? ImVec2  @texture coordinate 4, default: (0, 1)
---@param col? ImU32  @ color, default: white
function ImDrawList:AddImageQuad(userTextureID, p1, p2, p3, p4, uv1, uv2, uv3, uv4, col) end

---@param userTextureID ImTextureID
---@param pMin ImVec2
---@param pMax ImVec2
---@param uvMin ImVec2
---@param uvMax ImVec2
---@param col ImU32
---@param rounding number
---@param flags? ImDrawFlags  @default: None
function ImDrawList:AddImageRounded(userTextureID, pMin, pMax, uvMin, uvMax, col, rounding, flags) end

function ImDrawList:PathClear() end

---@param pos ImVec2
function ImDrawList:PathLineTo(pos) end

---@param pos ImVec2
function ImDrawList:PathLineToMergeDuplicate(pos) end

---@param col ImU32
function ImDrawList:PathFillConvex(col) end

---@param col ImU32
---@param flags? ImDrawFlags
---@param thickness? number
function ImDrawList:PathStroke(col, flags, thickness) end

---@param center ImVec2
---@param radius number
---@param aMin number
---@param aMax number
---@param numSegments? number
function ImDrawList:PathArcTo(center, radius, aMin, aMax, numSegments) end

--- Use precomputed angles for a 12 steps circle
---@param center ImVec2
---@param radius number
---@param aMinOf12 number
---@param aMaxOf12 number
function ImDrawList:PathArcToFast(center, radius, aMinOf12, aMaxOf12) end

--- Cubic bezier (4 control points)
---@param p2 ImVec2
---@param p3 ImVec2
---@param p4 ImVec2
---@param thickness number
---@param numSegments? number
function ImDrawList:PathBezierCubicCurveTo(p2, p3, p4, thickness, numSegments) end

--- Quadratic bezier (3 control points)
---@param p2 ImVec2
---@param p3 ImVec2
---@param thickness number
---@param numSegments? number
function ImDrawList:PathBezierQuadraticCurveTo(p2, p3, thickness, numSegments) end

---@param rectMin ImVec2
---@param rectMax ImVec2
---@param rounding? number
---@param flags? ImDrawFlags
function ImDrawList:PathRect(rectMin, rectMax, rounding, flags) end
