require("JiKuai.remap")
require("JiKuai.packer")
require("JiKuai.set")

local DefaultCodePath = "~/Programming/template/default.cpp"
local LineNumber = 79
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'cpp',
    callback = function()
        vim.api.nvim_create_user_command('New', string.format('%s|0r %s|$|d|%d', '%d|redraw', DefaultCodePath, LineNumber), { desc = 'Pasting the template code' })
    end
})
