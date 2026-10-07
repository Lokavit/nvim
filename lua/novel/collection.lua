local config = require("novel.config")
local parse = require("novel.parse")
local float = require("novel.float")

local M = {}

-- 展开根目录
local function root()
    return vim.fn.expand(config.root)
end

-- 列出 collection 下所有条目名（去 .md），按文件名排序
function M.list(col)
    local dir = root() .. "/" .. col.dir
    local files = vim.fn.glob(dir .. "/*.md", false, true)
    local names = {}
    for _, path in ipairs(files) do
        local name = vim.fn.fnamemodify(path, ":t:r")
        table.insert(names, name)
    end
    table.sort(names)
    return names
end

-- 找到条目对应的文件路径；不存在返回 nil
function M.find(col, name)
    local path = root() .. "/" .. col.dir .. "/" .. name .. ".md"
    if vim.fn.filereadable(path) == 1 then
        return path
    end
    return nil
end

-- 显示某条目的全文
function M.show(col, name)
    local path = M.find(col, name)
    if not path then
        vim.notify("未找到：" .. col.desc .. " / " .. name, vim.log.levels.ERROR)
        return
    end
    local lines = parse.read_lines(path)
    if not lines then
        vim.notify("无法读取文件：" .. path, vim.log.levels.ERROR)
        return
    end
    float.open(lines, name)
end

-- 弹出选择器，选一个条目并显示
function M.pick(col)
    local names = M.list(col)
    if #names == 0 then
        vim.notify("没有找到任何" .. col.desc, vim.log.levels.WARN)
        return
    end
    vim.ui.select(names, {
        prompt = "选择" .. col.desc,
    }, function(choice)
        if choice then
            M.show(col, choice)
        end
    end)
end

return M
