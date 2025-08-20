-- Vim config
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

-- Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ 
		"nvim-telescope/telescope.nvim", tag = '0.1.8', 
		dependencies = { "nvim-lua/plenary.nvim" }
	},
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = "main",
        build = ":TSUpdate"
    },
}

local opts = {}

-- LazyVim plugin setup
require("lazy").setup(plugins, opts)

-- Telescope configs
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- Treesitter configs
require("nvim-treesitter").install { 'lua', 'vim', 'bash', 'awk', 'csv', 'diff', 'dockerfile', 'dot', 'gitignore', 'go', 'gomod', 'gosum', 'gotmpl', 'helm', 'jq', 'json', 'markdown', 'python', 'regex', 'ssh_config', 'terraform', 'tmux', 'yaml' }
vim.api.nvim_create_autocmd('FileType', {
    pattern = { '<filetype>' },
    callback = function() vim.treesitter.start() end,
})

-- Theme
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

