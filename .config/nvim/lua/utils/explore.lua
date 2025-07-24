local M = {}


--- Get the path to the parent directory containing .git directory
---@param filepath string starting search point
---@return string|nil path .git directory path or nil if not found
function M.find_git_root(filepath)
    local Path = require("plenary.path")
    local path = Path:new(filepath):parent()
    while not path:joinpath(".git"):exists() do
        if path:is_root() then return nil end
        path = path:parent()
    end
    return path:absolute()
end

--- Get the path to the parent directory containing .git directory starting from the current buffer
---@return string|nil path .git directory path or nil if not found
function M.git_root_from_buffer()
    local Path = require("plenary.path")
    local filepath = vim.api.nvim_buf_get_name(0)
    local path = Path:new(filepath):parent()
    while not path:joinpath(".git"):exists() do
        if path:absolute() == "/" then
            print("No git root found")
            return
        end
        path = path:parent()
    end
    return path:absolute()
end

--- Set the current working directory to the closest directory containing .git
function M.set_cwd_to_git_root()
    local path = M.git_root_from_buffer()
    assert(path ~= nil)
    vim.fn.chdir(path)
end

return M
