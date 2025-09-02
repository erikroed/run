return {
    {
        "NickvanDyke/opencode.nvim",
        dependencies = {
            -- Recommended for better prompt input, and required to use opencode.nvim's embedded terminal
            { "folke/snacks.nvim", opts = { input = { enabled = true } } },
        },
        opts = {
            -- Your configuration, if any — see lua/opencode/config.lua
        },
        keys = {
            -- Recommended keymaps
            {
                "<leader>oA",
                function()
                    require("opencode").ask()
                end,
                desc = "Ask opencode",
            },
            {
                "<leader>oa",
                function()
                    require("opencode").ask("@cursor: ")
                end,
                desc = "Ask opencode about this",
                mode = "n",
            },
            {
                "<leader>oa",
                function()
                    require("opencode").ask("@selection: ")
                end,
                desc = "Ask opencode about selection",
                mode = "v",
            },
            {
                "<leader>ot",
                function()
                    require("opencode").toggle()
                end,
                desc = "Toggle embedded opencode",
            },
            {
                "<leader>on",
                function()
                    require("opencode").command("session_new")
                end,
                desc = "New session",
            },
            {
                "<leader>oy",
                function()
                    require("opencode").command("messages_copy")
                end,
                desc = "Copy last message",
            },
        },
    },
}

