local M ={}

-- 计算单行字数
function M.count_line(line)
    if not line or line == "" then
        return 0
    end
    line = line:gsub("%s", "")
    line = line:gsub("\xe3\x80\x80", "")
    if line == "" then
        return 0
    end
    return vim.fn.strchars(line)
end

-- 计算多行字数
function M.count_lines(lines, start_idx)
    start_idx = start_idx or 1
    local total = 0
    for i = start_idx, #lines do
        total = total +M.count_line(lines[i])
    end
    return total
end

return M
