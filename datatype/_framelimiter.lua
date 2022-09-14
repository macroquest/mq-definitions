---@class framelimiter
---@field public BackgroundFPS fun():number Value of the target background fps setting.
---@field public ClearScreen fun():boolean Value of the clear screen when not rendering setting.
---@field public CPU fun():number Current CPU usage as %
---@field public Enabled fun():boolean TRUE if the frame limiter feature is currently active.
---@field public ForegroundFPS fun():number Value of the target foreground fps setting.
---@field public MinSimulationFPS fun():number Value of the minimum simualtion rate setting.
---@field public RenderFPS fun():number Current graphics scene frame rate (visible fps).
---@field public SaveByChar fun():boolean TRUE if settings for the frame limiter are being saved by character.
---@field public SimulationFPS fun():number Current simulation frame rate (game updates per second).
---@field public Status fun():string Either "Foreground" or "Background".