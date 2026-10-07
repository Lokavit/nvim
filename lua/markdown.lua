local date = require("date")
local wc = require("wordcount")
local statusline = require("statusline")
local yaml = require("yaml")
local yaml_logic = require("yaml.logic")

local M = {}

-- 更新 last_modified
local function update_last_modified(lines)
    local idx = yaml_logic.find_field(lines, "last_modified:")
    if not idx then return end
    local new_line = "last_modified: '" .. date.be_date() .. "'"
    vim.api.nvim_buf_set_lines(0, idx - 1, idx, false, { new_line })
end

-- 统计并回写字数，同时同步到 statusline
local function update_word_count(lines)
    local start = yaml_logic.find_content_start(lines)
    if not start then return end

    local word_count = wc.count_lines(lines, start)
    statusline.word_count = word_count

    local idx = yaml_logic.find_field(lines, "words:")
    if not idx then return end
    vim.api.nvim_buf_set_lines(0, idx - 1, idx, false, { "words: " .. word_count })
end

-- 从 YAML 的 words: 字段读回字数，同步到 statusline
local function load_word_count(lines)
    local idx = yaml_logic.find_field(lines, "words:")
    if not idx then return end
    local count = lines[idx]:match("^words:%s*(%d+)")
    if count then
        statusline.word_count = tonumber(count) or 0
    end
end

function M.setup()
    -- markdown buffer-local 键位
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
            vim.keymap.set("n", "<leader>y", function() yaml.insert("draft") end,
                { buffer = true, desc = "插入正文 YAML" })
            vim.keymap.set("i", "；；", "　　",
                { buffer = true, desc = "插入段首两个全角空格" })
        end,
    })

    -- 保存时更新 last_modified 和 words
    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.md",
        callback = function()
            local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
            if not yaml_logic.find_content_start(lines) then return end
            update_last_modified(lines)
            update_word_count(lines)
        end,
    })

    -- 打开 markdown 时从 YAML 读回 words
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufEnter" }, {
        pattern = "*.md",
        callback = function()
            local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
            load_word_count(lines)
        end,
    })
end

return M
