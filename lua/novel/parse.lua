local M = {}

-- 读文件，返回 lines 数组；失败返回 nil
function M.read_lines(path)
    local f = io.open(path, "r")
    if not f then return nil end
    local lines = {}
    for line in f:lines() do
        table.insert(lines, line)
    end
    f:close()
    return lines
end

return M
