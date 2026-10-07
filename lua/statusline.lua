local M ={}

M.word_count = 0

function M.render()
    local  left = " %f %m %r"
    local align = "%="
    local right = ""
    if vim.bo.filetype == "markdown" then
        right = "words: " .. M.word_count .. " | "
    end
    right = right .. "%l:%c [%p%%]"
    return left .. align .. right
end

function M.setup()
    vim.opt.statusline = "%!v:lua.require'statusline'.render()"
end

return M



