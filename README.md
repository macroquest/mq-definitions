# Macroquest Lua Definitions Library
## Overview
This is a set of Lua files, that when placed in a subdirectory under your Lua folder, provide code completion, method signature and brief contexual help, as well as the ability to check types as shown in the examples below.  

## How to Use
- Annotate your Macroquest import as a type of "Mq" as shown.  *Note:* This is case sensitive.
![image](https://user-images.githubusercontent.com/414568/189778453-5910f65d-2dee-45b9-a95e-faf24423c1ed.png)

- Watch the magic start.  Once mq has been identified to the Language server, you will start to see the context menu's populate while coding.
![image](https://user-images.githubusercontent.com/414568/189778777-e386e385-2065-4d00-b3cd-780f3a1946b2.png)

## Installation
The files in this library work with the VSCode Extension found here:
- [VSCode Marketplace - Lua Language Server Extension](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)
The extension can also be installed directly from within VSCode.  Search Extensions for "Lua Language Server" as seen here, and install the one by "sumneko"
![image](https://user-images.githubusercontent.com/414568/189777359-887c937a-5453-4ea0-a8f0-5c41ea4d6b66.png)
- Create a  [settings file for VS Code](https://code.visualstudio.com/docs/getstarted/settings#_workspace-settingsjson-location) if you do not already have one with these settings:
```json
{
  "Lua.runtime.version": "Lua 5.1",
  "Lua.workspace.library": [
    "./relative/path/to/mq/def",
    "./relative/path/to/imgui/def"
  ],
}
```
