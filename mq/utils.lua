---@meta

local fileutils = {}

---Check if a given filepath exists
---@param path string
---@return boolean
function fileutils.Exists(path) return true end

---Sanitize a given filename
---@param filename string
---@return string
function fileutils.Sanitize(filename) return "" end

local stringUtils = {}

---Returns a string array that contains the substrings that are delimited by the specified string delimiter
---@param value string
---@param delimiter string
---@return string[]
function stringUtils.Split(value, delimiter) return {""} end

local urlUtils = {}

---Sanitize a given url
---@param url string
---@return string
function urlUtils.Sanitize(url) return "" end


local utils = {
  File = fileutils,
  String = stringUtils,
  Url = urlUtils,
}

return utils