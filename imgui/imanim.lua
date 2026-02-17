---@meta ImAnim

--
-- ## ImAnim — Dear ImGui Animation Helpers
--
-- Channels: float, vec2, vec4, int, color (sRGB/Linear/HSV/OKLAB/OKLCH blending).
-- Easing: presets + cubicBezier/steps/back/elastic/bounce/spring.
-- Caching: ImPool + ImGuiStorage keyed by (ImGuiID, channel_id) via ImHashData.
-- Resize helpers: relative targets, resolver callback, explicit rebase.
--

---@class ImAnim
---@field VERSION string Version string (e.g. "1.0.0")
---@field VERSION_NUM integer Version number (e.g. 10000 for 1.00.00)
ImAnim = {}


-- ============================================================================
-- Enums
-- ============================================================================

---@enum IamEaseType
IamEaseType = {
    Linear         = 0,
    InQuad         = 1,
    OutQuad        = 2,
    InOutQuad      = 3,
    InCubic        = 4,
    OutCubic       = 5,
    InOutCubic     = 6,
    InQuart        = 7,
    OutQuart       = 8,
    InOutQuart     = 9,
    InQuint        = 10,
    OutQuint       = 11,
    InOutQuint     = 12,
    InSine         = 13,
    OutSine        = 14,
    InOutSine      = 15,
    InExpo         = 16,
    OutExpo        = 17,
    InOutExpo      = 18,
    InCirc         = 19,
    OutCirc        = 20,
    InOutCirc      = 21,
    InBack         = 22,       -- p0 = overshoot
    OutBack        = 23,       -- p0 = overshoot
    InOutBack      = 24,       -- p0 = overshoot
    InElastic      = 25,       -- p0 = amplitude, p1 = period
    OutElastic     = 26,       -- p0 = amplitude, p1 = period
    InOutElastic   = 27,       -- p0 = amplitude, p1 = period
    InBounce       = 28,
    OutBounce      = 29,
    InOutBounce    = 30,
    Steps          = 31,       -- p0 = steps (>=1), p1 = 0:end 1:start 2:both
    CubicBezier    = 32,       -- p0=x1 p1=y1 p2=x2 p3=y2
    Spring         = 33,       -- p0=mass p1=stiffness p2=damping p3=v0
    Custom         = 34,       -- User-defined easing function (use RegisterCustomEase)
}

---@enum IamPolicy
IamPolicy = {
    Crossfade      = 0,        -- Smooth into new target
    Cut            = 1,        -- Snap to target
    Queue          = 2,        -- Queue one pending target
}

---@enum IamColorSpace
IamColorSpace = {
    SRGB           = 0,        -- Blend in sRGB (not physically linear)
    SRGBLinear     = 1,        -- sRGB<->linear, blend in linear, back to sRGB
    HSV            = 2,        -- Blend H/S/V (hue shortest arc), keep A linear
    OKLAB          = 3,        -- sRGB<->OKLAB, blend in OKLAB, back to sRGB
    OKLCH          = 4,        -- sRGB<->OKLCH (cylindrical OKLAB), blend in OKLCH, back to sRGB
}

---@enum IamAnchorSpace
IamAnchorSpace = {
    WindowContent  = 0,        -- ImGui::GetContentRegionAvail()
    Window         = 1,        -- ImGui::GetWindowSize()
    Viewport       = 2,        -- ImGui::GetWindowViewport()->Size
    LastItem       = 3,        -- ImGui::GetItemRectSize()
}


-- ============================================================================
-- Descriptor Types
-- ============================================================================

-- ### IamEaseDesc

-- Descriptor for any easing (preset or parametric).
---@class IamEaseDesc
---@field type IamEaseType Easing type
---@field p0 number Parameter 0
---@field p1 number Parameter 1
---@field p2 number Parameter 2
---@field p3 number Parameter 3
IamEaseDesc = {}

---@return IamEaseDesc
function IamEaseDesc() end


-- ============================================================================
-- Custom Easing Functions
-- ============================================================================

-- Register custom easing in slot 0-15. Use with EaseCustomFn(slot).
---@param slot integer Slot index (0-15)
---@param fn fun(t: number): number Custom easing function (t in [0,1], returns eased value)
function ImAnim.RegisterCustomEase(slot, fn) end


-- ============================================================================
-- Debug UI
-- ============================================================================

-- Show unified inspector (merges debug window + animation inspector).
---@param open? boolean
---@return boolean open
function ImAnim.ShowUnifiedInspector(open) end

-- Show debug timeline for a clip instance.
---@param instance_id ImGuiID
function ImAnim.ShowDebugTimeline(instance_id) end


-- ============================================================================
-- Performance Profiler
-- ============================================================================

-- Check if profiler is enabled.
---@return boolean
function ImAnim.ProfilerIsEnabled() end

-- Begin a named profiler section.
---@param name string
function ImAnim.ProfilerBegin(name) end

-- End the current profiler section.
function ImAnim.ProfilerEnd() end


-- ============================================================================
-- Drag Feedback — animated feedback for drag operations
-- ============================================================================

-- ### IamDragOpts

---@class IamDragOpts
---@field snap_grid ImVec2 Grid size for snapping (0,0 = no grid)
---@field snap_duration number Duration of snap animation
---@field overshoot number Overshoot amount (0 = none, 1 = normal)
---@field ease_type IamEaseType Easing type for snap animation
IamDragOpts = {}

---@return IamDragOpts
function IamDragOpts() end

-- ### IamDragFeedback

---@class IamDragFeedback
---@field position ImVec2 Current animated position
---@field offset ImVec2 Offset from drag start
---@field velocity ImVec2 Current velocity estimate
---@field is_dragging boolean Currently being dragged
---@field is_snapping boolean Currently snapping to target
---@field snap_progress number Snap animation progress (0-1)

-- Start tracking drag at position.
---@param id ImGuiID
---@param pos ImVec2
---@return IamDragFeedback
function ImAnim.DragBegin(id, pos) end

-- Update drag position during drag.
---@param id ImGuiID
---@param pos ImVec2
---@param dt number
---@return IamDragFeedback
function ImAnim.DragUpdate(id, pos, dt) end

-- Release drag with animated feedback.
---@param id ImGuiID
---@param pos ImVec2
---@param opts IamDragOpts
---@param dt number
---@return IamDragFeedback
function ImAnim.DragRelease(id, pos, opts, dt) end

-- Cancel drag tracking.
---@param id ImGuiID
function ImAnim.DragCancel(id) end


-- ============================================================================
-- Oscillators — continuous periodic animations
-- ============================================================================

---@enum IamWaveType
IamWaveType = {
    Sine           = 0,        -- Smooth sine wave
    Triangle       = 1,        -- Triangle wave (linear up/down)
    Sawtooth       = 2,        -- Sawtooth wave (linear up, instant reset)
    Square         = 3,        -- Square wave (on/off pulse)
}

-- Returns oscillating value [-amplitude, +amplitude].
---@param id ImGuiID
---@param amplitude number
---@param frequency number
---@param wave_type IamWaveType
---@param phase number
---@param dt number
---@return number
function ImAnim.Oscillate(id, amplitude, frequency, wave_type, phase, dt) end

-- Returns oscillating integer value [-amplitude, +amplitude].
---@param id ImGuiID
---@param amplitude integer
---@param frequency number
---@param wave_type IamWaveType
---@param phase number
---@param dt number
---@return integer
function ImAnim.OscillateInt(id, amplitude, frequency, wave_type, phase, dt) end

-- 2D oscillation.
---@param id ImGuiID
---@param amplitude ImVec2
---@param frequency ImVec2
---@param wave_type IamWaveType
---@param phase ImVec2
---@param dt number
---@return ImVec2
function ImAnim.OscillateVec2(id, amplitude, frequency, wave_type, phase, dt) end

-- 4D oscillation.
---@param id ImGuiID
---@param amplitude ImVec4
---@param frequency ImVec4
---@param wave_type IamWaveType
---@param phase ImVec4
---@param dt number
---@return ImVec4
function ImAnim.OscillateVec4(id, amplitude, frequency, wave_type, phase, dt) end

-- Color oscillation in specified color space.
---@param id ImGuiID
---@param base_color ImVec4
---@param amplitude ImVec4
---@param frequency number
---@param wave_type IamWaveType
---@param phase number
---@param color_space IamColorSpace
---@param dt number
---@return ImVec4
function ImAnim.OscillateColor(id, base_color, amplitude, frequency, wave_type, phase, color_space, dt) end


-- ============================================================================
-- Shake/Wiggle — procedural noise animations
-- ============================================================================

-- Decaying random shake. Returns offset that decays to 0.
---@param id ImGuiID
---@param intensity number
---@param frequency number
---@param decay_time number
---@param dt number
---@return number
function ImAnim.Shake(id, intensity, frequency, decay_time, dt) end

-- Decaying random shake for integers.
---@param id ImGuiID
---@param intensity integer
---@param frequency number
---@param decay_time number
---@param dt number
---@return integer
function ImAnim.ShakeInt(id, intensity, frequency, decay_time, dt) end

-- 2D decaying shake.
---@param id ImGuiID
---@param intensity ImVec2
---@param frequency number
---@param decay_time number
---@param dt number
---@return ImVec2
function ImAnim.ShakeVec2(id, intensity, frequency, decay_time, dt) end

-- 4D decaying shake.
---@param id ImGuiID
---@param intensity ImVec4
---@param frequency number
---@param decay_time number
---@param dt number
---@return ImVec4
function ImAnim.ShakeVec4(id, intensity, frequency, decay_time, dt) end

-- Color shake in specified color space.
---@param id ImGuiID
---@param base_color ImVec4
---@param intensity ImVec4
---@param frequency number
---@param decay_time number
---@param color_space IamColorSpace
---@param dt number
---@return ImVec4
function ImAnim.ShakeColor(id, base_color, intensity, frequency, decay_time, color_space, dt) end

-- Continuous smooth random movement.
---@param id ImGuiID
---@param amplitude number
---@param frequency number
---@param dt number
---@return number
function ImAnim.Wiggle(id, amplitude, frequency, dt) end

-- Continuous smooth random movement for integers.
---@param id ImGuiID
---@param amplitude integer
---@param frequency number
---@param dt number
---@return integer
function ImAnim.WiggleInt(id, amplitude, frequency, dt) end

-- 2D continuous wiggle.
---@param id ImGuiID
---@param amplitude ImVec2
---@param frequency number
---@param dt number
---@return ImVec2
function ImAnim.WiggleVec2(id, amplitude, frequency, dt) end

-- 4D continuous wiggle.
---@param id ImGuiID
---@param amplitude ImVec4
---@param frequency number
---@param dt number
---@return ImVec4
function ImAnim.WiggleVec4(id, amplitude, frequency, dt) end

-- Color wiggle in specified color space.
---@param id ImGuiID
---@param base_color ImVec4
---@param amplitude ImVec4
---@param frequency number
---@param color_space IamColorSpace
---@param dt number
---@return ImVec4
function ImAnim.WiggleColor(id, base_color, amplitude, frequency, color_space, dt) end

-- Trigger/restart a shake animation.
---@param id ImGuiID
function ImAnim.TriggerShake(id) end


-- ============================================================================
-- Easing Evaluation
-- ============================================================================

-- Evaluate a preset easing function at time t (0-1).
---@param type IamEaseType
---@param t number
---@return number
function ImAnim.EvalPreset(type, t) end


-- ============================================================================
-- Tween API — smoothly interpolate values over time
-- ============================================================================
-- init_value: Initial value when channel is first created. Defaults to 0 (or white for color).
--             Use this to avoid unwanted animations when the first target differs from the default.

-- Animate a float value.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param target number
---@param dur number Duration in seconds
---@param ez IamEaseDesc
---@param policy IamPolicy
---@param dt number
---@param init_value? number Initial value when channel is first created (default: 0)
---@return number
function ImAnim.TweenFloat(id, channel_id, target, dur, ez, policy, dt, init_value) end

-- Animate a 2D vector.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param target ImVec2
---@param dur number Duration in seconds
---@param ez IamEaseDesc
---@param policy IamPolicy
---@param dt number
---@param init_value? ImVec2 Initial value when channel is first created (default: 0,0)
---@return ImVec2
function ImAnim.TweenVec2(id, channel_id, target, dur, ez, policy, dt, init_value) end

-- Animate a 4D vector.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param target ImVec4
---@param dur number Duration in seconds
---@param ez IamEaseDesc
---@param policy IamPolicy
---@param dt number
---@param init_value? ImVec4 Initial value when channel is first created (default: 0,0,0,0)
---@return ImVec4
function ImAnim.TweenVec4(id, channel_id, target, dur, ez, policy, dt, init_value) end

-- Animate an integer value.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param target integer
---@param dur number Duration in seconds
---@param ez IamEaseDesc
---@param policy IamPolicy
---@param dt number
---@param init_value? integer Initial value when channel is first created (default: 0)
---@return integer
function ImAnim.TweenInt(id, channel_id, target, dur, ez, policy, dt, init_value) end

-- Animate a color in specified color space.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param target_srgb ImVec4
---@param dur number Duration in seconds
---@param ez IamEaseDesc
---@param policy IamPolicy
---@param color_space IamColorSpace
---@param dt number
---@param init_value? ImVec4 Initial value when channel is first created (default: 1,1,1,1)
---@return ImVec4
function ImAnim.TweenColor(id, channel_id, target_srgb, dur, ez, policy, color_space, dt, init_value) end


-- ============================================================================
-- Resize-Friendly Helpers
-- ============================================================================

-- Get dimensions of anchor space (window, viewport, etc.).
---@param space IamAnchorSpace
---@return ImVec2
function ImAnim.AnchorSize(space) end


-- ============================================================================
-- Relative Target Tweens (percent of anchor + pixel offset)
-- ============================================================================
-- Survive window resizes.

-- Float relative to anchor (axis: 0=x, 1=y).
---@param id ImGuiID
---@param channel_id ImGuiID
---@param percent number
---@param px_bias number
---@param dur number
---@param ez IamEaseDesc
---@param policy IamPolicy
---@param anchor_space IamAnchorSpace
---@param axis integer 0=x, 1=y
---@param dt number
---@return number
function ImAnim.TweenFloatRel(id, channel_id, percent, px_bias, dur, ez, policy, anchor_space, axis, dt) end

-- Vec2 relative to anchor.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param percent ImVec2
---@param px_bias ImVec2
---@param dur number
---@param ez IamEaseDesc
---@param policy IamPolicy
---@param anchor_space IamAnchorSpace
---@param dt number
---@return ImVec2
function ImAnim.TweenVec2Rel(id, channel_id, percent, px_bias, dur, ez, policy, anchor_space, dt) end

-- Vec4 with x,y relative to anchor.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param percent ImVec4
---@param px_bias ImVec4
---@param dur number
---@param ez IamEaseDesc
---@param policy IamPolicy
---@param anchor_space IamAnchorSpace
---@param dt number
---@return ImVec4
function ImAnim.TweenVec4Rel(id, channel_id, percent, px_bias, dur, ez, policy, anchor_space, dt) end

-- Color with component offsets.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param percent ImVec4
---@param px_bias ImVec4
---@param dur number
---@param ez IamEaseDesc
---@param policy IamPolicy
---@param color_space IamColorSpace
---@param anchor_space IamAnchorSpace
---@param dt number
---@return ImVec4
function ImAnim.TweenColorRel(id, channel_id, percent, px_bias, dur, ez, policy, color_space, anchor_space, dt) end


-- ============================================================================
-- Resolved Tweens — target computed dynamically by callback each frame
-- ============================================================================

-- Float with dynamic target.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param fn fun(): number Resolver callback returning float target
---@param dur number
---@param ez IamEaseDesc
---@param policy IamPolicy
---@param dt number
---@return number
function ImAnim.TweenFloatResolved(id, channel_id, fn, dur, ez, policy, dt) end

-- Vec2 with dynamic target.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param fn fun(): ImVec2 Resolver callback returning vec2 target
---@param dur number
---@param ez IamEaseDesc
---@param policy IamPolicy
---@param dt number
---@return ImVec2
function ImAnim.TweenVec2Resolved(id, channel_id, fn, dur, ez, policy, dt) end

-- Vec4 with dynamic target.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param fn fun(): ImVec4 Resolver callback returning vec4 target
---@param dur number
---@param ez IamEaseDesc
---@param policy IamPolicy
---@param dt number
---@return ImVec4
function ImAnim.TweenVec4Resolved(id, channel_id, fn, dur, ez, policy, dt) end

-- Color with dynamic target.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param fn fun(): ImVec4 Resolver callback returning color target (sRGB)
---@param dur number
---@param ez IamEaseDesc
---@param policy IamPolicy
---@param color_space IamColorSpace
---@param dt number
---@return ImVec4
function ImAnim.TweenColorResolved(id, channel_id, fn, dur, ez, policy, color_space, dt) end

-- Int with dynamic target.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param fn fun(): integer Resolver callback returning int target
---@param dur number
---@param ez IamEaseDesc
---@param policy IamPolicy
---@param dt number
---@return integer
function ImAnim.TweenIntResolved(id, channel_id, fn, dur, ez, policy, dt) end


-- ============================================================================
-- Rebase — change target of in-progress animation without restarting
-- ============================================================================

-- Smoothly redirect float animation to new target.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param new_target number
---@param dt number
function ImAnim.RebaseFloat(id, channel_id, new_target, dt) end

-- Smoothly redirect vec2 animation to new target.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param new_target ImVec2
---@param dt number
function ImAnim.RebaseVec2(id, channel_id, new_target, dt) end

-- Smoothly redirect vec4 animation to new target.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param new_target ImVec4
---@param dt number
function ImAnim.RebaseVec4(id, channel_id, new_target, dt) end

-- Smoothly redirect color animation to new target.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param new_target ImVec4
---@param dt number
function ImAnim.RebaseColor(id, channel_id, new_target, dt) end

-- Smoothly redirect int animation to new target.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param new_target integer
---@param dt number
function ImAnim.RebaseInt(id, channel_id, new_target, dt) end


-- ============================================================================
-- Color Blending Utility
-- ============================================================================

-- Blend two sRGB colors in specified color space.
---@param a_srgb ImVec4
---@param b_srgb ImVec4
---@param t number
---@param color_space IamColorSpace
---@return ImVec4
function ImAnim.GetBlendedColor(a_srgb, b_srgb, t, color_space) end


-- ============================================================================
-- Convenience Shorthands for Common Easings
-- ============================================================================

-- Create descriptor from preset enum.
---@param type IamEaseType
---@return IamEaseDesc
function ImAnim.EasePreset(type) end

-- Create cubic bezier easing.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return IamEaseDesc
function ImAnim.EaseBezier(x1, y1, x2, y2) end

-- Create step function easing.
---@param steps integer Number of steps (>=1)
---@param mode integer 0:end 1:start 2:both
---@return IamEaseDesc
function ImAnim.EaseSteps(steps, mode) end

-- Create back easing with overshoot.
---@param overshoot number
---@return IamEaseDesc
function ImAnim.EaseBack(overshoot) end

-- Create elastic easing.
---@param amplitude number
---@param period number
---@return IamEaseDesc
function ImAnim.EaseElastic(amplitude, period) end

-- Create physics spring.
---@param mass number
---@param stiffness number
---@param damping number
---@param v0 number Initial velocity
---@return IamEaseDesc
function ImAnim.EaseSpring(mass, stiffness, damping, v0) end

-- Use registered custom easing (slot 0-15).
---@param slot integer
---@return IamEaseDesc
function ImAnim.EaseCustomFn(slot) end


-- ============================================================================
-- Scroll Animation — smooth scrolling for ImGui windows
-- ============================================================================

-- Scroll current window to Y position.
---@param target_y number
---@param duration number
---@param ez? IamEaseDesc Default: EasePreset(IamEaseType.OutCubic)
function ImAnim.ScrollToY(target_y, duration, ez) end

-- Scroll current window to X position.
---@param target_x number
---@param duration number
---@param ez? IamEaseDesc Default: EasePreset(IamEaseType.OutCubic)
function ImAnim.ScrollToX(target_x, duration, ez) end

-- Scroll to top of window.
---@param duration? number Default: 0.3
---@param ez? IamEaseDesc Default: EasePreset(IamEaseType.OutCubic)
function ImAnim.ScrollToTop(duration, ez) end

-- Scroll to bottom of window.
---@param duration? number Default: 0.3
---@param ez? IamEaseDesc Default: EasePreset(IamEaseType.OutCubic)
function ImAnim.ScrollToBottom(duration, ez) end


-- ============================================================================
-- Per-Axis Easing — different easing per component
-- ============================================================================

-- ### IamEasePerAxis

-- Per-axis easing descriptor (for vec2/vec4/color).
---@class IamEasePerAxis
---@field x IamEaseDesc Easing for X component
---@field y IamEaseDesc Easing for Y component
---@field z IamEaseDesc Easing for Z component (vec4/color only)
---@field w IamEaseDesc Easing for W/alpha component (vec4/color only)
IamEasePerAxis = {}

---@return IamEasePerAxis
function IamEasePerAxis() end

-- All components use the same easing.
---@param all IamEaseDesc
---@return IamEasePerAxis
function IamEasePerAxis(all) end

-- X and Y use different easings.
---@param x IamEaseDesc
---@param y IamEaseDesc
---@return IamEasePerAxis
function IamEasePerAxis(x, y) end

-- Each component uses its own easing.
---@param x IamEaseDesc
---@param y IamEaseDesc
---@param z IamEaseDesc
---@param w IamEaseDesc
---@return IamEasePerAxis
function IamEasePerAxis(x, y, z, w) end

-- Tween with per-axis easing — each component uses its own easing curve.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param target ImVec2
---@param dur number
---@param ez IamEasePerAxis
---@param policy IamPolicy
---@param dt number
---@return ImVec2
function ImAnim.TweenVec2PerAxis(id, channel_id, target, dur, ez, policy, dt) end

---@param id ImGuiID
---@param channel_id ImGuiID
---@param target ImVec4
---@param dur number
---@param ez IamEasePerAxis
---@param policy IamPolicy
---@param dt number
---@return ImVec4
function ImAnim.TweenVec4PerAxis(id, channel_id, target, dur, ez, policy, dt) end

---@param id ImGuiID
---@param channel_id ImGuiID
---@param target_srgb ImVec4
---@param dur number
---@param ez IamEasePerAxis
---@param policy IamPolicy
---@param color_space IamColorSpace
---@param dt number
---@return ImVec4
function ImAnim.TweenColorPerAxis(id, channel_id, target_srgb, dur, ez, policy, color_space, dt) end


-- ============================================================================
-- Motion Paths — animate along curves and splines
-- ============================================================================

---@enum IamPathSegmentType
IamPathSegmentType = {
    Line             = 0,      -- Linear segment to endpoint
    QuadraticBezier  = 1,      -- Quadratic bezier (1 control point)
    CubicBezier      = 2,      -- Cubic bezier (2 control points)
    CatmullRom       = 3,      -- Catmull-rom spline segment
}

-- Single-curve evaluation functions (stateless, for direct use)

-- Evaluate quadratic bezier at t [0,1].
---@param p0 ImVec2
---@param p1 ImVec2
---@param p2 ImVec2
---@param t number
---@return ImVec2
function ImAnim.BezierQuadratic(p0, p1, p2, t) end

-- Evaluate cubic bezier at t [0,1].
---@param p0 ImVec2
---@param p1 ImVec2
---@param p2 ImVec2
---@param p3 ImVec2
---@param t number
---@return ImVec2
function ImAnim.BezierCubic(p0, p1, p2, p3, t) end

-- Evaluate Catmull-Rom spline at t [0,1]. Points go through p1 and p2.
---@param p0 ImVec2
---@param p1 ImVec2
---@param p2 ImVec2
---@param p3 ImVec2
---@param t number
---@param tension? number Default: 0.5
---@return ImVec2
function ImAnim.CatmullRom(p0, p1, p2, p3, t, tension) end

-- Derivatives (for tangent/velocity)

-- Derivative of quadratic bezier.
---@param p0 ImVec2
---@param p1 ImVec2
---@param p2 ImVec2
---@param t number
---@return ImVec2
function ImAnim.BezierQuadraticDeriv(p0, p1, p2, t) end

-- Derivative of cubic bezier.
---@param p0 ImVec2
---@param p1 ImVec2
---@param p2 ImVec2
---@param p3 ImVec2
---@param t number
---@return ImVec2
function ImAnim.BezierCubicDeriv(p0, p1, p2, p3, t) end

-- Derivative of Catmull-Rom.
---@param p0 ImVec2
---@param p1 ImVec2
---@param p2 ImVec2
---@param p3 ImVec2
---@param t number
---@param tension? number Default: 0.5
---@return ImVec2
function ImAnim.CatmullRomDeriv(p0, p1, p2, p3, t, tension) end


-- ### IamPath

-- Fluent API for building multi-segment motion paths.
---@class IamPath
IamPath = {}

-- Start building a path at position.
---@param path_id ImGuiID
---@param start ImVec2
---@return IamPath
function IamPath.Begin(path_id, start) end

-- Add linear segment to endpoint.
---@param endpoint ImVec2
---@return IamPath self
function IamPath:LineTo(endpoint) end

-- Add quadratic bezier segment.
---@param ctrl ImVec2
---@param endpoint ImVec2
---@return IamPath self
function IamPath:QuadraticTo(ctrl, endpoint) end

-- Add cubic bezier segment.
---@param ctrl1 ImVec2
---@param ctrl2 ImVec2
---@param endpoint ImVec2
---@return IamPath self
function IamPath:CubicTo(ctrl1, ctrl2, endpoint) end

-- Add Catmull-Rom segment to endpoint.
---@param endpoint ImVec2
---@param tension? number Default: 0.5
---@return IamPath self
function IamPath:CatmullTo(endpoint, tension) end

-- Close path back to start point.
---@return IamPath self
function IamPath:Close() end

-- Finalize and register path.
function IamPath:End() end

-- Get the path ID.
---@return ImGuiID
function IamPath:Id() end


-- Path query functions

-- Check if path exists.
---@param path_id ImGuiID
---@return boolean
function ImAnim.PathExists(path_id) end

-- Get approximate path length.
---@param path_id ImGuiID
---@return number
function ImAnim.PathLength(path_id) end

-- Sample path at t [0,1].
---@param path_id ImGuiID
---@param t number
---@return ImVec2
function ImAnim.PathEvaluate(path_id, t) end

-- Get tangent (normalized direction) at t.
---@param path_id ImGuiID
---@param t number
---@return ImVec2
function ImAnim.PathTangent(path_id, t) end

-- Get rotation angle (radians) at t.
---@param path_id ImGuiID
---@param t number
---@return number
function ImAnim.PathAngle(path_id, t) end


-- Tween along a path

-- Animate position along path.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param path_id ImGuiID
---@param dur number
---@param ez IamEaseDesc
---@param policy IamPolicy
---@param dt number
---@return ImVec2
function ImAnim.TweenPath(id, channel_id, path_id, dur, ez, policy, dt) end

-- Animate rotation angle along path.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param path_id ImGuiID
---@param dur number
---@param ez IamEaseDesc
---@param policy IamPolicy
---@param dt number
---@return number
function ImAnim.TweenPathAngle(id, channel_id, path_id, dur, ez, policy, dt) end


-- ============================================================================
-- Arc-Length Parameterization (for constant-speed animation)
-- ============================================================================

-- Build arc-length lookup table for a path (call once per path, improves accuracy).
---@param path_id ImGuiID
---@param subdivisions? integer Default: 64
function ImAnim.PathBuildArcLut(path_id, subdivisions) end

-- Check if path has precomputed LUT.
---@param path_id ImGuiID
---@return boolean
function ImAnim.PathHasArcLut(path_id) end

-- Convert arc-length distance to t parameter.
---@param path_id ImGuiID
---@param distance number
---@return number
function ImAnim.PathDistanceToT(path_id, distance) end

-- Get position at arc-length distance.
---@param path_id ImGuiID
---@param distance number
---@return ImVec2
function ImAnim.PathEvaluateAtDistance(path_id, distance) end

-- Get rotation angle at arc-length distance.
---@param path_id ImGuiID
---@param distance number
---@return number
function ImAnim.PathAngleAtDistance(path_id, distance) end

-- Get tangent at arc-length distance.
---@param path_id ImGuiID
---@param distance number
---@return ImVec2
function ImAnim.PathTangentAtDistance(path_id, distance) end


-- ============================================================================
-- Path Morphing — interpolate between two paths
-- ============================================================================

-- ### IamMorphOpts

-- Morph options for path interpolation.
---@class IamMorphOpts
---@field samples integer Number of sample points for resampling (default: 64)
---@field match_endpoints boolean Force endpoints to match exactly (default: true)
---@field use_arc_length boolean Use arc-length parameterization for smoother morphing (default: true)
IamMorphOpts = {}

---@return IamMorphOpts
function IamMorphOpts() end

-- Evaluate morphed path at parameter t [0,1] with blend factor [0,1].
-- path_a at blend=0, path_b at blend=1.
-- Paths can have different numbers of segments — they are resampled to match.
---@param path_a ImGuiID
---@param path_b ImGuiID
---@param t number
---@param blend number
---@param opts? IamMorphOpts
---@return ImVec2
function ImAnim.PathMorph(path_a, path_b, t, blend, opts) end

-- Get tangent of morphed path.
---@param path_a ImGuiID
---@param path_b ImGuiID
---@param t number
---@param blend number
---@param opts? IamMorphOpts
---@return ImVec2
function ImAnim.PathMorphTangent(path_a, path_b, t, blend, opts) end

-- Get angle (radians) of morphed path.
---@param path_a ImGuiID
---@param path_b ImGuiID
---@param t number
---@param blend number
---@param opts? IamMorphOpts
---@return number
function ImAnim.PathMorphAngle(path_a, path_b, t, blend, opts) end

-- Tween along a morphing path — animates both position along path AND the morph blend.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param path_a ImGuiID
---@param path_b ImGuiID
---@param target_blend number
---@param dur number
---@param path_ease IamEaseDesc
---@param morph_ease IamEaseDesc
---@param policy IamPolicy
---@param dt number
---@param opts? IamMorphOpts
---@return ImVec2
function ImAnim.TweenPathMorph(id, channel_id, path_a, path_b, target_blend, dur, path_ease, morph_ease, policy, dt, opts) end

-- Get current morph blend value from a tween (for querying state).
---@param id ImGuiID
---@param channel_id ImGuiID
---@return number
function ImAnim.GetMorphBlend(id, channel_id) end


-- ============================================================================
-- Text Along Motion Paths
-- ============================================================================

---@enum IamTextPathAlign
IamTextPathAlign = {
    Start          = 0,        -- Text starts at path start (or offset)
    Center         = 1,        -- Text centered on path
    End            = 2,        -- Text ends at path end
}

-- ### IamTextPathOpts

-- Text path options.
---@class IamTextPathOpts
---@field origin ImVec2 Screen-space origin for rendering (path coords are offset by this)
---@field offset number Starting offset along path (pixels)
---@field letter_spacing number Extra spacing between characters (pixels)
---@field align IamTextPathAlign Alignment along path
---@field flip_y boolean Flip text vertically (for paths going right-to-left)
---@field color ImU32 Text color (default: white)
---@field font_scale number Additional font scale (1.0 = normal)
IamTextPathOpts = {}

---@return IamTextPathOpts
function IamTextPathOpts() end

-- Render text along a path (static — no animation).
---@param path_id ImGuiID
---@param text string
---@param opts? IamTextPathOpts
function ImAnim.TextPath(path_id, text, opts) end

-- Animated text along path (characters appear progressively).
---@param path_id ImGuiID
---@param text string
---@param progress number
---@param opts? IamTextPathOpts
function ImAnim.TextPathAnimated(path_id, text, progress, opts) end

-- Get text width for path layout calculations.
---@param text string
---@param opts? IamTextPathOpts
---@return number
function ImAnim.TextPathWidth(text, opts) end


-- ============================================================================
-- Quad Transform Helpers (for advanced custom rendering)
-- ============================================================================

-- Transform a quad (4 vertices) by rotation and translation.
---@param quad ImVec2[] Table of 4 ImVec2 vertices
---@param center ImVec2
---@param angle_rad number
---@param translation ImVec2
---@return ImVec2[] quad Transformed quad vertices
function ImAnim.TransformQuad(quad, center, angle_rad, translation) end

-- Create a rotated quad for a glyph at a position on the path.
---@param pos ImVec2
---@param angle_rad number
---@param glyph_width number
---@param glyph_height number
---@param baseline_offset? number Default: 0
---@return ImVec2[] quad Table of 4 ImVec2 vertices
function ImAnim.MakeGlyphQuad(pos, angle_rad, glyph_width, glyph_height, baseline_offset) end


-- ============================================================================
-- Text Stagger — per-character animation effects
-- ============================================================================

---@enum IamTextStaggerEffect
IamTextStaggerEffect = {
    None           = 0,        -- No effect (instant appear)
    Fade           = 1,        -- Fade in alpha
    Scale          = 2,        -- Scale from center
    SlideUp        = 3,        -- Slide up from below
    SlideDown      = 4,        -- Slide down from above
    SlideLeft      = 5,        -- Slide in from right
    SlideRight     = 6,        -- Slide in from left
    Rotate         = 7,        -- Rotate in
    Bounce         = 8,        -- Bounce in with overshoot
    Wave           = 9,        -- Wave motion (continuous)
    Typewriter     = 10,       -- Typewriter style (instant per char)
}

-- ### IamTextStaggerOpts

-- Text stagger options.
---@class IamTextStaggerOpts
---@field pos ImVec2 Base position for text
---@field effect IamTextStaggerEffect Effect type
---@field char_delay number Delay between each character (seconds)
---@field char_duration number Duration of each character's animation (seconds)
---@field effect_intensity number Intensity of effect (pixels for slide, degrees for rotate, scale factor)
---@field ease IamEaseDesc Easing for character animation
---@field color ImU32 Text color
---@field font_scale number Font scale multiplier
---@field letter_spacing number Extra spacing between characters
IamTextStaggerOpts = {}

---@return IamTextStaggerOpts
function IamTextStaggerOpts() end

-- Render text with per-character stagger animation.
---@param id ImGuiID
---@param text string
---@param progress number
---@param opts? IamTextStaggerOpts
function ImAnim.TextStagger(id, text, progress, opts) end

-- Get text width for layout calculations.
---@param text string
---@param opts? IamTextStaggerOpts
---@return number
function ImAnim.TextStaggerWidth(text, opts) end

-- Get total animation duration for text (accounts for stagger delays).
---@param text string
---@param opts? IamTextStaggerOpts
---@return number
function ImAnim.TextStaggerDuration(text, opts) end


-- ============================================================================
-- Noise Channels — Perlin/Simplex noise for organic movement
-- ============================================================================

---@enum IamNoiseType
IamNoiseType = {
    Perlin         = 0,        -- Classic Perlin noise
    Simplex        = 1,        -- Simplex noise (faster, fewer artifacts)
    Value          = 2,        -- Value noise (blocky)
    Worley         = 3,        -- Worley/cellular noise
}

-- ### IamNoiseOpts

-- Noise options.
---@class IamNoiseOpts
---@field type IamNoiseType Noise type
---@field octaves integer Number of octaves for fractal noise (1-8)
---@field persistence number Amplitude multiplier per octave (0.0-1.0)
---@field lacunarity number Frequency multiplier per octave (typically 2.0)
---@field seed integer Random seed for noise generation
IamNoiseOpts = {}

---@return IamNoiseOpts
function IamNoiseOpts() end

-- 2D noise. Returns value in [-1, 1].
---@param x number
---@param y number
---@param opts? IamNoiseOpts
---@return number
function ImAnim.Noise2D(x, y, opts) end

-- 3D noise. Returns value in [-1, 1].
---@param x number
---@param y number
---@param z number
---@param opts? IamNoiseOpts
---@return number
function ImAnim.Noise3D(x, y, z, opts) end

-- 1D animated noise.
---@param id ImGuiID
---@param frequency number
---@param amplitude number
---@param opts IamNoiseOpts
---@param dt number
---@return number
function ImAnim.NoiseChannelFloat(id, frequency, amplitude, opts, dt) end

-- 2D animated noise.
---@param id ImGuiID
---@param frequency ImVec2
---@param amplitude ImVec2
---@param opts IamNoiseOpts
---@param dt number
---@return ImVec2
function ImAnim.NoiseChannelVec2(id, frequency, amplitude, opts, dt) end

-- 4D animated noise.
---@param id ImGuiID
---@param frequency ImVec4
---@param amplitude ImVec4
---@param opts IamNoiseOpts
---@param dt number
---@return ImVec4
function ImAnim.NoiseChannelVec4(id, frequency, amplitude, opts, dt) end

-- Animated color noise in specified color space.
---@param id ImGuiID
---@param base_color ImVec4
---@param amplitude ImVec4
---@param frequency number
---@param opts IamNoiseOpts
---@param color_space IamColorSpace
---@param dt number
---@return ImVec4
function ImAnim.NoiseChannelColor(id, base_color, amplitude, frequency, opts, color_space, dt) end

-- Simple 1D smooth noise.
---@param id ImGuiID
---@param amplitude number
---@param speed number
---@param dt number
---@return number
function ImAnim.SmoothNoiseFloat(id, amplitude, speed, dt) end

-- Simple 2D smooth noise.
---@param id ImGuiID
---@param amplitude ImVec2
---@param speed number
---@param dt number
---@return ImVec2
function ImAnim.SmoothNoiseVec2(id, amplitude, speed, dt) end

-- Simple 4D smooth noise.
---@param id ImGuiID
---@param amplitude ImVec4
---@param speed number
---@param dt number
---@return ImVec4
function ImAnim.SmoothNoiseVec4(id, amplitude, speed, dt) end

-- Smooth noise for colors in specified color space.
---@param id ImGuiID
---@param base_color ImVec4
---@param amplitude ImVec4
---@param speed number
---@param color_space IamColorSpace
---@param dt number
---@return ImVec4
function ImAnim.SmoothNoiseColor(id, base_color, amplitude, speed, color_space, dt) end


-- ============================================================================
-- Style Interpolation — animate between ImGuiStyle themes
-- ============================================================================

-- Register a style snapshot.
---@param style_id ImGuiID
---@param style ImGuiStyle
function ImAnim.StyleRegister(style_id, style) end

-- Register current ImGui style.
---@param style_id ImGuiID
function ImAnim.StyleRegisterCurrent(style_id) end

-- Blend between two registered styles (result applied to ImGui::GetStyle()).
-- Uses IamColorSpace for color blending mode (IamColorSpace.OKLAB recommended).
---@param style_a ImGuiID
---@param style_b ImGuiID
---@param t number
---@param color_space? IamColorSpace Default: IamColorSpace.OKLAB
function ImAnim.StyleBlend(style_a, style_b, t, color_space) end

-- Tween between styles over time.
---@param id ImGuiID
---@param target_style ImGuiID
---@param duration number
---@param ease IamEaseDesc
---@param color_space IamColorSpace
---@param dt number
function ImAnim.StyleTween(id, target_style, duration, ease, color_space, dt) end

-- Get interpolated style without applying.
---@param style_a ImGuiID
---@param style_b ImGuiID
---@param t number
---@param color_space? IamColorSpace Default: IamColorSpace.OKLAB
---@return ImGuiStyle
function ImAnim.StyleBlendTo(style_a, style_b, t, color_space) end

-- Check if a style is registered.
---@param style_id ImGuiID
---@return boolean
function ImAnim.StyleExists(style_id) end

-- Remove a registered style.
---@param style_id ImGuiID
function ImAnim.StyleUnregister(style_id) end


-- ============================================================================
-- Gradient Interpolation — animate between color gradients
-- ============================================================================

-- ### IamGradient

-- Color gradient with any number of stops (sorted by position).
---@class IamGradient
IamGradient = {}

---@return IamGradient
function IamGradient() end

-- Add a color stop to the gradient (automatically sorted by position).
---@overload fun(self: IamGradient, position: number, color: ImU32): IamGradient
---@param position number Position along gradient [0,1]
---@param color ImVec4 Color at position (sRGB)
---@return IamGradient self
function IamGradient:Add(position, color) end

-- Get stop count.
---@return integer
function IamGradient:StopCount() end

-- Sample the gradient at position t [0,1].
---@param t number
---@param color_space? IamColorSpace Default: IamColorSpace.OKLAB
---@return ImVec4
function IamGradient:Sample(t, color_space) end

-- Create solid color gradient.
---@param color ImVec4
---@return IamGradient
function IamGradient.Solid(color) end

-- Create two-color gradient.
---@param start_color ImVec4
---@param end_color ImVec4
---@return IamGradient
function IamGradient.TwoColor(start_color, end_color) end

-- Create three-color gradient.
---@param start_color ImVec4
---@param mid_color ImVec4
---@param end_color ImVec4
---@return IamGradient
function IamGradient.ThreeColor(start_color, mid_color, end_color) end

-- Blend between two gradients.
---@param a IamGradient
---@param b IamGradient
---@param t number
---@param color_space? IamColorSpace Default: IamColorSpace.OKLAB
---@return IamGradient
function ImAnim.GradientLerp(a, b, t, color_space) end

-- Tween between gradients over time.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param target IamGradient
---@param dur number
---@param ez IamEaseDesc
---@param policy IamPolicy
---@param color_space IamColorSpace
---@param dt number
---@return IamGradient
function ImAnim.TweenGradient(id, channel_id, target, dur, ez, policy, color_space, dt) end


-- ============================================================================
-- Transform Interpolation — animate 2D transforms
-- ============================================================================

---@enum IamRotationMode
IamRotationMode = {
    Shortest       = 0,        -- Shortest path (default) — never rotates more than 180 degrees
    Longest        = 1,        -- Longest path — always takes the long way around
    CW             = 2,        -- Clockwise — always rotates clockwise (positive direction)
    CCW            = 3,        -- Counter-clockwise — always rotates counter-clockwise
    Direct         = 4,        -- Direct lerp — no angle unwrapping, can cause spinning for large deltas
}

-- ### IamTransform

-- 2D transform (position, rotation, scale).
---@class IamTransform
---@field position ImVec2 Translation
---@field scale ImVec2 Scale (1,1 = identity)
---@field rotation number Rotation in radians
---@operator mul(IamTransform): IamTransform
IamTransform = {}

---@return IamTransform
function IamTransform() end

---@param pos ImVec2
---@param rot number Rotation in radians
---@param scl ImVec2 Scale
---@return IamTransform
function IamTransform(pos, rot, scl) end

-- Create identity transform.
---@return IamTransform
function IamTransform.Identity() end

-- Apply transform to a point.
---@param point ImVec2
---@return ImVec2
function IamTransform:Apply(point) end

-- Get inverse transform.
---@return IamTransform
function IamTransform:Inverse() end

-- Blend between two transforms with rotation interpolation.
---@param a IamTransform
---@param b IamTransform
---@param t number
---@param rotation_mode? IamRotationMode Default: IamRotationMode.Shortest
---@return IamTransform
function ImAnim.TransformLerp(a, b, t, rotation_mode) end

-- Tween between transforms over time.
---@param id ImGuiID
---@param channel_id ImGuiID
---@param target IamTransform
---@param dur number
---@param ez IamEaseDesc
---@param policy IamPolicy
---@param rotation_mode IamRotationMode
---@param dt number
---@return IamTransform
function ImAnim.TweenTransform(id, channel_id, target, dur, ez, policy, rotation_mode, dt) end

-- Decompose a 3x2 matrix into transform components.
---@param m00 number
---@param m01 number
---@param m10 number
---@param m11 number
---@param tx number
---@param ty number
---@return IamTransform
function ImAnim.TransformFromMatrix(m00, m01, m10, m11, tx, ty) end

-- Convert transform to 3x2 matrix (row-major: [m00 m01 tx; m10 m11 ty]).
---@param t IamTransform
---@return number[] matrix Table of 6 floats
function ImAnim.TransformToMatrix(t) end


-- ============================================================================
-- Clip-Based Animation System
-- ============================================================================

---@enum IamDirection
IamDirection = {
    Normal         = 0,        -- Play forward
    Reverse        = 1,        -- Play backward
    Alternate      = 2,        -- Ping-pong
}

---@enum IamChannelType
IamChannelType = {
    Float          = 0,
    Vec2           = 1,
    Vec4           = 2,
    Int            = 3,
    Color          = 4,        -- Color with color space
    FloatRel       = 5,        -- Float relative to anchor (percent + px_bias)
    Vec2Rel        = 6,        -- Vec2 relative to anchor
    Vec4Rel        = 7,        -- Vec4 relative to anchor
    ColorRel       = 8,        -- Color relative to anchor
}

---@enum IamResult
IamResult = {
    Ok             = 0,
    ErrNotFound    = 1,
    ErrBadArg      = 2,
    ErrNoMem       = 3,
}

-- ### IamSpringParams

-- Spring parameters for physics-based animation.
---@class IamSpringParams
---@field mass number
---@field stiffness number
---@field damping number
---@field initial_velocity number
IamSpringParams = {}

---@return IamSpringParams
function IamSpringParams() end


-- ============================================================================
-- Repeat with Variation — per-loop parameter changes
-- ============================================================================

---@enum IamVariationMode
IamVariationMode = {
    None           = 0,        -- No variation
    Increment      = 1,        -- Add amount each iteration
    Decrement      = 2,        -- Subtract amount each iteration
    Multiply       = 3,        -- Multiply by factor each iteration
    Random         = 4,        -- Random in range [-amount, +amount]
    RandomAbs      = 5,        -- Random in range [0, amount]
    Pingpong       = 6,        -- Alternate +/- each iteration
    Callback       = 7,        -- Use custom callback
}

-- ### IamVariationFloat

-- Float variation.
---@class IamVariationFloat
---@field mode IamVariationMode
---@field amount number
---@field min_clamp number
---@field max_clamp number
---@field seed integer 0 = global random, non-zero = deterministic
IamVariationFloat = {}

---@return IamVariationFloat
function IamVariationFloat() end

-- ### IamVariationInt

-- Int variation.
---@class IamVariationInt
---@field mode IamVariationMode
---@field amount integer
---@field min_clamp integer
---@field max_clamp integer
---@field seed integer
IamVariationInt = {}

---@return IamVariationInt
function IamVariationInt() end

-- ### IamVariationVec2

-- Vec2 variation (global mode or per-axis).
---@class IamVariationVec2
---@field mode IamVariationMode Global mode (IamVariationMode.None = use per-axis)
---@field amount ImVec2
---@field min_clamp ImVec2
---@field max_clamp ImVec2
---@field seed integer
---@field x IamVariationFloat Per-axis X
---@field y IamVariationFloat Per-axis Y
IamVariationVec2 = {}

---@return IamVariationVec2
function IamVariationVec2() end

-- ### IamVariationVec4

-- Vec4 variation (global mode or per-axis).
---@class IamVariationVec4
---@field mode IamVariationMode
---@field amount ImVec4
---@field min_clamp ImVec4
---@field max_clamp ImVec4
---@field seed integer
---@field x IamVariationFloat Per-axis X
---@field y IamVariationFloat Per-axis Y
---@field z IamVariationFloat Per-axis Z
---@field w IamVariationFloat Per-axis W
IamVariationVec4 = {}

---@return IamVariationVec4
function IamVariationVec4() end

-- ### IamVariationColor

-- Color variation (global mode or per-channel).
---@class IamVariationColor
---@field mode IamVariationMode
---@field amount ImVec4
---@field min_clamp ImVec4
---@field max_clamp ImVec4
---@field color_space IamColorSpace
---@field seed integer
---@field r IamVariationFloat Per-channel R
---@field g IamVariationFloat Per-channel G
---@field b IamVariationFloat Per-channel B
---@field a IamVariationFloat Per-channel A
IamVariationColor = {}

---@return IamVariationColor
function IamVariationColor() end


-- ============================================================================
-- Variation Helper Functions
-- ============================================================================

-- Float variation helpers

---@return IamVariationFloat
function ImAnim.VarfNone() end

---@param amt number
---@return IamVariationFloat
function ImAnim.VarfInc(amt) end

---@param amt number
---@return IamVariationFloat
function ImAnim.VarfDec(amt) end

---@param f number Factor
---@return IamVariationFloat
function ImAnim.VarfMul(f) end

---@param r number Range
---@return IamVariationFloat
function ImAnim.VarfRand(r) end

---@param r number Range
---@return IamVariationFloat
function ImAnim.VarfRandAbs(r) end

---@param amt number
---@return IamVariationFloat
function ImAnim.VarfPingpong(amt) end

---@param v IamVariationFloat
---@param mn number
---@param mx number
---@return IamVariationFloat
function ImAnim.VarfClamp(v, mn, mx) end

---@param v IamVariationFloat
---@param s integer Seed
---@return IamVariationFloat
function ImAnim.VarfSeed(v, s) end


-- Int variation helpers

---@return IamVariationInt
function ImAnim.VariNone() end

---@param amt integer
---@return IamVariationInt
function ImAnim.VariInc(amt) end

---@param amt integer
---@return IamVariationInt
function ImAnim.VariDec(amt) end

---@param r integer Range
---@return IamVariationInt
function ImAnim.VariRand(r) end

---@param v IamVariationInt
---@param mn integer
---@param mx integer
---@return IamVariationInt
function ImAnim.VariClamp(v, mn, mx) end

---@param v IamVariationInt
---@param s integer Seed
---@return IamVariationInt
function ImAnim.VariSeed(v, s) end


-- Vec2 variation helpers (global)

---@return IamVariationVec2
function ImAnim.Varv2None() end

---@param x number
---@param y number
---@return IamVariationVec2
function ImAnim.Varv2Inc(x, y) end

---@param x number
---@param y number
---@return IamVariationVec2
function ImAnim.Varv2Dec(x, y) end

---@param f number Factor
---@return IamVariationVec2
function ImAnim.Varv2Mul(f) end

---@param x number
---@param y number
---@return IamVariationVec2
function ImAnim.Varv2Rand(x, y) end

-- Vec2 per-axis helper.
---@param vx IamVariationFloat
---@param vy IamVariationFloat
---@return IamVariationVec2
function ImAnim.Varv2Axis(vx, vy) end

---@param v IamVariationVec2
---@param mn ImVec2
---@param mx ImVec2
---@return IamVariationVec2
function ImAnim.Varv2Clamp(v, mn, mx) end

---@param v IamVariationVec2
---@param s integer Seed
---@return IamVariationVec2
function ImAnim.Varv2Seed(v, s) end


-- Vec4 variation helpers (global)

---@return IamVariationVec4
function ImAnim.Varv4None() end

---@param x number
---@param y number
---@param z number
---@param w number
---@return IamVariationVec4
function ImAnim.Varv4Inc(x, y, z, w) end

---@param x number
---@param y number
---@param z number
---@param w number
---@return IamVariationVec4
function ImAnim.Varv4Dec(x, y, z, w) end

---@param f number Factor
---@return IamVariationVec4
function ImAnim.Varv4Mul(f) end

---@param x number
---@param y number
---@param z number
---@param w number
---@return IamVariationVec4
function ImAnim.Varv4Rand(x, y, z, w) end

-- Vec4 per-axis helper.
---@param vx IamVariationFloat
---@param vy IamVariationFloat
---@param vz IamVariationFloat
---@param vw IamVariationFloat
---@return IamVariationVec4
function ImAnim.Varv4Axis(vx, vy, vz, vw) end

---@param v IamVariationVec4
---@param mn ImVec4
---@param mx ImVec4
---@return IamVariationVec4
function ImAnim.Varv4Clamp(v, mn, mx) end

---@param v IamVariationVec4
---@param s integer Seed
---@return IamVariationVec4
function ImAnim.Varv4Seed(v, s) end


-- Color variation helpers (global)

---@return IamVariationColor
function ImAnim.VarcNone() end

---@param r number
---@param g number
---@param b number
---@param a number
---@return IamVariationColor
function ImAnim.VarcInc(r, g, b, a) end

---@param r number
---@param g number
---@param b number
---@param a number
---@return IamVariationColor
function ImAnim.VarcDec(r, g, b, a) end

---@param f number Factor
---@return IamVariationColor
function ImAnim.VarcMul(f) end

---@param r number
---@param g number
---@param b number
---@param a number
---@return IamVariationColor
function ImAnim.VarcRand(r, g, b, a) end

-- Color per-channel helper.
---@param vr IamVariationFloat
---@param vg IamVariationFloat
---@param vb IamVariationFloat
---@param va IamVariationFloat
---@return IamVariationColor
function ImAnim.VarcChannel(vr, vg, vb, va) end

---@param v IamVariationColor
---@param space IamColorSpace
---@return IamVariationColor
function ImAnim.VarcSpace(v, space) end

---@param v IamVariationColor
---@param mn ImVec4
---@param mx ImVec4
---@return IamVariationColor
function ImAnim.VarcClamp(v, mn, mx) end

---@param v IamVariationColor
---@param s integer Seed
---@return IamVariationColor
function ImAnim.VarcSeed(v, s) end


-- ============================================================================
-- IamClip — fluent API for authoring animations
-- ============================================================================

---@class IamClip
IamClip = {}

-- Start building a new clip with the given ID.
---@param clip_id ImGuiID
---@return IamClip
function IamClip.Begin(clip_id) end

-- Add a float keyframe.
---@param channel ImGuiID
---@param time number
---@param value number
---@param ease_type? IamEaseType Default: IamEaseType.Linear
---@param bezier4? number[] Table of 4 floats for cubic bezier control points
---@return IamClip self
function IamClip:KeyFloat(channel, time, value, ease_type, bezier4) end

-- Add a vec2 keyframe.
---@param channel ImGuiID
---@param time number
---@param value ImVec2
---@param ease_type? IamEaseType Default: IamEaseType.Linear
---@param bezier4? number[] Table of 4 floats for cubic bezier control points
---@return IamClip self
function IamClip:KeyVec2(channel, time, value, ease_type, bezier4) end

-- Add a vec4 keyframe.
---@param channel ImGuiID
---@param time number
---@param value ImVec4
---@param ease_type? IamEaseType Default: IamEaseType.Linear
---@param bezier4? number[] Table of 4 floats for cubic bezier control points
---@return IamClip self
function IamClip:KeyVec4(channel, time, value, ease_type, bezier4) end

-- Add an int keyframe.
---@param channel ImGuiID
---@param time number
---@param value integer
---@param ease_type? IamEaseType Default: IamEaseType.Linear
---@return IamClip self
function IamClip:KeyInt(channel, time, value, ease_type) end

-- Add a color keyframe.
---@param channel ImGuiID
---@param time number
---@param value ImVec4
---@param color_space? IamColorSpace Default: IamColorSpace.OKLAB
---@param ease_type? IamEaseType Default: IamEaseType.Linear
---@param bezier4? number[] Table of 4 floats for cubic bezier control points
---@return IamClip self
function IamClip:KeyColor(channel, time, value, color_space, ease_type, bezier4) end

-- Keyframes with repeat variation (value changes per loop iteration)

-- Add a float keyframe with repeat variation.
---@param channel ImGuiID
---@param time number
---@param value number
---@param var IamVariationFloat
---@param ease_type? IamEaseType Default: IamEaseType.Linear
---@param bezier4? number[]
---@return IamClip self
function IamClip:KeyFloatVar(channel, time, value, var, ease_type, bezier4) end

-- Add a vec2 keyframe with repeat variation.
---@param channel ImGuiID
---@param time number
---@param value ImVec2
---@param var IamVariationVec2
---@param ease_type? IamEaseType Default: IamEaseType.Linear
---@param bezier4? number[]
---@return IamClip self
function IamClip:KeyVec2Var(channel, time, value, var, ease_type, bezier4) end

-- Add a vec4 keyframe with repeat variation.
---@param channel ImGuiID
---@param time number
---@param value ImVec4
---@param var IamVariationVec4
---@param ease_type? IamEaseType Default: IamEaseType.Linear
---@param bezier4? number[]
---@return IamClip self
function IamClip:KeyVec4Var(channel, time, value, var, ease_type, bezier4) end

-- Add an int keyframe with repeat variation.
---@param channel ImGuiID
---@param time number
---@param value integer
---@param var IamVariationInt
---@param ease_type? IamEaseType Default: IamEaseType.Linear
---@return IamClip self
function IamClip:KeyIntVar(channel, time, value, var, ease_type) end

-- Add a color keyframe with repeat variation.
---@param channel ImGuiID
---@param time number
---@param value ImVec4
---@param var IamVariationColor
---@param color_space? IamColorSpace Default: IamColorSpace.OKLAB
---@param ease_type? IamEaseType Default: IamEaseType.Linear
---@param bezier4? number[]
---@return IamClip self
function IamClip:KeyColorVar(channel, time, value, var, color_space, ease_type, bezier4) end

-- Spring-based keyframe (float only).
---@param channel ImGuiID
---@param time number
---@param target number
---@param spring IamSpringParams
---@return IamClip self
function IamClip:KeyFloatSpring(channel, time, target, spring) end

-- Anchor-relative keyframes (values resolved relative to window/viewport at get time)

-- Float anchor-relative keyframe.
---@param channel ImGuiID
---@param time number
---@param percent number
---@param px_bias number
---@param anchor_space IamAnchorSpace
---@param axis integer 0=x, 1=y
---@param ease_type? IamEaseType Default: IamEaseType.Linear
---@param bezier4? number[]
---@return IamClip self
function IamClip:KeyFloatRel(channel, time, percent, px_bias, anchor_space, axis, ease_type, bezier4) end

-- Vec2 anchor-relative keyframe.
---@param channel ImGuiID
---@param time number
---@param percent ImVec2
---@param px_bias ImVec2
---@param anchor_space IamAnchorSpace
---@param ease_type? IamEaseType Default: IamEaseType.Linear
---@param bezier4? number[]
---@return IamClip self
function IamClip:KeyVec2Rel(channel, time, percent, px_bias, anchor_space, ease_type, bezier4) end

-- Vec4 anchor-relative keyframe.
---@param channel ImGuiID
---@param time number
---@param percent ImVec4
---@param px_bias ImVec4
---@param anchor_space IamAnchorSpace
---@param ease_type? IamEaseType Default: IamEaseType.Linear
---@param bezier4? number[]
---@return IamClip self
function IamClip:KeyVec4Rel(channel, time, percent, px_bias, anchor_space, ease_type, bezier4) end

-- Color anchor-relative keyframe.
---@param channel ImGuiID
---@param time number
---@param percent ImVec4
---@param px_bias ImVec4
---@param color_space IamColorSpace
---@param anchor_space IamAnchorSpace
---@param ease_type? IamEaseType Default: IamEaseType.Linear
---@param bezier4? number[]
---@return IamClip self
function IamClip:KeyColorRel(channel, time, percent, px_bias, color_space, anchor_space, ease_type, bezier4) end

-- Timeline grouping

-- Start sequential block (keyframes after SeqEnd start after this block).
---@return IamClip self
function IamClip:SeqBegin() end

---@return IamClip self
function IamClip:SeqEnd() end

-- Start parallel block (keyframes play at same time offset).
---@return IamClip self
function IamClip:ParBegin() end

---@return IamClip self
function IamClip:ParEnd() end

-- Timeline markers — callbacks at specific times during playback.
---@overload fun(self: IamClip, time: number, cb: fun(inst_id: ImGuiID, marker_id: ImGuiID, marker_time: number)): IamClip
---@param time number
---@param marker_id ImGuiID
---@param cb fun(inst_id: ImGuiID, marker_id: ImGuiID, marker_time: number)
---@return IamClip self
function IamClip:Marker(time, marker_id, cb) end

-- Clip options

-- Set loop options.
---@param loop boolean
---@param direction? IamDirection Default: IamDirection.Normal
---@param loop_count? integer Number of loops (-1 = infinite)
---@return IamClip self
function IamClip:SetLoop(loop, direction, loop_count) end

-- Set delay before clip starts.
---@param delay_seconds number
---@return IamClip self
function IamClip:SetDelay(delay_seconds) end

-- Set stagger options for indexed instances.
---@param count integer
---@param each_delay number
---@param from_center_bias? number Default: 0
---@return IamClip self
function IamClip:SetStagger(count, each_delay, from_center_bias) end

-- Timing variation per loop iteration

-- Vary clip duration per loop.
---@param var IamVariationFloat
---@return IamClip self
function IamClip:SetDurationVar(var) end

-- Vary delay between loops.
---@param var IamVariationFloat
---@return IamClip self
function IamClip:SetDelayVar(var) end

-- Vary playback speed per loop.
---@param var IamVariationFloat
---@return IamClip self
function IamClip:SetTimescaleVar(var) end

-- Callbacks

-- Callback when clip begins playing.
---@param cb fun(inst_id: ImGuiID)
---@return IamClip self
function IamClip:OnBegin(cb) end

-- Callback each frame while clip is playing.
---@param cb fun(inst_id: ImGuiID)
---@return IamClip self
function IamClip:OnUpdate(cb) end

-- Callback when clip completes.
---@param cb fun(inst_id: ImGuiID)
---@return IamClip self
function IamClip:OnComplete(cb) end

-- Finalize the clip.
function IamClip:End() end

-- Get the clip ID.
---@return ImGuiID
function IamClip:Id() end


-- ============================================================================
-- IamInstance — playback control for a clip
-- ============================================================================

---@class IamInstance
IamInstance = {}

---@return IamInstance
function IamInstance() end

---@param inst_id ImGuiID
---@return IamInstance
function IamInstance(inst_id) end

-- Pause playback.
function IamInstance:Pause() end

-- Resume playback.
function IamInstance:Resume() end

-- Stop playback.
function IamInstance:Stop() end

-- Remove instance from system (Valid() will return false after this).
function IamInstance:Destroy() end

-- Seek to a specific time.
---@param time number
function IamInstance:Seek(time) end

-- Set playback speed.
---@param scale number
function IamInstance:SetTimeScale(scale) end

-- Set blend weight (for layering).
---@param weight number
function IamInstance:SetWeight(weight) end

-- Chain another clip to play after this one.
---@overload fun(self: IamInstance, next_clip_id: ImGuiID, next_instance_id: ImGuiID): IamInstance
---@param next_clip_id ImGuiID
---@return IamInstance self
function IamInstance:Then(next_clip_id) end

-- Set delay before chained clip starts.
---@param delay number
---@return IamInstance self
function IamInstance:ThenDelay(delay) end

-- Get current playback time.
---@return number
function IamInstance:Time() end

-- Get clip duration.
---@return number
function IamInstance:Duration() end

-- Check if currently playing.
---@return boolean
function IamInstance:IsPlaying() end

-- Check if currently paused.
---@return boolean
function IamInstance:IsPaused() end

-- Get animated float value.
---@param channel ImGuiID
---@return boolean ok
---@return number value
function IamInstance:GetFloat(channel) end

-- Get animated vec2 value.
---@param channel ImGuiID
---@return boolean ok
---@return ImVec2 value
function IamInstance:GetVec2(channel) end

-- Get animated vec4 value.
---@param channel ImGuiID
---@return boolean ok
---@return ImVec4 value
function IamInstance:GetVec4(channel) end

-- Get animated int value.
---@param channel ImGuiID
---@return boolean ok
---@return integer value
function IamInstance:GetInt(channel) end

-- Get animated color value.
---@param channel ImGuiID
---@param color_space? IamColorSpace Default: IamColorSpace.OKLAB
---@return boolean ok
---@return ImVec4 value
function IamInstance:GetColor(channel, color_space) end

-- Check validity.
---@return boolean
function IamInstance:Valid() end

-- Get instance ID.
---@return ImGuiID
function IamInstance:Id() end


-- ============================================================================
-- Clip System API
-- ============================================================================

-- Initialize clip system (optional — auto-init on first use).
---@param initial_clip_cap? integer Default: 256
---@param initial_inst_cap? integer Default: 4096
function ImAnim.ClipInit(initial_clip_cap, initial_inst_cap) end

-- Shutdown clip system.
function ImAnim.ClipShutdown() end

-- Garbage collection for instances.
---@param max_age_frames? integer Default: 600
function ImAnim.ClipGC(max_age_frames) end

-- Play a clip on an instance (creates or reuses instance).
---@param clip_id ImGuiID
---@param instance_id ImGuiID
---@return IamInstance
function ImAnim.Play(clip_id, instance_id) end

-- Get an existing instance (returns invalid IamInstance if not found).
---@param instance_id ImGuiID
---@return IamInstance
function ImAnim.GetInstance(instance_id) end

-- Get clip duration in seconds.
---@param clip_id ImGuiID
---@return number
function ImAnim.ClipDuration(clip_id) end

-- Check if clip exists.
---@param clip_id ImGuiID
---@return boolean
function ImAnim.ClipExists(clip_id) end


-- ============================================================================
-- Stagger Helpers — compute delay for indexed instances
-- ============================================================================

-- Get stagger delay for element at index.
---@param clip_id ImGuiID
---@param index integer
---@return number
function ImAnim.StaggerDelay(clip_id, index) end

-- Play with stagger delay applied.
---@param clip_id ImGuiID
---@param instance_id ImGuiID
---@param index integer
---@return IamInstance
function ImAnim.PlayStagger(clip_id, instance_id, index) end


-- ============================================================================
-- Layering — blend multiple animation instances
-- ============================================================================

-- Start blending into target instance.
---@param instance_id ImGuiID
function ImAnim.LayerBegin(instance_id) end

-- Add source instance with weight.
---@param inst IamInstance
---@param weight number
function ImAnim.LayerAdd(inst, weight) end

-- Finalize blending and normalize weights.
---@param instance_id ImGuiID
function ImAnim.LayerEnd(instance_id) end

-- Get blended float value.
---@param instance_id ImGuiID
---@param channel ImGuiID
---@return boolean ok
---@return number value
function ImAnim.GetBlendedFloat(instance_id, channel) end

-- Get blended vec2 value.
---@param instance_id ImGuiID
---@param channel ImGuiID
---@return boolean ok
---@return ImVec2 value
function ImAnim.GetBlendedVec2(instance_id, channel) end

-- Get blended vec4 value.
---@param instance_id ImGuiID
---@param channel ImGuiID
---@return boolean ok
---@return ImVec4 value
function ImAnim.GetBlendedVec4(instance_id, channel) end

-- Get blended int value.
---@param instance_id ImGuiID
---@param channel ImGuiID
---@return boolean ok
---@return integer value
function ImAnim.GetBlendedInt(instance_id, channel) end
