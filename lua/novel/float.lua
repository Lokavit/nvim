local M = {}

-- 打开浮窗显示 lines
-- title: 可选，显示在浮窗顶部
function M.open(lines, title)
    -- 创建 scratch buffer
    local buf = vim.api.nvim_create_buf(false, true)

    -- 写入内容
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    -- buffer 选项
    vim.bo[buf].modifiable = false
    vim.bo[buf].bufhidden = "wipe"

    -- 计算浮窗尺寸：80% x 80%，居中
    local total_w = vim.o.columns
    local total_h = vim.o.lines
    local width  = math.floor(total_w * 0.8)
    local height = math.floor(total_h * 0.8)
    local row    = math.floor((total_h - height) / 2)
    local col    = math.floor((total_w - width) / 2)

    -- 打开浮窗
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
        title = title,
        title_pos = "center",
    })
    -- 窗口选项（必须在窗口存在之后设置）
    vim.wo[win].wrap = true
    -- 关闭键位：q
    vim.keymap.set("n", "q", function()
        vim.api.nvim_win_close(win, true)
    end, { buffer = buf, desc = "关闭浮窗" })
end

return M
