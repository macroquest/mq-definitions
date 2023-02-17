# Macroquest Lua Definitions Library
## Overview
This is a set of Lua files, that when placed in a subdirectory under your scripts development folder, provide code completion, method signature and brief contexual help, as well as the ability to check types as shown in the examples below. 

 :warning: **Do not put this in the `Macroquest/Lua` folder**

## Installation
The files in this library work with the VSCode Extension found here:
- [VSCode Marketplace - Lua Language Server Extension](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)
The extension can also be installed directly from within VSCode.  Search Extensions for "Lua Language Server" as seen here, and install the one by "sumneko"
![image](https://user-images.githubusercontent.com/414568/189777359-887c937a-5453-4ea0-a8f0-5c41ea4d6b66.png)
- Create a  [settings file for VS Code](https://code.visualstudio.com/docs/getstarted/settings#_workspace-settingsjson-location) if you do not already have one with these settings:
```json
{
  "Lua.runtime.version": "LuaJIT",
  "Lua.workspace.library": [
    "./relative/path/to/mq/def",
    "./relative/path/to/imgui/def"
  ],
}
``` 

## How to Use

When requiring the MQ or ImGui bindings in your Lua script, just annotate the require with a type MQ or ImGui as shown below.  This will then provide autocomplete for ImGui methods and enum types.

- Annotate your Macroquest import as a type of `Mq` as shown.  *Note:* This is case sensitive.
```lua
--- @type Mq
local mq = require 'mq'

. . .
```
- Annotate your ImGui import as a type of `ImGui` as shown.  *Note:* This is case sensitive.
```lua
--- @type ImGui
local imgui = require 'ImGui'

. . .
```

- Watch the magic start.  Once mq has been identified to the Language server, you will start to see the context menu's populate while coding.
![image](https://user-images.githubusercontent.com/414568/189778777-e386e385-2065-4d00-b3cd-780f3a1946b2.png)
