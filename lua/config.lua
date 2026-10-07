-- ==============================================================================
-- 基礎設定 (Basic Options)
-- ==============================================================================
vim.opt.number = true -- 顯示絕對行號
vim.opt.relativenumber = true -- 相對行號 (對移動非常有幫助)

vim.opt.termguicolors = true -- 啟用真彩色支援

-- 縮排設定
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- 搜尋設定
vim.opt.ignorecase = true -- 忽略大小寫
vim.opt.smartcase = true  -- 除非搜尋關鍵字有大寫，否則不忽略

-- ==============================================================================
-- 寫作專屬：原生排版與折行優化
-- ==============================================================================

-- 限制正文的最大文本寬度
vim.opt.textwidth = 80

-- 啟用自動折行 (Wrap)
vim.opt.wrap = true

-- 智能折行
vim.opt.linebreak = true

-- 保持光標上下有 8 行的餘量
vim.opt.scrolloff = 8

-- 淡淡地高亮當前游標所在的整行
vim.opt.cursorline = true

-- 其他設定
vim.opt.mouse = "a"               -- 啟用滑鼠
vim.opt.clipboard = "unnamedplus" -- 允許 Neovim 使用系統剪貼簿


-- ==============================================================================
-- 基礎按鍵映射 (Basic Keymaps)
-- ==============================================================================
-- 取消搜尋高亮
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear search highlights" })
    





