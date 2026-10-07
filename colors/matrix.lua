-- 1. 清除現有的高亮設定
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

-- 2. 設定主題名稱
vim.g.colors_name = "matrix"

-- ==============================================================================
-- 3. 定義顏色 (Highlight Groups) - 護眼寫作優化版
-- ==============================================================================

-- Normal
vim.api.nvim_set_hl(0, "Normal", { fg = "#e3e3e3", bg = "NONE" })

-- 行號欄
vim.api.nvim_set_hl(0, "LineNr", { fg = "#5c6370", bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#4eee85", bg = "NONE", bold = true })

-- CursorLine
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#212121" })

-- 註解
vim.api.nvim_set_hl(0, "Comment", { fg = "#5c6370", italic = true })

-- 關鍵字
vim.api.nvim_set_hl(0, "Keyword", { fg = "#4eee85", bold = true })

-- ==============================================================================
-- 4. Markdown 專屬高亮（Neovim 內建 markdown 語法用的是 markdown* 組）
-- ==============================================================================

-- 標題 (# ## ### ...)
vim.api.nvim_set_hl(0, "markdownH1", { fg = "#4eee85", bold = true })
vim.api.nvim_set_hl(0, "markdownH2", { fg = "#4eee85", bold = true })
vim.api.nvim_set_hl(0, "markdownH3", { fg = "#4eee85", bold = true })
vim.api.nvim_set_hl(0, "markdownH4", { fg = "#4eee85", bold = true })
vim.api.nvim_set_hl(0, "markdownH5", { fg = "#4eee85", bold = true })
vim.api.nvim_set_hl(0, "markdownH6", { fg = "#4eee85", bold = true })

-- 行內 code 與 code block
vim.api.nvim_set_hl(0, "markdownCode", { fg = "#a6e3a1", bg = "#2a2a2a" })
vim.api.nvim_set_hl(0, "markdownCodeBlock", { fg = "#a6e3a1", bg = "#2a2a2a" })
vim.api.nvim_set_hl(0, "markdownCodeDelimiter", { fg = "#5c6370", bg = "#2a2a2a" })

-- 加粗 / 斜體 / 加粗斜體
vim.api.nvim_set_hl(0, "markdownBold", { fg = "#ffb07c", bold = true, underline = false })
vim.api.nvim_set_hl(0, "markdownItalic", { fg = "#a6da95", italic = true })
vim.api.nvim_set_hl(0, "markdownBoldItalic", { fg = "#4eee85", bold = true, italic = true })

-- 列表符號 (-, *, 1.)
vim.api.nvim_set_hl(0, "markdownListMarker", { fg = "#4eee85" })
vim.api.nvim_set_hl(0, "markdownOrderedListMarker", { fg = "#4eee85" })

-- 引用塊 (>)
vim.api.nvim_set_hl(0, "markdownBlockquote", { fg = "#8592a9", italic = true })

-- 超連結
vim.api.nvim_set_hl(0, "markdownLinkText", { fg = "#58a6ff", underline = true })
vim.api.nvim_set_hl(0, "markdownUrl", { fg = "#58a6ff", underline = true })


-- ==============================================================================
-- 5. 通用組（保留你原有的喜好）
-- ==============================================================================

vim.api.nvim_set_hl(0, "Title", { fg = "#4eee85", bold = true })
vim.api.nvim_set_hl(0, "Underlined", { fg = "#58a6ff", underline = true })

vim.api.nvim_set_hl(0, "htmlBold", { fg = "#ffb07c", bold = true })
vim.api.nvim_set_hl(0, "htmlItalic", { fg = "#a6da95", italic = true })
vim.api.nvim_set_hl(0, "htmlBoldItalic", { fg = "#4eee85", bold = true, italic = true })

vim.api.nvim_set_hl(0, "Constant", { fg = "#a6e3a1" })
vim.api.nvim_set_hl(0, "Identifier", { fg = "#4eee85" })
vim.api.nvim_set_hl(0, "Special", { fg = "#8592a9", italic = true })
