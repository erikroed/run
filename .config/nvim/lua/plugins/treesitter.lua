return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        branch = "main",
        lazy = false,
        config = function()
            require("nvim-treesitter").install({
                ensure_installed = { "lua", "vim", "go" },
                auto_install = true,
                highlight = {
                    enable = true,
                },
            })
        end,
    },
}
