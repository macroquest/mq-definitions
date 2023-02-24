---@meta

---@alias InstallResult 0 | 1 | 2 | 3 | 4 | 5

local packageman = {}

---@param package_name string # The package name
---@return InstallResult
function packageman.Install(package_name) return 0 end

---Attempts to install and load a given package and return the package if successfull
---@param package_name string # The package name
---@param require_name? string # The package internal export name
---@return nil | any
function packageman.InstallAndLoad(package_name, require_name) return nil end

---Attempts to install and load a given package and return the package, if not successfull it will exit the script
---@param package_name string # The package name
---@param require_name? string # The package internal export name
---@param fail_message? string # Oevrride fail message if package fails to load
---@return any
function packageman.Require(package_name, require_name, fail_message) return nil end

return packageman