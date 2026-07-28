vim.keymap.set(
    "n",
    "<leader>fm",
    function()
        require("conform").format()
    end,
    {
        desc = "Format code"
    }
)
