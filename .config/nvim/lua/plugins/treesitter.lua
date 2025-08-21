return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install { 
            'lua', 'vim', 'bash', 'awk', 'csv', 'diff', 'dockerfile', 'dot', 'gitignore', 
            'go', 'gomod', 'gosum', 'gotmpl', 'helm', 'jq', 'json', 'markdown', 'python', 'regex', 
            'ssh_config', 'terraform', 'tmux', 'yaml' 
        }

        vim.api.nvim_create_autocmd('FileType', {
            pattern = { '<filetype>' },
            callback = function() vim.treesitter.start() end,
        })
    end
}

