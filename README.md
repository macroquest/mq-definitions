# Macroquest Lua Definitions Library
## Overview
The definitive set of Lua code definitions for Macroquest, ImGui Lua Bindings w/custom features, and Macroquest core Lua helpers.  This library is designed to help you write Lua scripts for Macroquest with greater speed and fewer runtime errors, thanks to LuaLS dynamic type checking, syntax checking, and diagnostic tools.

## Prerequisites 
To get started you'll need the following.
- [Microsoft VS Code](https://code.visualstudio.com/download)
- [The LuaLS Extenstion](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)
- This library installed to a known location on your computer

If You already have these, jump ahead to "Getting Started", otherwise continue with the next section.

## Installation

### Microsoft Visual Studio Code 
- Install the latest version of Visual Studio Code from the [here](https://code.visualstudio.com/download)


### LuaLS (Lua Language Server Extension)
- Install LuaLS either from here [VSCode Marketplace - Lua Language Server Extension](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)
- Or the extension can be installed directly from within VSCode.  Search Extensions for "Lua Language Server" as seen here, and install the one by "sumneko"
![image](https://user-images.githubusercontent.com/414568/189777359-887c937a-5453-4ea0-a8f0-5c41ea4d6b66.png)

### Install these files on your computer
- RedGuides Users can simply "Watch" the resource [here](https://www.redguides.com/community/resources/mq-vs-code-lua-autocomplete-definition-library.2583/) and the files will automatically be placed in a directory called "mq-defintions" under your lua directory when you run the RedGuides launcher.
- If you are not a RedGuides user, or wish to install the files yourself, you can clone the repository from GitHub, or download the zip file from GitHub.
- Unless you need the definitions in a separate location, e.g you're writing scripts for different versions EQ Live and EQ Emu, it is highly recommended that you put the definitions under your Lua directory (i.e. a subdirectory called mq-definitions under the lua directory). This installation will require no additional configurations and you'll be up and running right away.
  - Download the zip from Gihub by following this [link](https://github.com/macroquest/mq-definitions/archive/refs/heads/master.zip), or you can use the web interface. 
  - Clone the repository  
    - If you do not have Git for Windows installed, you can get it at [gitforwindows.org](https://gitforwindows.org/)
    - `git clone https://github.com/macroquest/mq-definitions.git`

## Getting Started
At this point, you should have:
 - VS Code Installed and Working
 - with the LuaLS Extension installed
 - and the files downloaded to a known directory on your computer

- _If you put your mq-defintions in a folder location other than under the lua directory, then you will need to complete the next step, to define where the LuaLS extension can locate the definition files and the Macroquest Lua directory._

- Create or modify [settings file for VS Code](https://code.visualstudio.com/docs/getstarted/settings#_workspace-settingsjson-location) with these settings:
```json
{
  "Lua.runtime.version": "LuaJIT",
  "Lua.workspace.library": [
    "path/to/mq-definitions",
    "path/to/macroquest/lua",
  ],
}
``` 

## How to Use

When requiring the Macroquest, ImGui, or other supported libaries in your Lua script, autocompletion will be provided for fields, methods and enum types.

- Definitions support the following requires. *Note:* This is case sensitive.
```lua
local mq = require('mq')
local imgui = require('ImGui')
local icons = require('mq/icons')
local utils = require('mq/utils')
local packageman = require('mq/packageman')
. . .
```
