vim.opt.clipboard = "unnamedplus"
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.qml",
    callback = function()
        vim.fn.system({ "qmlformat", "-i", vim.fn.expand("%:p") })
    end,
})
vim.g.mapleader = " "
require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.lsp")
