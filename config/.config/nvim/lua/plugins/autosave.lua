return {
    {
        "okuuva/auto-save.nvim",
        cmd = "ASToggle",
        event = { "InsertLeave", "TextChanged" },
        opts = {
            enabled = true,
            execution_message = {
                enabled = false, -- Désactive le message "Saved at..." en bas pour rester discret
            },
            trigger_events = {
                immediate_save = { "BufLeave", "FocusLost" },
                defer_save = { "InsertLeave", "TextChanged" },
            },
            condition = function(buf)
                -- Ne sauvegarde pas automatiquement les fichiers spéciaux (ex: NVTree, Harpoon, Terminal)
                local filetype = vim.fn.getbufvar(buf, "&filetype")
                if vim.tbl_contains({ "neo-tree", "Trouble", "qf" }, filetype) then
                    return false
                end
                return true
            end,
        },
    },
}
