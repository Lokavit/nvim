local config = require("novel.config")
local collection = require("novel.collection")

local M = {}

function M.setup()
    for _, col in ipairs(config.collections) do
        vim.api.nvim_create_user_command(col.cmd, function(o)
            if o.args == "" then
                collection.pick(col)
            else
                collection.show(col, o.args)
            end
        end, {
            nargs = "?",
            desc = col.desc .. "：预览",
            complete = function(arglead)
                local out = {}
                for _, name in ipairs(collection.list(col)) do
                    if name:sub(1, #arglead) == arglead then
                        table.insert(out, name)
                    end
                end
                return out
            end,
        })
    end
end

return M
