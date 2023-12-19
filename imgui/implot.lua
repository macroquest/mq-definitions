---@meta ImPlot

-- ## Macroquest ImPlot Lua Bindings
---@class ImPlot
ImPlot = {}


-- Indicates variable should deduced automatically.
IMPLOT_AUTO = -1

-- Special color used to indicate that a color should be deduced automatically.
IMPLOT_AUTO_COL = ImVec4(0, 0, 0, -1)

--
-- ## Enums and Types
--

-- Axis indices
---@enum ImAxis
ImAxis = {
    X1                         = 0,
    X2                         = 1,
    X3                         = 2,
    Y1                         = 3,
    Y2                         = 4,
    Y3                         = 5,

    COUNT                      = 6,
}

-- Options for plots (see BeginPlot).
---@enum ImPlotFlags
ImPlotFlags = {
    None                        = 0,      -- default
    NoTitle                     = 0x0001, -- the plot title will not be displayed (titles are also hidden if preceeded by double hashes, e.g. "##MyPlot")
    NoLegend                    = 0x0002, -- the legend will not be displayed
    NoMouseText                 = 0x0004, -- the mouse position, in plot coordinates, will not be displayed inside of the plot
    NoInputs                    = 0x0008, -- the user will not be able to interact with the plot
    NoMenus                     = 0x0010, -- the user will not be able to open context menus
    NoBoxSelect                 = 0x0020, -- the user will not be able to box-select
    NoFrame                     = 0x0040, -- the ImGui frame will not be rendered
    Equal                       = 0x0080, -- x and y axes pairs will be constrained to have the same units/pixel
    Crosshairs                  = 0x0100, -- the default mouse cursor will be replaced with a crosshair when hovered
    CanvasOnly                  = 0x0037, -- NoTitle | NoLegend | NoMenus | NoBoxSelect | NoMouseText
}

-- Options for plot axes (see SetupAxis).
---@enum ImPlotAxisFlags
ImPlotAxisFlags = {
    None                        = 0,      -- default
    NoLabel                     = 0x0001, -- the axis label will not be displayed (axis labels are also hidden if the supplied string name is nullptr)
    NoGridLines                 = 0x0002, -- no grid lines will be displayed
    NoTickMarks                 = 0x0004, -- no tick marks will be displayed
    NoTickLabels                = 0x0008, -- no text labels will be displayed
    NoInitialFit                = 0x0010, -- axis will not be initially fit to data extents on the first rendered frame
    NoMenus                     = 0x0020, -- the user will not be able to open context menus with right-click
    NoSideSwitch                = 0x0040, -- the user will not be able to switch the axis side by dragging it
    NoHighlight                 = 0x0080, -- the axis will not have its background highlighted when hovered or held
    Opposite                    = 0x0100, -- axis ticks and labels will be rendered on the conventionally opposite side (i.e, right or top)
    Foreground                  = 0x0200, -- grid lines will be displayed in the foreground (i.e. on top of data) instead of the background
    Invert                      = 0x0400, -- the axis will be inverted
    AutoFit                     = 0x0800, -- axis will be auto-fitting to data extents
    RangeFit                    = 0x1000, -- axis will only fit points if the point is in the visible range of the **orthogonal** axis
    PanStretch                  = 0x2000, -- panning in a locked or constrained state will cause the axis to stretch if possible
    LockMin                     = 0x4000, -- the axis minimum value will be locked when panning/zooming
    LockMax                     = 0x8000, -- the axis maximum value will be locked when panning/zooming
    Lock                        = 0xc000, -- LockMin | LockMax,
    NoDecorations               = 0x000f, -- NoLabel | NoGridLines | NoTickMarks | NoTickLabels,
    AuxDefault                  = 0x0102, -- NoGridLines | Opposite
}

-- Options for subplots (see BeginSubplot)
---@enum ImPlotSubplotFlags
ImPlotSubplotFlags = {
    None                        = 0,      -- default
    NoTitle                     = 0x0001, -- the subplot title will not be displayed (titles are also hidden if preceeded by double hashes, e.g. "##MySubplot")
    NoLegend                    = 0x0002, -- the legend will not be displayed (only applicable if ImPlotSubplotFlags_ShareItems is enabled)
    NoMenus                     = 0x0004, -- the user will not be able to open context menus with right-click
    NoResize                    = 0x0008, -- resize splitters between subplot cells will be not be provided
    NoAlign                     = 0x0010, -- subplot edges will not be aligned vertically or horizontally
    ShareItems                  = 0x0020, -- items across all subplots will be shared and rendered into a single legend entry
    LinkRows                    = 0x0040, -- link the y-axis limits of all plots in each row (does not apply to auxiliary axes)
    LinkCols                    = 0x0080, -- link the x-axis limits of all plots in each column (does not apply to auxiliary axes)
    LinkAllX                    = 0x0100, -- link the x-axis limits in every plot in the subplot (does not apply to auxiliary axes)
    LinkAllY                    = 0x0200, -- link the y-axis limits in every plot in the subplot (does not apply to auxiliary axes)
    ColMajor                    = 0x0400, -- subplots are added in column major order instead of the default row major order
}

-- Options for legends (see SetupLegend)
---@enum ImPlotLegendFlags
ImPlotLegendFlags = {
    None                        = 0,    -- default
    NoButtons                   = 0x0001, -- legend icons will not function as hide/show buttons
    NoHighlightItem             = 0x0002, -- plot items will not be highlighted when their legend entry is hovered
    NoHighlightAxis             = 0x0004, -- axes will not be highlighted when legend entries are hovered (only relevant if x/y-axis count > 1)
    NoMenus                     = 0x0008, -- the user will not be able to open context menus with right-click
    Outside                     = 0x0001, -- legend will be rendered outside of the plot area
    Horizontal                  = 0x0002, -- legend entries will be displayed horizontally
    Sort                        = 0x0004, -- legend entries will be displayed in alphabetical order
}

-- Options for mouse hover text (see SetupMouseText)
---@enum ImPlotMouseTextFlags
ImPlotMouseTextFlags = {
    None                        = 0,    -- default
    NoAuxAxes                   = 0x01, -- only show the mouse position for primary axes
    NoFormat                    = 0x02, -- axes label formatters won't be used to render text
    ShowAlways                  = 0x04, -- always display mouse position even if plot not hovered
}

-- Options for DragPoint, DragLine, DragRect
---@enum ImPlotDragToolFlags
ImPlotDragToolFlags = {
    None                        = 0,    -- default
    NoCursors                   = 0x01, -- drag tools won't change cursor icons when hovered or held
    NoFit                       = 0x02, -- the drag tool won't be considered for plot fits
    NoInputs                    = 0x04, -- lock the tool from user inputs
    Delayed                     = 0x08, -- tool rendering will be delayed one frame; useful when applying position-constraints
}

-- Flags for ColormapScale
---@enum ImPlotColormapScaleFlags
ImPlotColormapScaleFlags = {
    None                        = 0,    -- default
    NoLabel                     = 0x01, -- the colormap axis label will not be displayed
    Opposite                    = 0x02, -- render the colormap label and tick labels on the opposite side
    Invert                      = 0x04, -- invert the colormap bar and axis scale (this only affects rendering; if you only want to reverse the scale mapping, make scale_min > scale_max)
}

-- Flags for ANY PlotX function
---@enum ImPlotItemFlags
ImPlotItemFlags = {
    None                        = 0,
    NoLegend                    = 1, -- the item won't have a legend entry displayed
    NoFit                       = 2, -- the item won't be considered for plot fits
}

-- Flags for PlotLine
---@enum ImPlotLineFlags
ImPlotLineFlags = {
    None                        = 0,      -- default
    Segments                    = 0x0400, -- a line segment will be rendered from every two consecutive points
    Loop                        = 0x0800, -- the last and first point will be connected to form a closed loop
    SkipNaN                     = 0x1000, -- NaNs values will be skipped instead of rendered as missing data
    NoClip                      = 0x2000, -- markers (if displayed) on the edge of a plot will not be clipped
    Shaded                      = 0x4000, -- a filled region between the line and horizontal origin will be rendered; use PlotShaded for more advanced cases
}

-- Flags for PlotScatter
---@enum ImPlotScatterFlags
ImPlotScatterFlags = {
    None                        = 0,      -- default
    NoClip                      = 0x0400, -- markers on the edge of a plot will not be clipped
}

-- Flags for PlotStairs
---@enum ImPlotStairsFlags
ImPlotStairsFlags = {
    None                        = 0,      -- default
    PreStep                     = 0x0400, -- the y value is continued constantly to the left from every x position, i.e. the interval (x[i-1], x[i]] has the value y[i]
    Shaded                      = 0x0800, -- a filled region between the stairs and horizontal origin will be rendered; use PlotShaded for more advanced cases
}

-- Flags for PlotShaded (placeholder)
---@enum ImPlotShadedFlags
ImPlotShadedFlags = {
    None                        = 0 -- default
}

-- Flags for PlotBars
---@enum ImPlotBarsFlags
ImPlotBarsFlags = {
    None                        = 0,      -- default
    Horizontal                  = 0x0400, -- bars will be rendered horizontally on the current y-axis
}

-- Flags for PlotBarGroups
---@enum ImPlotBarGroupsFlags
ImPlotBarGroupsFlags = {
    None                        = 0,      -- default
    Horizontal                  = 0x0400, -- bar groups will be rendered horizontally on the current y-axis
    Stacked                     = 0x0800, -- items in a group will be stacked on top of each other
}

-- Flags for PlotErrorBars
---@enum ImPlotErrorBarsFlags
ImPlotErrorBarsFlags = {
    None                        = 0,      -- default
    Horizontal                  = 0x0400, -- error bars will be rendered horizontally on the current y-axis
}

-- Flags for PlotStems
---@enum ImPlotStemsFlags
ImPlotStemsFlags = {
    None                        = 0,      -- default
    Horizontal                  = 0x0400, -- stems will be rendered horizontally on the current y-axis
}

-- Flags for PlotInfLines
---@enum ImPlotInfLinesFlags
ImPlotInfLinesFlags = {
    None                        = 0,      -- default
    Horizontal                  = 0x0400, -- lines will be rendered horizontally on the current y-axis
}

-- Flags for PlotPieChart
---@enum ImPlotPieChartFlags
ImPlotPieChartFlags = {
    None                        = 0,      -- default
    Normalize                   = 0x0400, -- force normalization of pie chart values (i.e. always make a full circle if sum < 0)
    IgnoreHidden                = 0x0800, -- ignore hidden slices when drawing the pie chart (as if they were not there)
}

-- Flags for PlotHeatmap
---@enum ImPlotHeatmapFlags
ImPlotHeatmapFlags = {
    None                        = 0,      -- default
    ColMajor                    = 0x0400, -- data will be read in column major order
}

-- Flags for PlotHistogram and PlotHistogram2D
---@enum ImPlotHistogramFlags
ImPlotHistogramFlags = {
    None                        = 0,      -- default
    Horizontal                  = 0x0400, -- histogram bars will be rendered horizontally (not supported by PlotHistogram2D)
    Cumulative                  = 0x0800, -- each bin will contain its count plus the counts of all previous bins (not supported by PlotHistogram2D)
    Density                     = 0x1000, -- counts will be normalized, i.e. the PDF will be visualized, or the CDF will be visualized if Cumulative is also set
    NoOutliers                  = 0x2000, -- exclude values outside the specifed histogram range from the count toward normalizing and cumulative counts
    ColMajor                    = 0x4000, -- data will be read in column major order (not supported by PlotHistogram)
}

-- Flags for PlotDigital (placeholder)
---@enum ImPlotDigitalFlags
ImPlotDigitalFlags = {
    None                        = 0 -- default
}

-- Flags for PlotImage (placeholder)
---@enum ImPlotImageFlags
ImPlotImageFlags = {
    None                        = 0 -- default
}

-- Flags for PlotText
---@enum ImPlotTextFlags
ImPlotTextFlags = {
    None                        = 0,      -- default
    Vertical                    = 0x0400, -- text will be rendered vertically
}

-- Flags for PlotDummy (placeholder)
---@enum ImPlotDummyFlags
ImPlotDummyFlags = {
    None                        = 0 -- default
}

-- Represents a condition for SetupAxisLimits etc. (same as ImGuiCond, but we only support a subset of those enums)
---@enum ImPlotCond
ImPlotCond = {
    None                        = ImGuiCond.None,    -- No condition (always set the variable), same as Always
    Always                      = ImGuiCond.Always,  -- No condition (always set the variable)
    Once                        = ImGuiCond.Once,    -- Set the variable once per runtime session (only the first call will succeed)
}

-- Plot styling colors.
---@enum ImPlotCol
ImPlotCol = {
    -- item styling colors
    Line                        = 0,  -- plot line/outline color (defaults to next unused color in current colormap)
    Fill                        = 1,  -- plot fill color for bars (defaults to the current line color)
    MarkerOutline               = 2,  -- marker outline color (defaults to the current line color)
    MarkerFill                  = 3,  -- marker fill color (defaults to the current line color)
    ErrorBar                    = 4,  -- error bar color (defaults to ImGuiCol_Text)
    -- plot styling colors
    FrameBg                     = 5,  -- plot frame background color (defaults to ImGuiCol_FrameBg)
    PlotBg                      = 6,  -- plot area background color (defaults to ImGuiCol_WindowBg)
    PlotBorder                  = 7,  -- plot area border color (defaults to ImGuiCol_Border)
    LegendBg                    = 8,  -- legend background color (defaults to ImGuiCol_PopupBg)
    LegendBorder                = 9,  -- legend border color (defaults to ImPlotCol_PlotBorder)
    LegendText                  = 10, -- legend text color (defaults to ImPlotCol_InlayText)
    TitleText                   = 11, -- plot title text color (defaults to ImGuiCol_Text)
    InlayText                   = 12, -- color of text appearing inside of plots (defaults to ImGuiCol_Text)
    AxisText                    = 13, -- axis label and tick lables color (defaults to ImGuiCol_Text)
    AxisGrid                    = 14, -- axis grid color (defaults to 25% ImPlotCol_AxisText)
    AxisTick                    = 15, -- axis tick color (defaults to AxisGrid)
    AxisBg                      = 16, -- background color of axis hover region (defaults to transparent)
    AxisBgHovered               = 17, -- axis hover color (defaults to ImGuiCol_ButtonHovered)
    AxisBgActive                = 18, -- axis active color (defaults to ImGuiCol_ButtonActive)
    Selection                   = 19, -- box-selection color (defaults to yellow)
    Crosshairs                  = 20, -- crosshairs color (defaults to ImPlotCol_PlotBorder)
    COUNT                       = 21
}

-- Plot styling variables.
---@enum ImPlotStyleVar
ImPlotStyleVar = {
    -- item styling variables
    LineWeight                  = 0,  -- float,  plot item line weight in pixels
    Marker                      = 1,  -- int,    marker specification
    MarkerSize                  = 2,  -- float,  marker size in pixels (roughly the marker's "radius")
    MarkerWeight                = 3,  -- float,  plot outline weight of markers in pixels
    FillAlpha                   = 4,  -- float,  alpha modifier applied to all plot item fills
    ErrorBarSize                = 5,  -- float,  error bar whisker width in pixels
    ErrorBarWeight              = 6,  -- float,  error bar whisker weight in pixels
    DigitalBitHeight            = 7,  -- float,  digital channels bit height (at 1) in pixels
    DigitalBitGap               = 8,  -- float,  digital channels bit padding gap in pixels
    -- plot styling variables
    PlotBorderSize              = 9,  -- float,  thickness of border around plot area
    MinorAlpha                  = 10, -- float,  alpha multiplier applied to minor axis grid lines
    MajorTickLen                = 11, -- ImVec2, major tick lengths for X and Y axes
    MinorTickLen                = 12, -- ImVec2, minor tick lengths for X and Y axes
    MajorTickSize               = 13, -- ImVec2, line thickness of major ticks
    MinorTickSize               = 14, -- ImVec2, line thickness of minor ticks
    MajorGridSize               = 15, -- ImVec2, line thickness of major grid lines
    MinorGridSize               = 16, -- ImVec2, line thickness of minor grid lines
    PlotPadding                 = 17, -- ImVec2, padding between widget frame and plot area, labels, or outside legends (i.e. main padding)
    LabelPadding                = 18, -- ImVec2, padding between axes labels, tick labels, and plot edge
    LegendPadding               = 19, -- ImVec2, legend padding from plot edges
    LegendInnerPadding          = 20, -- ImVec2, legend inner padding from legend edges
    LegendSpacing               = 21, -- ImVec2, spacing between legend entries
    MousePosPadding             = 22, -- ImVec2, padding between plot edge and interior info text
    AnnotationPadding           = 23, -- ImVec2, text padding around annotation labels
    FitPadding                  = 24, -- ImVec2, additional fit padding as a percentage of the fit extents (e.g. ImVec2(0.1f,0.1f) adds 10% to the fit extents of X and Y)
    PlotDefaultSize             = 25, -- ImVec2, default size used when ImVec2(0,0) is passed to BeginPlot
    PlotMinSize                 = 26, -- ImVec2, minimum size plot frame can be when shrunk
    COUNT                       = 27
}

-- Axis scale
---@enum ImPlotScale
ImPlotScale = {
    Linear                      = 0, -- default linear scale
    Time                        = 1, -- date/time scale
    Log10                       = 2, -- base 10 logartithmic scale
    SymLog                      = 3, -- symmetric log scale
}

-- Marker specifications.
---@enum ImPlotMarker
ImPlotMarker = {
    None                        = -1, -- no marker
    Circle                      = 0,  -- a circle marker (default)
    Square                      = 1,  -- a square maker
    Diamond                     = 2,  -- a diamond marker
    Up                          = 3,  -- an upward-pointing triangle marker
    Down                        = 4,  -- an downward-pointing triangle marker
    Left                        = 5,  -- an leftward-pointing triangle marker
    Right                       = 6,  -- an rightward-pointing triangle marker
    Cross                       = 7,  -- a cross marker (not fillable)
    Plus                        = 8,  -- a plus marker (not fillable)
    Asterisk                    = 9,  -- a asterisk marker (not fillable)
    COUNT                       = 10,
}

-- Built-in colormaps
---@enum ImPlotColormap
ImPlotColormap = {
    Deep                        = 0,   -- a.k.a. seaborn deep             (qual=true,  n=10) (default)
    Dark                        = 1,   -- a.k.a. matplotlib "Set1"        (qual=true,  n=9 )
    Pastel                      = 2,   -- a.k.a. matplotlib "Pastel1"     (qual=true,  n=9 )
    Paired                      = 3,   -- a.k.a. matplotlib "Paired"      (qual=true,  n=12)
    Viridis                     = 4,   -- a.k.a. matplotlib "viridis"     (qual=false, n=11)
    Plasma                      = 5,   -- a.k.a. matplotlib "plasma"      (qual=false, n=11)
    Hot                         = 6,   -- a.k.a. matplotlib/MATLAB "hot"  (qual=false, n=11)
    Cool                        = 7,   -- a.k.a. matplotlib/MATLAB "cool" (qual=false, n=11)
    Pink                        = 8,   -- a.k.a. matplotlib/MATLAB "pink" (qual=false, n=11)
    Jet                         = 9,   -- a.k.a. MATLAB "jet"             (qual=false, n=11)
    Twilight                    = 10,  -- a.k.a. matplotlib "twilight"    (qual=false, n=11)
    RdBu                        = 11,  -- red/blue, Color Brewer          (qual=false, n=11)
    BrBG                        = 12,  -- brown/blue-green, Color Brewer  (qual=false, n=11)
    PiYG                        = 13,  -- pink/yellow-green, Color Brewer (qual=false, n=11)
    Spectral                    = 14,  -- color spectrum, Color Brewer    (qual=false, n=11)
    Greys                       = 15,  -- white/black                     (qual=false, n=2 )
}

-- Used to position items on a plot (e.g. legends, labels, etc.)
---@enum ImPlotLocation
ImPlotLocation = {
    Center                      = 0,                                          -- center-center
    North                       = 0x01,                                       -- top-center
    South                       = 0x02,                                       -- bottom-center
    West                        = 0x04,                                       -- center-left
    East                        = 0x08,                                       -- center-right
    NorthWest                   = ImPlotLocation.North | ImPlotLocation.West, -- top-left
    NorthEast                   = ImPlotLocation.North | ImPlotLocation.East, -- top-right
    SouthWest                   = ImPlotLocation.South | ImPlotLocation.West, -- bottom-left
    SouthEast                   = ImPlotLocation.South | ImPlotLocation.East  -- bottom-right
}

-- Enums for different automatic histogram binning methods (k = bin count or w = bin width)
---@enum ImPlotBin
ImPlotBin = {
    Sqrt                        = -1, -- k = sqrt(n)
    Sturges                     = -2, -- k = 1 + log2(n)
    Rice                        = -3, -- k = 2 * cbrt(n)
    Scott                       = -4, -- w = 3.49 * sigma / cbrt(n)
}


--
-- ## ImPlot User Types
--


-- ### ImPlotPoint
-- Double precision version of ImVec2 used by ImPlot.
---@class ImPlotPoint
---@field x number
---@field y number
---@operator add(ImPlotPoint): ImPlotPoint
---@operator add(number): ImPlotPoint
---@operator mul(ImPlotPoint): ImPlotPoint
---@operator mul(number): ImPlotPoint
---@operator div(ImPlotPoint): ImPlotPoint
---@operator div(number): ImPlotPoint
---@operator sub(ImPlotPoint): ImPlotPoint
---@operator sub(number): ImPlotPoint
ImPlotPoint = {}

---@overload fun(): ImPlotPoint
---@overload fun(point: ImVec2): ImPlotPoint
---@param x number
---@param y number
---@return ImPlotPoint
function ImPlotPoint(x, y) end


-- ### ImPlotRange
-- Range defined by a min/max value
---@class ImPlotRange
---@field Min number
---@field Max number
ImPlotRange = {}

---@return ImPlotRange
function ImPlotRange() end
---@param min number
---@param max number
---@return ImPlotRange
function ImPlotRange(min, max) end

---@param value number
---@return boolean
function ImPlotRange:Contains(value) end

---@return number
function ImPlotRange:Size() end

---@param value number
---@return number
function ImPlotRange:Clamp(value) end


-- ### ImPlotRect
-- Combination of two range limits for X and Y axes. Also an AABB defined by Min()/Max()
---@class ImPlotRect
---@field X ImPlotRange
---@field Y ImPlotRange
ImPlotRect = {}

---@return ImPlotRect
function ImPlotRect() end
---@param xMin number
---@param xMax number
---@param yMin number
---@param yMax number
---@return ImPlotRect
function ImPlotRect(xMin, xMax, yMin, yMax) end

---@param point ImPlotPoint
---@return boolean
function ImPlotRect:Contains(point) end

---@param x number
---@param y number
---@return boolean
function ImPlotRect:Contains(x, y) end

---@return ImPlotPoint
function ImPlotRect:Size() end

---@param point ImPlotPoint
---@return ImPlotPoint
function ImPlotRect:Clamp(point) end

---@param x number
---@param y number
---@return ImPlotPoint
function ImPlotRect:Clamp(x, y) end

---@return ImPlotPoint
function ImPlotRect:Min() end

---@return ImPlotPoint
function ImPlotRect:Max() end


-- ### ImPlotStyle
-- Plot style structure
---@class ImPlotStyle
---@field LineWeight number = 1,      item line weight in pixels
---@field Marker integer = ImPlotMarker_None, marker specification
---@field MarkerSize number = 4,      marker size in pixels (roughly the marker's "radius")
---@field MarkerWeight number = 1,      outline weight of markers in pixels
---@field FillAlpha number = 1,      alpha modifier applied to plot fills
---@field ErrorBarSize number = 5,      error bar whisker width in pixels
---@field ErrorBarWeight number = 1.5,    error bar whisker weight in pixels
---@field DigitalBitHeight number = 8,      digital channels bit height (at y = 1.0f) in pixels
---@field DigitalBitGap number = 4,      digital channels bit padding gap in pixels
---@field PlotBorderSize number = 1,      line thickness of border around plot area
---@field MinorAlpha number = 0.25    alpha multiplier applied to minor axis grid lines
---@field MajorTickLen ImVec2 = 10,10   major tick lengths for X and Y axes
---@field MinorTickLen ImVec2 = 5,5     minor tick lengths for X and Y axes
---@field MajorTickSize ImVec2 = 1,1     line thickness of major ticks
---@field MinorTickSize ImVec2 = 1,1     line thickness of minor ticks
---@field MajorGridSize ImVec2 = 1,1     line thickness of major grid lines
---@field MinorGridSize ImVec2 = 1,1     line thickness of minor grid lines
---@field PlotPadding ImVec2 = 10,10   padding between widget frame and plot area, labels, or outside legends (i.e. main padding)
---@field LabelPadding ImVec2 = 5,5     padding between axes labels, tick labels, and plot edge
---@field LegendPadding ImVec2 = 10,10   legend padding from plot edges
---@field LegendInnerPadding ImVec2 = 5,5     legend inner padding from legend edges
---@field LegendSpacing ImVec2 = 5,0     spacing between legend entries
---@field MousePosPadding ImVec2 = 10,10   padding between plot edge and interior mouse location text
---@field AnnotationPadding ImVec2 = 2,2     text padding around annotation labels
---@field FitPadding ImVec2 = 0,0     additional fit padding as a percentage of the fit extents (e.g. ImVec2(0.1f,0.1f) adds 10% to the fit extents of X and Y)
---@field PlotDefaultSize ImVec2 = 400,300 default size used when ImVec2(0,0) is passed to BeginPlot
---@field PlotMinSize ImVec2 = 200,150 minimum size plot frame can be when shrunk
---@field Colors ImVec4[] Array of styling colors. Indexable with ImPlotCol_ enums.
---@field Colormap ImPlotColormap The current colormap. Set this to either an ImPlotColormap_ enum or an index returned by AddColormap.
---@field UseLocalTime boolean = false,  axis labels will be formatted for your timezone when ImPlotAxisFlag_Time is enabled
---@field UseISO8601 boolean = false,  dates will be formatted according to ISO 8601 where applicable (e.g. YYYY-MM-DD, YYYY-MM, --MM-DD, etc.)
---@field Use24HourClock boolean = false,  times will be formatted using a 24 hour clock
ImPlotStyle = {}


-- ### ImPlotInputMap
-- Input mapping structure. Default values listed. See also MapInputDefault, MapInputReverse.
---@class ImPlotInputMap
---@field Pan ImGuiMouseButton LMB    enables panning when held,
---@field PanMod integer none   optional modifier that must be held for panning/fitting
---@field Fit ImGuiMouseButton LMB    initiates fit when double clicked
---@field Select ImGuiMouseButton RMB    begins box selection when pressed and confirms selection when released
---@field SelectCancel ImGuiMouseButton LMB    cancels active box selection when pressed; cannot be same as Select
---@field SelectMod integer none   optional modifier that must be held for box selection
---@field SelectHorzMod integer Alt    expands active box selection horizontally to plot edge when held
---@field SelectVertMod integer Shift  expands active box selection vertically to plot edge when held
---@field Menu ImGuiMouseButton RMB    opens context menus (if enabled) when clicked
---@field OverrideMod integer Ctrl   when held, all input is ignored; used to enable axis/plots as DND sources
---@field ZoomMod integer none   optional modifier that must be held for scroll wheel zooming
---@field ZoomRate number 0.1f   zoom rate for scroll (e.g. 0.1f = 10% plot range every scroll click); make negative to invert
ImPlotInputMap = {}


--
-- ## Aliases
--

-- Callback signature for axis tick label formatter.
---@alias ImPlotFormatter fun(value: number): string

-- Callback signature for data getter.
---@alias ImPlotGetter fun(idx: number): ImPlotPoint

-- Callback signature for axis transform.
---@alias ImPlotTransform fun(value: number): number


--
-- ## Begin/End Plot
--

-- Starts a 2D plotting context. If this function returns true, EndPlot() MUST
-- be called! You are encouraged to use the following convention:
--
-- ```lua
-- if ImPlot.BeginPlot(...) then
--     ImPlot.PlotLine(...)
--     ...
--     ImPlot.EndPlot()
-- end
-- ```
--
-- Important notes:
--
-- - `titleId` must be unique to the current ImGui ID scope. If you need to avoid ID
--   collisions or don't want to display a title in the plot, use double hashes
--   (e.g. `"MyPlot##HiddenIdText"` or `"##NoTitle"`).
-- - `size` is the **frame** size of the plot widget, not the plot area. The default
--   size of plots (i.e. when ImVec2(0,0)) can be modified in your ImPlotStyle.
---@param titleId string
---@param size? ImVec2
---@param flags? ImPlotFlags
---@return boolean show
function ImPlot.BeginPlot(titleId, size, flags) end

-- Only call EndPlot() if BeginPlot() returns true! Typically called at the end
-- of an if statement conditioned on BeginPlot().
function ImPlot.EndPlot() end


--
-- ## Begin/End Subplots
--

-- Starts a subdivided plotting context. If the function returns true,
-- EndSubplots() MUST be called! Call BeginPlot/EndPlot AT MOST [rows*cols]
-- times in  between the begining and end of the subplot context. Plots are
-- added in row major order.
--
-- Example:
--
-- ```lua
-- if ImPlot.BeginSubplots("My Subplot", 2, 3, ImVec2(800,400)) then
--     for i = 1, 6 do
--         if ImPlot.BeginPlot(...) then
--             ImPlot.PlotLine(...)
--             ...
--             ImPlot.EndPlot()
--         end
--     end
--     ImPlot.EndSubplots()
-- end
-- ```
--
-- Produces:
--
-- | [0] | [1] | [2] |
-- | --- | --- | --- |
-- | [3] | [4] | [5] |
--
-- Important notes:
--
-- - `titleId` must be unique to the current ImGui ID scope. If you need to avoid ID
--   collisions or don't want to display a title in the plot, use double hashes
--   (e.g. `"MySubplot##HiddenIdText"` or `"##NoTitle"`).
-- - `rows` and `cols` must be greater than 0.
-- - `size` is the size of the entire grid of subplots, not the individual plots
-- - `rowRatios` and `colRatios` must have AT LEAST `rows` and `cols` elements,
--   respectively. These are the sizes of the rows and columns expressed in ratios.
--   If the user adjusts the dimensions, the arrays are updated with new ratios.
--
-- Important notes regarding BeginPlot from inside of BeginSubplots:
--
-- - The `titleId` parameter of _BeginPlot_ (see above) does NOT have to be
--   unique when called inside of a subplot context. Subplot IDs are hashed
--   for your convenience so you don't have call PushID or generate unique title
--   strings. Simply pass an empty string to BeginPlot unless you want to title
--   each subplot.
-- - The `size` parameter of _BeginPlot_ (see above) is ignored when inside of a
--   subplot context. The actual size of the subplot will be based on the
--   #size value you pass to _BeginSubplots_ and `row`/`colRatios` if provided.
---@param titleId string
---@param rows number
---@param cols number
---@param size ImVec2
---@param flags? ImPlotSubplotFlags
---@param rowRatios? number[]
---@param colRatios? number[]
---@return boolean
function ImPlot.BeginSubplots(titleId, rows, cols, size, flags, rowRatios, colRatios) end

-- Only call EndSubplots() if BeginSubplots() returns true! Typically called at the end
-- of an if statement conditioned on BeginSublots().
function ImPlot.EndSubplots() end


--
-- ## Setup
--

-- The following API allows you to setup and customize various aspects of the
-- current plot. The functions should be called immediately after BeginPlot
-- and before any other API calls. Typical usage is as follows:

-- ```lua
-- if ImPlot.BeginPlot(...) then                   -- 1) begin a new plot
--     ImPlot.SetupAxis(ImAxis.X1, "My X-Axis")    -- 2) make Setup calls
--     ImPlot.SetupAxis(ImAxis.Y1, "My Y-Axis")
--     ImPlot.SetupLegend(ImPlotLocation.North)
--     ...
--     ImPlot.SetupFinish()                        -- 3) [optional] explicitly finish setup
--     ImPlot.PlotLine(...)                        -- 4) plot items
--     ...
--     ImPlot.EndPlot()                            -- 5) end the plot
-- end
-- ```
--
-- Important notes:
--
-- - Always call Setup code at the top of your BeginPlot conditional statement.
-- - Setup is locked once you start plotting or explicitly call SetupFinish.
--   Do NOT call Setup code after you begin plotting or after you make
--   any non-Setup API calls (e.g. utils like PlotToPixels also lock Setup)
-- - Calling SetupFinish is OPTIONAL, but probably good practice. If you do not
--   call it yourself, then the first subsequent plotting or utility function will
--   call it for you.

-- Enables an axis or sets the label and/or flags for an existing axis. Leave `label` = nil for no label.
---@param axis ImAxis
---@param label? string
---@param flags? ImPlotAxisFlags
function ImPlot.SetupAxis(axis, label, flags) end

-- Sets an axis range limits. If ImPlotCond.Always is used, the axes limits will be locked. Inversion with `vMin > `vMax` is not supported; use SetupAxisLimits instead.
---@param axis ImAxis
---@param vMin number
---@param vMax number
---@param cond? ImPlotCond
function ImPlot.SetupAxisLimits(axis, vMin, vMax, cond) end

-- function ImPlot.SetupAxisLinks(axis, linkMin, linkMax) end

-- Sets the format of numeric axis labels via formater specifier (default="%g"). Formated values will be double (i.e. use %f).
---@param axis ImAxis
---@param fmt string
function ImPlot.SetupAxisFormat(axis, fmt) end

-- function ImPlot.SetupAxisFormat(axis, formatter) end

-- Sets an axis' ticks and optionally the labels. To keep the default ticks, set `keepDefault`=true.
---@param axis ImAxis
---@param values number[]
---@param labels? string[]
---@param keepDefault? boolean
function ImPlot.SetupAxisTicks(axis, values, labels, keepDefault) end

-- Sets an axis' ticks and optionally the labels for the next plot. To keep the default ticks, set `keepDefault`=true.
---@param axis ImAxis
---@param vMin number
---@param vMax number
---@param nTicks integer
---@param labels? string[]
---@param keepDefault? boolean
function ImPlot.SetupAxisTicks(axis, vMin, vMax, nTicks, labels, keepDefault) end

-- Sets an axis' scale using built-in options.
---@param axis ImAxis
---@param scale ImPlotScale
function ImPlot.SetupAxisScale(axis, scale) end

-- function ImPlot.SetupAxisScale(axis, forward, inverse) end

-- Sets an axis' limits constraints.
---@param axis ImAxis
---@param vMin number
---@param vMax number
function ImPlot.SetupAxisLimitsConstraints(axis, vMin, vMax) end

-- Sets an axis' zoom constraints.
---@param axis ImAxis
---@param zMin number
---@param zMax number
function ImPlot.SetupAxisZoomConstraints(axis, zMin, zMax) end

-- Sets the label and/or flags for primary X and Y axes (shorthand for two calls to SetupAxis).
---@param xLabel string | nil
---@param yLabel string | nil
---@param xFlags? ImPlotAxisFlags
---@param yFlags? ImPlotAxisFlags
function ImPlot.SetupAxes(xLabel, yLabel, xFlags, yFlags) end

-- Sets the primary X and Y axes range limits. If ImPlotCond.Always is used, the axes limits will be locked (shorthand for two calls to SetupAxisLimits).
---@param xMin number
---@param xMax number
---@param yMin number
---@param yMax number
---@param cond? ImPlotCond
function ImPlot.SetupAxesLimits(xMin, xMax, yMin, yMax, cond) end

-- Sets up the plot legend. This can also be called immediately after BeginSubplots when using ImPlotSubplotFlags_ShareItems.
---@param location ImPlotLocation
---@param flags? ImPlotLegendFlags
function ImPlot.SetupLegend(location, flags) end

-- Set the location of the current plot's mouse position text (default = South|East).
---@param location ImPlotLocation
---@param flags? ImPlotMouseTextFlags
function ImPlot.SetupMouseText(location, flags) end

-- Explicitly finalize plot setup. Once you call this, you cannot make anymore Setup calls for the current plot!
-- Note that calling this function is OPTIONAL; it will be called by the first subsequent setup-locking API call.
function ImPlot.SetupFinish() end


--
-- ## SetNext
--

-- Though you should default to the `Setup` API above, there are some scenarios
-- where (re)configuring a plot or axis before `BeginPlot` is needed (e.g. if
-- using a preceding button or slider widget to change the plot limits). In
-- this case, you can use the `SetNext` API below. While this is not as feature
-- rich as the Setup API, most common needs are provided. These functions can be
-- called anwhere except for inside of `Begin/EndPlot`. For example:
--
-- ```lua
-- if ImGui.Button("Center Plot") then
--     ImPlot.SetNextPlotLimits(-1, 1, -1, 1);
-- end
-- if ImPlot.BeginPlot(...) then
--     ...
--     ImPlot.EndPlot()
-- end
-- ```
--
-- Important notes:
--
-- - You must still enable non-default axes with SetupAxis for these functions
--   to work properly.

-- Sets an upcoming axis range limits. If ImPlotCond.Always is used, the axes limits will be locked.
---@param axis ImAxis
---@param vMin number
---@param vMax number
---@param cond? ImPlotCond
function ImPlot.SetNextAxisLimits(axis, vMin, vMax, cond) end

-- SetNextAxisLinks

-- Sets an upcoming axis range limits. If ImPlotCond.Always is used, the axes limits will be locked.
---@param axis ImAxis
function ImPlot.SetNextAxisToFit(axis) end

-- Sets the upcoming primary X and Y axes range limits. If ImPlotCond.Always is used, the axes limits will be locked (shorthand for two calls to SetupAxisLimits).
---@param xMin number
---@param xMax number
---@param yMin number
---@param yMax number
---@param cond ImPlotCond
function ImPlot.SetNextAxesLimits(xMin, xMax, yMin, yMax, cond) end

-- Sets all upcoming axes to auto fit to their data.
function ImPlot.SetNextAxesToFit() end


--
-- ## Plot Items
--

-- Note: Everything below was intended for c++ code. Some parts of this may be
-- relevant for lua.
--
-- The main plotting API is provied below. Call these functions between
-- Begin/EndPlot and after any Setup API calls. Each plots data on the current
-- x and y axes, which can be changed with `SetAxis/Axes`.
--
-- The templated functions are explicitly instantiated in implot_items.cpp.
-- They are not intended to be used generically with custom types. You will get
-- a linker error if you try! All functions support the following scalar types:
--
-- float, double, ImS8, ImU8, ImS16, ImU16, ImS32, ImU32, ImS64, ImU64
--
--
-- If you need to plot custom or non-homogenous data you have a few options:
--
-- 1. If your data is a simple struct/class (e.g. Vector2f), you can use striding.
--    This is the most performant option if applicable.
--
--    struct Vector2f { float X, Y; };
--    ...
--    Vector2f data[42];
--    ImPlot::PlotLine("line", &data[0].x, &data[0].y, 42, 0, 0, sizeof(Vector2f));
--
-- 2. Write a custom getter C function or C++ lambda and pass it and optionally your data to
--    an ImPlot function post-fixed with a G (e.g. PlotScatterG). This has a slight performance
--    cost, but probably not enough to worry about unless your data is very large. Examples:
--
--    ImPlotPoint MyDataGetter(void* data, int idx) {
--        MyData* my_data = (MyData*)data;
--        ImPlotPoint p;
--        p.x = my_data->GetTime(idx);
--        p.y = my_data->GetValue(idx);
--        return p
--    }
--    ...
--    auto my_lambda = [](int idx, void*) {
--        double t = idx / 999.0;
--        return ImPlotPoint(t, 0.5+0.5*std::sin(2*PI*10*t));
--    };
--    ...
--    if (ImPlot::BeginPlot("MyPlot")) {
--        MyData my_data;
--        ImPlot::PlotScatterG("scatter", MyDataGetter, &my_data, my_data.Size());
--        ImPlot::PlotLineG("line", my_lambda, nullptr, 1000);
--        ImPlot::EndPlot();
--    }
--
-- NB: All types are converted to double before plotting. You may lose information
-- if you try plotting extremely large 64-bit integral types. Proceed with caution!
--
-- Some notes on the lua implementation of plotting functions:
-- - `stride` is counted as a number of element. If you have a table with 8 elements, and the stride is 2,
--   then you should not have a count greater than 4! The default stride is 1.

-- ### PlotLine
-- Plots a standard 2D line plot.
---@param labelId string
---@param values number[]
---@param count integer
---@param xscale? number
---@param yscale? number
---@param xstart? number
---@param flags? ImPlotLineFlags | ImPlotItemFlags
---@param offset? integer
---@param stride? integer
function ImPlot.PlotLine(labelId, values, count, xscale, yscale, xstart, flags, offset, stride) end
---@param labelId string
---@param xs number[]
---@param ys number[]
---@param count number
---@param flags? ImPlotLineFlags | ImPlotItemFlags
---@param offset? integer
---@param stride? integer
function ImPlot.PlotLine(labelId, xs, ys, count, flags, offset, stride) end
---@param labelId string
---@param getter ImPlotGetter
---@param flags? ImPlotLineFlags | ImPlotItemFlags
function ImPlot.PlotLine(labelId, getter, flags) end

-- ### PlotScatter
-- Plots a standard 2D scatter plot. Default marker is ImPlotMarker.Circle.
---@param labelId string
---@param values number[]
---@param count integer
---@param xscale? number
---@param yscale? number
---@param xstart? number
---@param flags? ImPlotScatterFlags | ImPlotItemFlags
---@param offset? integer
---@param stride? integer
function ImPlot.PlotScatter(labelId, values, count, xscale, yscale, xstart, flags, offset, stride) end
---@param labelId string
---@param xs number[]
---@param ys number[]
---@param count integer
---@param flags? ImPlotScatterFlags | ImPlotItemFlags
---@param offset? integer
---@param stride? integer
function ImPlot.PlotScatter(labelId, xs, ys, count, flags, offset, stride) end
---@param labelId string
---@param getter ImPlotGetter
---@param count integer
---@param flags? ImPlotScatterFlags | ImPlotItemFlags
function ImPlot.PlotScatter(labelId, getter, count, flags) end

-- Plots a a stairstep graph. The y value is continued constantly to the right from every x position, i.e. the interval [x[i], x[i+1]) has the value y[i]
---@param labelId string
---@param values number[]
---@param count integer
---@param xscale? number
---@param xstart? number
---@param flags? ImPlotStairsFlags | ImPlotItemFlags
---@param offset? integer
---@param stride? integer
function ImPlot.PlotStairs(labelId, values, count, xscale, xstart, flags, offset, stride) end
---@param labelId string
---@param xs number[]
---@param ys number[]
---@param count integer
---@param flags? ImPlotStairsFlags | ImPlotItemFlags
---@param offset? integer
---@param stride? integer
function ImPlot.PlotStairs(labelId, xs, ys, count, flags, offset, stride) end
---@param labelId string
---@param getter ImPlotGetter
---@param count integer
---@param flags? ImPlotStairsFlags | ImPlotItemFlags
function ImPlot.PlotStairs(labelId, getter, count, flags) end

-- Plots a shaded (filled) region between two lines, or a line and a horizontal reference. Set yref to +/-INFINITY for infinite fill extents.
---@param labelId string
---@param values number[]
---@param count integer
---@param yref? number
---@param xscale? number
---@param xstart? number
---@param flags? ImPlotShadedFlags | ImPlotItemFlags
---@param offset? integer
---@param stride? integer
function ImPlot.PlotShaded(labelId, values, count, yref, xscale, xstart, flags, offset, stride) end
---@param labelId string
---@param xs number[]
---@param ys number[]
---@param count integer
---@param yref? number
---@param flags? ImPlotShadedFlags | ImPlotItemFlags
---@param offset? integer
---@param stride? integer
function ImPlot.PlotShaded(labelId, xs, ys, count, yref, flags, offset, stride) end
---@param labelId string
---@param xs number[]
---@param ys1 number[]
---@param ys2 number[]
---@param count integer
---@param flags? ImPlotShadedFlags | ImPlotItemFlags
---@param offset? integer
---@param stride? integer
function ImPlot.PlotShaded(labelId, xs, ys1, ys2, count, flags, offset, stride) end
---@param labelId string
---@param getter1 ImPlotGetter
---@param getter2 ImPlotGetter
---@param count integer
---@param flags ImPlotShadedFlags | ImPlotItemFlags
function ImPlot.PlotShaded(labelId, getter1, getter2, count, flags) end

-- Plots a bar graph. Vertical by default. `barSize` and `shift` are in plot units.
---@param labelId string
---@param values number[]
---@param count integer
---@param barSize? number
---@param shift? number
---@param flags? ImPlotBarsFlags | ImPlotItemFlags
---@param offset? integer
---@param stride? integer
function ImPlot.PlotBars(labelId, values, count, barSize, shift, flags, offset, stride) end
---@param labelId string
---@param xs number[]
---@param ys number[]
---@param count integer
---@param barSize number
---@param flags? ImPlotBarsFlags | ImPlotItemFlags
---@param offset? integer
---@param stride? integer
function ImPlot.PlotBars(labelId, xs, ys, count, barSize, flags, offset, stride) end
---@param labelId string
---@param getter ImPlotGetter
---@param count integer
---@param barSize number
---@param flags ImPlotBarsFlags | ImPlotItemFlags
function ImPlot.PlotBars(labelId, getter, count, barSize, flags) end

-- Plots a group of bars. `values` is a row-major matrix with `itemCount` rows and `groupCount` cols.  `labelIds` should have `itemCount` elements.
---@param labelIds string[]
---@param values number[]
---@param itemCount integer
---@param groupCount integer
---@param groupSize? number
---@param shift? number
---@param flags? ImPlotBarGroupsFlags | ImPlotItemFlags
function ImPlot.PlotBarGroups(labelIds, values, itemCount, groupCount, groupSize, shift, flags) end


-- Plots vertical error bar. The labelId should be the same as the labelId of the associated line or bar plot.
---@param labelId string
---@param xs number[]
---@param ys number[]
---@param err number[]
---@param count integer
---@param flags? ImPlotErrorBarsFlags | ImPlotItemFlags
---@param offset? integer
---@param stride? integer
function ImPlot.PlotErrorBars(labelId, xs, ys, err, count, flags, offset, stride) end
---@param labelId string
---@param xs number[]
---@param ys number[]
---@param neg number[]
---@param pos number[]
---@param count integer
---@param flags? ImPlotErrorBarsFlags | ImPlotItemFlags
---@param offset? integer
---@param stride? integer
function ImPlot.PlotErrorBars(labelId, xs, ys, neg, pos, count, flags, offset, stride) end

-- Plots stems. Vertical by default.
---@param labelId string
---@param values number[]
---@param count number
---@param ref? number
---@param scale? number
---@param start? number
---@param flags? ImPlotStemsFlags | ImPlotItemFlags
---@param offset? integer
---@param stride? integer
function ImPlot.PlotStems(labelId, values, count, ref, scale, start, flags, offset, stride) end
---@param labelId string
---@param xs number[]
---@param ys number[]
---@param count integer
---@param ref? number
---@param flags? ImPlotStemsFlags | ImPlotItemFlags
---@param offset? integer
---@param stride? integer
function ImPlot.PlotStems(labelId, xs, ys, count, ref, flags, offset, stride) end

-- Plots infinite vertical or horizontal lines (e.g. for references or asymptotes).
---@param labelId string
---@param values number[]
---@param count integer
---@param flags? ImPlotInfLinesFlags | ImPlotItemFlags
---@param offset? integer
---@param stride? integer
function ImPlot.PlotInfLines(labelId, values, count, flags, offset, stride) end

-- Plots a pie chart. Center and radius are in plot units. #label_fmt can be set to nullptr for no labels.
---@param labelIds string[]
---@param values number[]
---@params count integer
---@param x number
---@param y number
---@param radius number
---@param formatter ImPlotFormatter
---@param angle0? number
---@param flags? ImPlotPieChartFlags | ImPlotItemFlags
function ImPlot.PlotPieChart(labelIds, values, count, x, y, radius, formatter, angle0, flags) end
---@param labelIds string
---@param values number[]
---@param count integer
---@param x number
---@param y number
---@param radius number
---@param labelFmt? string
---@param angle0? number
---@param flags? ImPlotPieChartFlags | ImPlotItemFlags
function ImPlot.PlotPieChart(labelIds, values, count, x, y, radius, labelFmt, angle0, flags) end

-- Plots a 2D heatmap chart. Values are expected to be in row-major order by default. Leave `scaleMin` and `scaleMax`
-- both at 0 for automatic color scaling, or set them to a predefined range. `labelFmt` can be set to nullptr for no labels.
---@param labelId string
---@param values number[]
---@param rows integer
---@param col integer
---@param scaleMin? number
---@param scaleMax? number
---@param labelFmt? string
---@param boundsMin? ImPlotPoint
---@param boundsMax? ImPlotPoint
---@param flags? ImPlotHeatmapFlags | ImPlotItemFlags
function ImPlot.PlotHeatmap(labelId, values, rows, col, scaleMin, scaleMax, labelFmt, boundsMin, boundsMax, flags) end

-- Plots a horizontal histogram. `bins` can be a positive integer or an ImPlotBin method. If `range` is left unspecified, the min/max of `values` will be used as the range.
-- Otherwise, outlier values outside of the range are not binned. The largest bin count or density is returned.
---@param labelId string
---@param values number[]
---@param bins? ImPlotBin | integer
---@param barScale? number
---@param range? ImPlotRange
---@param flags? ImPlotHistogramFlags | ImPlotItemFlags
---@return number
function ImPlot.PlotHistogram(labelId, values, bins, barScale, range, flags) end

-- Plots two dimensional, bivariate histogram as a heatmap. `xBins` and `yBins` can be a positive integer or an ImPlotBin. If `range` is left unspecified, the min/max of
-- `xs` an `ys` will be used as the ranges. Otherwise, outlier values outside of range are not binned. The largest bin count or density is returned.
---@param labelId string
---@param xs number[]
---@param ys number[]
---@param count integer
---@param xBins? ImPlotBin | integer
---@param yBins? ImPlotBin | integer
---@param range? ImPlotRect
---@param flags? ImPlotHistogramFlags | ImPlotItemFlags
---@return number
function ImPlot.PlotHistogram2D(labelId, xs, ys, count, xBins, yBins, range, flags) end

-- Plots digital data. Digital plots do not respond to y drag or zoom, and are always referenced to the bottom of the plot.
---@param labelId string
---@param xs number[]
---@param ys number[]
---@param count integer
---@param flags? ImPlotDigitalFlags | ImPlotItemFlags
---@param offset? integer
---@param stride? integer
function ImPlot.PlotDigital(labelId, xs, ys, count, flags, offset, stride) end
---@param labelId string
---@param getter ImPlotGetter
---@param count integer
---@param flags ImPlotDigitalFlags | ImPlotItemFlags
function ImPlot.PlotDigital(labelId, getter, count, flags) end

-- Plots an axis-aligned image. #bounds_min/bounds_max are in plot coordinates (y-up) and #uv0/uv1 are in texture coordinates (y-down).
---@param labelId string
---@param userTextureID ImTextureID
---@param boundsMin ImPlotPoint
---@param boundsMax ImPlotPoint
---@param uv0? ImVec2
---@param uv1? ImVec2
---@param tintCol? ImVec4
---@param flags? ImPlotImageFlags | ImPlotItemFlags
function ImPlot.PlotImage(labelId, userTextureID, boundsMin, boundsMax, uv0, uv1, tintCol, flags) end

-- Plots a centered text label at point x,y with an optional pixel offset. Text color can be changed with ImPlot::PushStyleColor(ImPlotCol_InlayText, ...).
---@param text string
---@param x number
---@param y number
---@param pixOffset? ImVec2
---@param flags? ImPlotTextFlags | ImPlotItemFlags
function ImPlot.PlotText(text, x, y, pixOffset, flags) end

-- Plots a dummy item (i.e. adds a legend entry colored by ImPlotCol_Line)
---@param labelId string
---@param flags ImPlotDummyFlags | ImPlotItemFlags
function ImPlot.PlotDummy(labelId, flags) end


--
-- ## Plot Tools
--

-- The following can be used to render interactive elements and/or annotations.
-- Like the item plotting functions above, they apply to the current x and y
-- axes, which can be changed with `SetAxis/SetAxes`. These functions return true
-- when user interaction causes the provided coordinates to change. Additional
-- user interactions can be retrieved through the optional output parameters.

-- Shows a draggable point at x,y. `col` defaults to ImGuiCol.Text.
---@param id integer
---@param x number
---@param y number
---@param col ImVec4
---@param size? number
---@param flags? ImPlotDragToolFlags
---@return boolean modified
---@return number x
---@return number y
---@return boolean clicked
---@return boolean hovered
---@return boolean held
function ImPlot.DragPoint(id, x, y, col, size, flags) end

-- Shows a draggable vertical guide line at an x-value. `col` defaults to ImGuiCol.Text.
---@param id integer
---@param x number
---@param col ImVec4
---@param thickness? number
---@param flags? ImPlotDragToolFlags
---@return boolean modified
---@return number x
---@return boolean clicked
---@return boolean hovered
---@return boolean held
function ImPlot.DragLineX(id, x, col, thickness, flags) end

-- Shows a draggable horizontal guide line at a y-value. `col` defaults to ImGuiCol.Text.
---@param id integer
---@param y number
---@param col ImVec4
---@param thickness? number
---@param flags? ImPlotDragToolFlags
---@return boolean modified
---@return number y
---@return boolean clicked
---@return boolean hovered
---@return boolean held
function ImPlot.DragLineY(id, y, col, thickness, flags) end

-- Shows a draggable and resizeable rectangle.
---@param id integer
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param col ImVec4
---@param flags? ImPlotDragToolFlags
---@return boolean modified
---@return number x1
---@return number y1
---@return number x2
---@return number y2
---@return boolean clicked
---@return boolean hovered
---@return boolean held
function ImPlot.DragRect(id, x1, y1, x2, y2, col, flags) end

-- Shows an annotation callout at a chosen point. Clamping keeps annotations in the plot area. Annotations are always rendered on top.
---@param x number
---@param y number
---@param col ImVec4
---@param pixOffset ImVec2
---@param clamp boolean
---@param round? boolean
function ImPlot.Annotation(x, y, col, pixOffset, clamp, round) end
---@param x number
---@param y number
---@param col ImVec4
---@param pixOffset ImVec2
---@param clamp boolean
---@param text string
---@vararg any
function ImPlot.Annotation(x, y, col, pixOffset, clamp, text, ...) end

-- Shows a x-axis tag at the specified coordinate value.
---@param x number
---@param col ImVec4
---@param round? boolean
function ImPlot.TagX(x, col, round) end
---@param x number
---@param col ImVec4
---@param text string
---@vararg any
function ImPlot.TagX(x, col, text, ...) end

-- Shows a y-axis tag at the specified coordinate value.
---@param y number
---@param col ImVec4
---@param round? boolean
function ImPlot.TagY(y, col, round) end
---@param y number
---@param col ImVec4
---@param text string
---@vararg any
function ImPlot.TagY(y, col, text, ...) end


--
-- ## Plot Utils
--

-- Select which axis/axes will be used for subsequent plot elements.
---@param axis ImAxis
function ImPlot.SetAxis(axis) end

-- Select which axis/axes will be used for subsequent plot elements.
---@param xAxis ImAxis
---@param yAxis ImAxis
function ImPlot.SetAxes(xAxis, yAxis) end

-- Convert pixels to a position in the current plot's coordinate system. Passing IMPLOT_AUTO uses the current axes.
---@param pix ImVec2
---@param xAxis? ImAxis
---@param yAxis? ImAxis
---@return ImPlotPoint
function ImPlot.PixelsToPlot(pix, xAxis, yAxis) end
---@param x number
---@param y number
---@param xAxis? ImAxis
---@param yAxis? ImAxis
---@return ImPlotPoint
function ImPlot.PixelsToPlot(x, y, xAxis, yAxis) end

-- Convert a position in the current plot's coordinate system to pixels. Passing IMPLOT_AUTO uses the current axes.
---@param plt ImPlotPoint
---@param xAxis? ImAxis
---@param yAxis? ImAxis
---@return ImVec2
function ImPlot.PlotToPixels(plt, xAxis, yAxis) end
---@param x number
---@param y number
---@param xAxis? ImAxis
---@param yAxis? ImAxis
---@return ImVec2
function ImPlot.PlotToPixels(x, y, xAxis, yAxis) end

-- Get the current Plot position (top-left) in pixels.
---@return ImVec2
function ImPlot.GetPlotPos() end

-- Get the curent Plot size in pixels.
---@return ImVec2
function ImPlot.GetPlotSize() end

-- Returns the mouse position in x,y coordinates of the current plot. Passing IMPLOT_AUTO uses the current axes.
---@param xAxis? ImAxis
---@param yAxis? ImAxis
---@return ImPlotPoint
function ImPlot.GetPlotMousePos(xAxis, yAxis) end

-- Returns the current plot axis range.
---@param xAxis? ImAxis
---@param yAxis? ImAxis
---@return ImPlotRect
function ImPlot.GetPlotLimits(xAxis, yAxis) end

-- Returns true if the plot area in the current plot is hovered.
---@return boolean
function ImPlot.IsPlotHovered() end

-- Returns true if the axis label area in the current plot is hovered.
---@param axis ImAxis
---@return boolean
function ImPlot.IsAxisHovered(axis) end

-- Returns true if the bounding frame of a subplot is hovered.
---@return boolean
function ImPlot.IsSubplotsHovered() end

-- Returns true if the current plot is being box selected.
---@return boolean
function ImPlot.IsPlotSelected() end

-- Returns the current plot box selection bounds. Passing IMPLOT_AUTO uses the current axes.
---@param xAxis? ImAxis
---@param yAxis? ImAxis
---@return ImPlotRect
function ImPlot.GetPlotSelection(xAxis, yAxis) end

-- Cancels a the current plot box selection.
function ImPlot.CancelPlotSelection() end

-- Hides or shows the next plot item (i.e. as if it were toggled from the legend).
-- Use ImPlotCond_Always if you need to forcefully set this every frame.
---@param hidden? boolean
---@param cond? ImPlotCond
function ImPlot.HideNextItem(hidden, cond) end

-- Use the following around calls to Begin/EndPlot to align l/r/t/b padding.
-- Consider using Begin/EndSubplots first. They are more feature rich and
-- accomplish the same behaviour by default. The functions below offer lower
-- level control of plot alignment.
--
-- Align axis padding over multiple plots in a single row or column. `groupId` must
-- be unique. If this function returns true, EndAlignedPlots() must be called.
---@param groupId string
---@param vertical? boolean
function ImPlot.BeginAlignedPlots(groupId, vertical) end

-- Only call EndAlignedPlots() if BeginAlignedPlots() returns true!
function ImPlot.EndAlignedPlots() end


--
-- ## Legend Utils
--

-- Begin a popup for a legend entry.
---@param labelId string
---@param mouseButton? ImGuiMouseButton
function ImPlot.BeginLegendPopup(labelId, mouseButton) end

-- End a popup for a legend entry.
function ImPlot.EndLegendPopup() end

-- Returns true if a plot item legend entry is hovered.
---@param labelId string
function ImPlot.IsLegendEntryHovered(labelId) end


--
-- ## Drag and Drop
--

-- Turns the current plot's plotting area into a drag and drop target. Don't forget to call EndDragDropTarget!
---@return boolean
function ImPlot.BeginDragDropTargetPlot() end

-- Turns the current plot's X-axis into a drag and drop target. Don't forget to call EndDragDropTarget!
---@return boolean
function ImPlot.BeginDragDropTargetAxis(axis) end

-- Turns the current plot's legend into a drag and drop target. Don't forget to call EndDragDropTarget!
---@return boolean
function ImPlot.BeginDragDropTargetLegend() end

-- Ends a drag and drop target (currently just an alias for ImGui.EndDragDropTarget).
function ImPlot.EndDragDropTarget() end

-- NB: By default, plot and axes drag and drop *sources* require holding the Ctrl modifier to initiate the drag.
-- You can change the modifier if desired. If ImGuiMod.None is provided, the axes will be locked from panning.

-- Turns the current plot's plotting area into a drag and drop source. You must hold Ctrl. Don't forget to call EndDragDropSource!
---@param flags? ImGuiDragDropFlags
function ImPlot.BeginDragDropSourcePlot(flags) end

-- Turns the current plot's X-axis into a drag and drop source. You must hold Ctrl. Don't forget to call EndDragDropSource!
---@param axis ImAxis
---@param flags? ImGuiDragDropFlags
function ImPlot.BeginDragDropSourceAxis(axis, flags) end

-- Turns an item in the current plot's legend into drag and drop source. Don't forget to call EndDragDropSource!
---@param labelId string
---@param flags? ImGuiDragDropFlags
function ImPlot.BeginDragDropSourceItem(labelId, flags) end

-- Ends a drag and drop source (currently just an alias for ImGui.EndDragDropSource).
function ImPlot.EndDragDropSource() end

--
-- ## Styling
--

-- Styling colors in ImPlot works similarly to styling colors in ImGui, but
-- with one important difference. Like ImGui, all style colors are stored in an
-- indexable array in ImPlotStyle. You can permanently modify these values through
-- GetStyle().Colors, or temporarily modify them with Push/Pop functions below.
-- However, by default all style colors in ImPlot default to a special color
-- `IMPLOT_AUTO_COL`. The behavior of this color depends upon the style color to
-- which it as applied:
--
-- 1. For style colors associated with plot items (e.g. ImPlotCol.Line),
--    `IMPLOT_AUTO_COL` tells ImPlot to color the item with the next unused
--    color in the current colormap. Thus, every item will have a different
--    color up to the number of colors in the colormap, at which point the
--    colormap will roll over. For most use cases, you should not need to
--    set these style colors to anything but `IMPLOT_AUTO_COL`; you are
--    probably better off changing the current colormap. However, if you
--    need to explicitly color a particular item you may either Push/Pop
--    the style color around the item in question, or use the SetNextXXXStyle
--    API below. If you permanently set one of these style colors to a specific
--    color, or forget to call Pop, then all subsequent items will be styled
--    with the color you set.
--
-- 2. For style colors associated with plot styling (e.g. ImPlotCol.PlotBg),
--    `IMPLOT_AUTO_COL` tells ImPlot to set that color from color data in your
--    **ImGuiStyle**. The ImGuiCol_ that these style colors default to are
--    detailed above, and in general have been mapped to produce plots visually
--    consistent with your current ImGui style. Of course, you are free to
--    manually set these colors to whatever you like, and further can Push/Pop
--    them around individual plots for plot-specific styling (e.g. coloring axes).

-- Provides access to plot style structure for permanant modifications to colors, sizes, etc.
---@return ImPlotStyle
function ImPlot.GetStyle() end

-- Style plot colors for current ImGui style (default).
---@param dst ImPlotStyle
function ImPlot.StyleColorsAuto(dst) end

-- Style plot colors for ImGui "Classic".
---@param dst ImPlotStyle
function ImPlot.StyleColorsClassic(dst) end

-- Style plot colors for ImGui "Dark".
---@param dst ImPlotStyle
function ImPlot.StyleColorsDark(dst) end

-- Style plot colors for ImGui "Light".
---@param dst ImPlotStyle
function ImPlot.StyleColorsLight(dst) end

-- Use PushStyleX to temporarily modify your ImPlotStyle. The modification
-- will last until the matching call to PopStyleX. You MUST call a pop for
-- every push, otherwise you will leak memory! This behaves just like ImGui.

-- Temporarily modify a style color. Don't forget to call PopStyleColor!
---@param idx ImPlotCol
---@param col ImU32 RGBA Color
function ImPlot.PushStyleColor(idx, col) end
---@param idx ImPlotCol
---@param colR number
---@param colG number
---@param colB number
---@param colA number
function ImPlot.PushStyleColor(idx, colR, colG, colB, colA) end
---@param idx ImPlotCol
---@param col ImVec4
function ImPlot.PushStyleColor(idx, col) end

-- Undo temporary style color modification(s). Undo multiple pushes at once by increasing count.
---@param count? number
function ImPlot.PopStyleColor(count) end

-- Temporarily modify a style variable. Don't forget to call PopStyleVar!
---@param idx ImPlotStyleVar
---@param val number | integer | ImVec2
function ImPlot.PushStyleVar(idx, val) end

-- Undo temporary style variable modification(s). Undo multiple pushes at once by increasing count.
---@param count? integer
function ImPlot.PopStyleVar(count) end

-- The following can be used to modify the style of the next plot item ONLY. They do
-- NOT require calls to PopStyleX. Leave style attributes you don't want modified to
-- IMPLOT_AUTO or IMPLOT_AUTO_COL. Automatic styles will be deduced from the current
-- values in your ImPlotStyle or from Colormap data.

-- Set the line color and weight for the next item only.
---@param col? ImVec4
---@param weight? number
function ImPlot.SetNextLineStyle(col, weight) end

-- Set the fill color for the next item only.
---@param col? ImVec4
---@param alphaMod? number
function ImPlot.SetNextFillStyle(col, alphaMod) end

-- Set the marker style for the next item only.
---@param marker ImPlotMarker
---@param size? number
---@param fill? ImVec4
---@param weight? number
---@param outline? ImVec4
function ImPlot.SetNextMarkerStyle(marker, size, fill, weight, outline) end

-- Set the error bar style for the next item only.
---@param col? ImVec4
---@param size? number
---@param weight? number
function ImPlot.SetNextErrorBarStyle(col, size, weight) end

-- Gets the last item primary color (i.e. its legend icon color)
---@return ImVec4
function ImPlot.GetLastItemColor() end

-- Returns the null terminated string name for an ImPlotCol.
---@param idx ImPlotCol
---@return string
function ImPlot.GetStyleColorName(idx) end

-- Returns the null terminated string name for an ImPlotMarker.
---@param idx ImPlotMarker
---@return string
function ImPlot.GetMarkerName(idx) end


--
-- ## Colormaps
--

-- Item styling is based on colormaps when the relevant ImPlotCol.XXX is set to
-- IMPLOT_AUTO_COL (default). Several built-in colormaps are available. You can
-- add and then push/pop your own colormaps as well. To permanently set a colormap,
-- modify the Colormap index member of your ImPlotStyle.

-- Colormap data will be ignored and a custom color will be used if you have done one of the following:
--     1) Modified an item style color in your ImPlotStyle to anything other than IMPLOT_AUTO_COL.
--     2) Pushed an item style color using PushStyleColor().
--     3) Set the next item style with a SetNextXXXStyle function.

-- Add a new colormap. The color data will be copied. The colormap can be used by pushing either the returned index or the
-- string name with PushColormap. The colormap name must be unique and the size must be greater than 1. You will receive
-- an assert otherwise! By default colormaps are considered to be qualitative (i.e. discrete). If you want to create a
-- continuous colormap, set `qual`=false. This will treat the colors you provide as keys, and ImPlot will build a linearly
-- interpolated lookup table. The memory footprint of this table will be exactly ((size-1)*255+1)*4 bytes.
---@param name string
---@param cols ImU32[] | ImVec4[]
---@param qual? boolean
---@return integer
function ImPlot.AddColormap(name, cols, qual) end

-- Returns the number of available colormaps (i.e. the built-in + user-added count).
---@return integer
function ImPlot.GetColormapCount() end

-- Returns a null terminated string name for a colormap given an index. Returns nullptr if index is invalid.
---@param cmap ImPlotColormap | integer
---@return string
function ImPlot.GetColormapName(cmap) end

-- Returns an index number for a colormap given a valid string name. Returns -1 if name is invalid.
---@param name string
---@return ImPlotColormap | integer
function ImPlot.GetColormapIndex(name) end

-- Temporarily switch to one of the built-in (i.e. ImPlotColormap.XXX) or user-added colormaps (i.e. a return value of AddColormap). Don't forget to call PopColormap!
---@param cmap ImPlotColormap | integer
function ImPlot.PushColormap(cmap) end
-- Push a colormap by string name. Use built-in names such as "Default", "Deep", "Jet", etc. or a string you provided to AddColormap. Don't forget to call PopColormap!
---@param name string
function ImPlot.PushColormap(name) end

-- Undo temporary colormap modification(s). Undo multiple pushes at once by increasing count.
---@param count? integer
function ImPlot.PopColormap(count) end

-- Returns the next color from the current colormap and advances the colormap for the current plot.
-- Can also be used with no return value to skip colors if desired. You need to call this between Begin/EndPlot!
---@return ImVec4
function ImPlot.NextColormapColor() end

-- Colormap utils. If cmap = IMPLOT_AUTO (default), the current colormap is assumed.
-- Pass an explicit colormap index (built-in or user-added) to specify otherwise.

-- Returns the size of a colormap.
function ImPlot.GetColormapSize(cmap) end

-- Returns a color from a colormap given an index >= 0 (modulo will be performed).
---@param idx integer
---@param cmap? ImPlotColormap|integer
---@return ImVec4
function ImPlot.GetColormapColor(idx, cmap) end

-- Sample a color from the current colormap given t between 0 and 1.
function ImPlot.SampleColormap(t, cmap) end

-- Shows a vertical color scale with linear spaced ticks using the specified color map. Use double hashes to hide label (e.g. "##NoLabel"). If scale_min > scale_max, the scale to color mapping will be reversed.
---@param label string
---@param scaleMin number
---@param scaleMax number
---@param size? ImVec2
---@param format? string
---@param flags? ImPlotColormapScaleFlags
---@param cmap? ImPlotColormap | integer
function ImPlot.ColormapScale(label, scaleMin, scaleMax, size, format, flags, cmap) end

-- Shows a horizontal slider with a colormap gradient background. Optionally returns the color sampled at t in [0 1].
---@param label string
---@param t number
---@param format? string
---@param cmap? ImPlotColormap | integer
---@return boolean changed
---@return number t
---@return ImVec4 out
function ImPlot.ColormapSlider(label, t, out, format, cmap) end

-- Shows a button with a colormap gradient brackground.
---@param label string
---@param size ImVec2
---@param cmap ImPlotColormap | integer
---@return boolean changed
function ImPlot.ColormapButton(label, size, cmap) end

-- When items in a plot sample their color from a colormap, the color is cached and does not change
-- unless explicitly overriden. Therefore, if you change the colormap after the item has already been plotted,
-- item colors will NOT update. If you need item colors to resample the new colormap, then use this
-- function to bust the cached colors. If #plot_title_id is nullptr, then every item in EVERY existing plot
-- will be cache busted. Otherwise only the plot specified by #plot_title_id will be busted. For the
-- latter, this function must be called in the same ImGui ID scope that the plot is in. You should rarely if ever
-- need this function, but it is available for applications that require runtime colormap swaps (e.g. Heatmaps demo).
---@param plotTitleId? string
function ImPlot.BustColorCache(plotTitleId) end


--
-- ## Input Mapping
--

-- Provides access to input mapping structure for permanant modifications to controls for pan, select, etc.
---@return ImPlotInputMap
function ImPlot.GetInputMap() end

-- Default input mapping: pan = LMB drag, box select = RMB drag, fit = LMB double click, context menu = RMB click, zoom = scroll.
---@param dst? ImPlotInputMap
function ImPlot.MapInputDefault(dst) end

-- Reverse input mapping: pan = RMB drag, box select = LMB drag, fit = LMB double click, context menu = RMB click, zoom = scroll.
---@param dst? ImPlotInputMap
function ImPlot.MapInputReverse(dst) end


--
-- ## Miscellaneous
--

-- Render icons similar to those that appear in legends (nifty for data lists).
---@param col ImU32 | ImVec4
function ImPlot.ItemIcon(col) end

-- Render icons similar to those that appear in legends (nifty for data lists).
---@param cmap ImPlotColormap
function ImPlot.ColormapIcon(cmap) end

-- Get the plot draw list for custom rendering to the current plot area. Call between Begin/EndPlot.
---@return ImDrawList
function ImPlot.GetPlotDrawList() end

-- Push clip rect for rendering to current plot area. The rect can be expanded or contracted by #expand pixels. Call between Begin/EndPlot.
---@param expand? number
function ImPlot.PushPlotClipRect(expand) end

-- Pop plot clip rect. Call between Begin/EndPlot.
function ImPlot.PopPlotClipRect() end

-- Shows ImPlot style selector dropdown menu.
---@param label string
function ImPlot.ShowStyleSelector(label) end

-- Shows ImPlot colormap selector dropdown menu.
---@param label string
function ImPlot.ShowColormapSelector(label) end

-- Shows ImPlot input map selector dropdown menu.
---@param label string
function ImPlot.ShowInputMapSelector(label) end

-- Shows ImPlot style editor block (not a window).
---@param ref? ImPlotStyle
function ImPlot.ShowStyleEditor(ref) end

-- Add basic help/info block for end users (not a window).
function ImPlot.ShowUserGuide() end

-- Shows ImPlot metrics/debug information window.
---@param open? boolean
---@return boolean open
function ImPlot.ShowMetricsWindow(open) end

-- Get the current version of ImPlot as a string
---@return string version
function ImPlot.GetVersion() end


--
-- ## Demo
--

-- Shows ImPlot style editor block (not a window)
---@param ref? ImPlotStyle
function ImPlot.ShowStyleEditor(ref) end

-- A helper for time plot demo
---@return number
function ImPlot.GetTime() end



return ImPlot
