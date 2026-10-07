local tpl = require("yaml.tpl")
local logic = require("yaml.logic")

local M = {}

-- 列出所有模板：{ {name=, desc=}, ... }
function M.list()
    local out = {}
    for name, t in pairs(tpl) do
        table.insert(out, { name = name, desc = t.desc or name })
    end
    table.sort(out, function(a, b) return a.name < b.name end)
    return out
end

-- 取单个模板表，不存在返回 nil
function M.get(name)
    return tpl[name]
end

-- 按名字插入
function M.insert(name)
    local t = M.get(name)
    if not t then
        vim.notify("YAML 模板不存在: " .. tostring(name), vim.log.levels.ERROR)
        return false
    end
    return logic.apply(t)
end

-- 弹选择器
function M.pick()
    local items = M.list()
    if #items == 0 then
        vim.notify("没有任何 YAML 模板", vim.log.levels.WARN)
        return
    end
    vim.ui.select(items, {
        prompt = "选择 YAML 模板",
        format_item = function(item)
            return item.desc .. " (" .. item.name .. ")"
        end,
    }, function(choice)
        if choice then
            M.insert(choice.name)
        end
    end)
end

return M
