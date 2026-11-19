local M ={}

-- 月份缩写
local MONTHS = {
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
}

-- 佛历时间格式化：DD Mon YYYY BE HH:MM:SS
function M.be_date()
    local t = os.date("*t")
    return string.format(
        "%02d %s %d BE",
        t.day,
        MONTHS[t.month],
        t.year + 543
    )
end

return M
