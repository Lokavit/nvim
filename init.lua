-- ==============================================================================
-- 設置 leader 鍵 (通常建議設為空白鍵)
-- ==============================================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 載入基礎設定
require("config")
require("novel").setup()

local statusline = require("statusline")
local yaml = require("yaml")
local markdown = require("markdown")
-- ==============================================================================
-- 套用主題
-- ==============================================================================
vim.cmd("colorscheme matrix")

vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#121212', fg = '#4eee85' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = '#121212', fg = '#4eee85' })
-- 状态栏背景透明 
vim.cmd [[
  highlight StatusLine ctermbg=NONE guibg=NONE
  highlight StatusLineNC ctermbg=NONE guibg=NONE
  highlight StatusLineTerm ctermbg=NONE guibg=NONE
  highlight StatusLineTermNC ctermbg=NONE guibg=NONE
]]

-- 注册 :Yaml 命令
vim.api.nvim_create_user_command("Yaml", function(o)
    if o.args == "" then
        yaml.pick()
    else
        yaml.insert(o.args)
    end
end, { nargs = "?", complete = function(arglead)
    local out = {}
    for _, item in ipairs(yaml.list()) do
        if item.name:sub(1, #arglead) == arglead then
            table.insert(out, item.name)
        end
    end
    return out
end, desc = "插入 YAML 模板" })

-- 狀態欄自定義
statusline.setup()

-- Markdown 
markdown.setup()


