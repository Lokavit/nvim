local date = require("date")

local M = {}

-- 占位符替换
local function render_line(line)
    line = line:gsub("{{date}}", date.be_date())
    line = line:gsub("{{last_modified}}", date.be_date())
    return line
end

-- 把模板渲染成 lines 数组
function M.render(template)
    local out = {}
    for i, line in ipairs(template.lines) do
        out[i] = render_line(line)
    end
    return out
end

-- 把模板应用到当前 buffer
function M.apply(template)
    local lines = M.render(template)

    -- 从第 0 行下方（即第 1 行）强制写入
    vim.fn.append(0, lines)

    -- 移光标
    if template.cursor then
        local row = template.cursor.row
        local col = template.cursor.col
        vim.api.nvim_win_set_cursor(0, { row, col })
    end

    -- 进插入模式
    if template.enter_insert then
        vim.cmd("startinsert!")
    end

    return true
end

-- 找正文起始行号：第二个 --- 的下一行（1-based）
-- 找不到返回 nil
function M.find_content_start(lines)
    local count = 0
    for idx, line in ipairs(lines) do
        if line:match("^---$") then
            count = count + 1
            if count == 2 then
                return idx + 1
            end
        end
    end
    return nil
end

-- 在 YAML 区（第一个 --- 到第二个 ---）内，找以 prefix 开头的行号（1-based）
-- 找不到返回 nil
function M.find_field(lines, prefix)
    local count = 0
    for idx, line in ipairs(lines) do
        if line:match("^---$") then
            count = count + 1
            if count == 2 then return nil end  -- 出了 YAML 区，停
        elseif count == 1 and line:match("^" .. prefix) then
            return idx
        end
    end
    return nil
end

return M
